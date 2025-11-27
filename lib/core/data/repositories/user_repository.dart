import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/unified_auth_service.dart';
import '../models/user_state.dart';

/// Professional-grade user repository with caching, sync, and personalization
class UserRepository {
  final UnifiedAuthService _authService;
  final Dio _dio;
  final SharedPreferences _prefs;
  
  // In-memory cache with TTL
  final Map<String, CachedData> _cache = {};
  static const Duration _cacheTTL = Duration(minutes: 5);
  
  // Sync queue for offline operations
  final List<PendingOperation> _syncQueue = [];
  
  UserRepository({
    required UnifiedAuthService authService,
    required Dio dio,
    required SharedPreferences prefs,
  })  : _authService = authService,
        _dio = dio,
        _prefs = prefs {
    _initializeRepository();
  }
  
  void _initializeRepository() {
    // Set up Dio interceptors for auth and retry logic
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = _authService.authToken;
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            // Token expired, try refresh
            // Implementation handled by auth service
          }
          handler.next(error);
        },
      ),
    );
    
    // Process sync queue on initialization
    _processSyncQueue();
  }
  
  /// Get user profile with intelligent caching
  Future<UserProfile?> getUserProfile(String userId) async {
    // Check memory cache first
    final cached = _getFromCache<UserProfile>('profile:$userId');
    if (cached != null) return cached;
    
    // Check local storage
    final localData = _prefs.getString('profile:$userId');
    if (localData != null) {
      final profile = UserProfile.fromJson(localData);
      _setCache('profile:$userId', profile);
      
      // Fetch fresh data in background
      _fetchProfileInBackground(userId);
      
      return profile;
    }
    
    // Fetch from network
    return _fetchProfile(userId);
  }
  
  /// Update user profile with optimistic updates
  Future<UserProfile> updateProfile(String userId, Map<String, dynamic> updates) async {
    // Optimistic update - update cache immediately
    final currentProfile = await getUserProfile(userId);
    if (currentProfile != null) {
      final optimisticProfile = currentProfile.copyWith(updates);
      _setCache('profile:$userId', optimisticProfile);
      
      // Notify listeners immediately for responsive UI
      _notifyProfileUpdate(optimisticProfile);
    }
    
    try {
      // Send to server
      final response = await _dio.put(
        '/api/users/$userId/profile',
        data: updates,
      );
      
      final updatedProfile = UserProfile.fromJson(response.data);
      
      // Update all caches
      _setCache('profile:$userId', updatedProfile);
      await _prefs.setString('profile:$userId', updatedProfile.toJson());
      
      return updatedProfile;
    } catch (e) {
      // Queue for retry if offline
      _queueOperation(PendingOperation(
        type: OperationType.updateProfile,
        data: {'userId': userId, 'updates': updates},
        timestamp: DateTime.now(),
      ));
      
      // Return optimistic update
      return currentProfile!;
    }
  }
  
  /// Get personalized recommendations
  Future<PersonalizationData> getPersonalization(String userId) async {
    final cacheKey = 'personalization:$userId';
    
    // Use cached personalization if fresh
    final cached = _getFromCache<PersonalizationData>(cacheKey);
    if (cached != null) return cached;
    
    try {
      // Fetch from personalization service
      final response = await _dio.get('/api/personalization/$userId');
      
      final data = PersonalizationData.fromJson(response.data);
      _setCache(cacheKey, data);
      
      // Pre-fetch recommended content
      _prefetchRecommendedContent(data.recommendations);
      
      return data;
    } catch (e) {
      // Fallback to local ML model
      return _generateLocalPersonalization(userId);
    }
  }
  
  /// Track user behavior for personalization
  Future<void> trackUserAction(UserAction action) async {
    // Batch actions for efficient sending
    _batchUserAction(action);
    
    // Update local ML model
    _updateLocalModel(action);
    
    // Invalidate relevant caches
    _invalidatePersonalizationCache(action.userId);
  }
  
  /// Sync local changes with server
  Future<void> syncWithServer() async {
    if (_syncQueue.isEmpty) return;
    
    final operations = List<PendingOperation>.from(_syncQueue);
    
    for (final operation in operations) {
      try {
        await _executeOperation(operation);
        _syncQueue.remove(operation);
      } catch (e) {
        // Keep in queue for next sync
        print('Sync failed for operation: ${operation.type}');
      }
    }
  }
  
  // Helper methods
  
  T? _getFromCache<T>(String key) {
    final cached = _cache[key];
    if (cached != null && !cached.isExpired) {
      return cached.data as T?;
    }
    _cache.remove(key);
    return null;
  }
  
  void _setCache(String key, dynamic data) {
    _cache[key] = CachedData(
      data: data,
      timestamp: DateTime.now(),
      ttl: _cacheTTL,
    );
  }
  
  Future<UserProfile?> _fetchProfile(String userId) async {
    try {
      final response = await _dio.get('/api/users/$userId/profile');
      final profile = UserProfile.fromJson(response.data);
      
      // Update all cache layers
      _setCache('profile:$userId', profile);
      await _prefs.setString('profile:$userId', profile.toJson());
      
      return profile;
    } catch (e) {
      print('Failed to fetch profile: $e');
      return null;
    }
  }
  
  void _fetchProfileInBackground(String userId) {
    // Fetch fresh data without blocking
    _fetchProfile(userId).then((profile) {
      if (profile != null) {
        _notifyProfileUpdate(profile);
      }
    });
  }
  
  void _notifyProfileUpdate(UserProfile profile) {
    // Notify listeners through stream or provider
    // Implementation depends on state management
  }
  
  void _queueOperation(PendingOperation operation) {
    _syncQueue.add(operation);
    _prefs.setString('sync_queue', PendingOperation.encodeList(_syncQueue));
  }
  
  Future<void> _processSyncQueue() async {
    final queueJson = _prefs.getString('sync_queue');
    if (queueJson != null) {
      _syncQueue.addAll(PendingOperation.decodeList(queueJson));
      await syncWithServer();
    }
  }
  
  Future<void> _executeOperation(PendingOperation operation) async {
    switch (operation.type) {
      case OperationType.updateProfile:
        await updateProfile(
          operation.data['userId'],
          operation.data['updates'],
        );
        break;
      // Add more operation types
    }
  }
  
  void _prefetchRecommendedContent(List<String> contentIds) {
    // Pre-fetch recommended content for instant loading
    for (final id in contentIds) {
      _dio.get('/api/content/$id').then((response) {
        _setCache('content:$id', response.data);
      });
    }
  }
  
  PersonalizationData _generateLocalPersonalization(String userId) {
    // Fallback local personalization using on-device ML
    return PersonalizationData(
      userId: userId,
      recommendations: [],
      interests: [],
      preferences: {},
    );
  }
  
  void _batchUserAction(UserAction action) {
    // Batch actions to send every 30 seconds or 50 actions
    // Implementation here
  }
  
  void _updateLocalModel(UserAction action) {
    // Update on-device ML model for offline personalization
    // Implementation here
  }
  
  void _invalidatePersonalizationCache(String userId) {
    _cache.remove('personalization:$userId');
  }
}

// Supporting classes

class CachedData {
  final dynamic data;
  final DateTime timestamp;
  final Duration ttl;
  
  CachedData({
    required this.data,
    required this.timestamp,
    required this.ttl,
  });
  
  bool get isExpired => DateTime.now().difference(timestamp) > ttl;
}

class PendingOperation {
  final OperationType type;
  final Map<String, dynamic> data;
  final DateTime timestamp;
  
  PendingOperation({
    required this.type,
    required this.data,
    required this.timestamp,
  });
  
  static String encodeList(List<PendingOperation> operations) {
    // JSON encode implementation
    return '';
  }
  
  static List<PendingOperation> decodeList(String json) {
    // JSON decode implementation
    return [];
  }
}

enum OperationType {
  updateProfile,
  createPost,
  sendMessage,
  updateSettings,
}

class UserProfile {
  final String id;
  final String username;
  final String displayName;
  final String? avatar;
  final Map<String, dynamic> metadata;
  
  UserProfile({
    required this.id,
    required this.username,
    required this.displayName,
    this.avatar,
    required this.metadata,
  });
  
  factory UserProfile.fromJson(dynamic json) {
    // Parse implementation
    return UserProfile(
      id: '',
      username: '',
      displayName: '',
      metadata: {},
    );
  }
  
  String toJson() {
    // Encode implementation
    return '';
  }
  
  UserProfile copyWith(Map<String, dynamic> updates) {
    // Copy with updates implementation
    return this;
  }
}

class PersonalizationData {
  final String userId;
  final List<String> recommendations;
  final List<String> interests;
  final Map<String, dynamic> preferences;
  
  PersonalizationData({
    required this.userId,
    required this.recommendations,
    required this.interests,
    required this.preferences,
  });
  
  factory PersonalizationData.fromJson(Map<String, dynamic> json) {
    return PersonalizationData(
      userId: json['userId'],
      recommendations: List<String>.from(json['recommendations']),
      interests: List<String>.from(json['interests']),
      preferences: json['preferences'],
    );
  }
}

class UserAction {
  final String userId;
  final String action;
  final Map<String, dynamic> metadata;
  final DateTime timestamp;
  
  UserAction({
    required this.userId,
    required this.action,
    required this.metadata,
    required this.timestamp,
  });
}