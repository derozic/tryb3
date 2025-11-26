import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/websocket_service.dart';
import '../models/friend_model.dart';

class NetworkRepository {
  final ApiService _apiService;
  final WebSocketService _webSocketService;

  NetworkRepository(this._apiService, this._webSocketService);

  // Friends Management
  Future<List<FriendConnection>> getFriends({
    int page = 1,
    int pageSize = 20,
    FriendshipStatus? status,
    String? search,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
        if (status != null) 'status': status.name,
        if (search != null && search.isNotEmpty) 'search': search,
      };

      final response = await _apiService.get('/friends/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => FriendConnection.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch friends: $e');
    }
  }

  Future<NetworkStats> getNetworkStats() async {
    try {
      final response = await _apiService.get('/friends/stats/');
      return NetworkStats.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch network stats: $e');
    }
  }

  Future<FriendConnection> getFriendConnection(String userId) async {
    try {
      final response = await _apiService.get('/friends/$userId/');
      return FriendConnection.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch friend connection: $e');
    }
  }

  Future<void> removeFriend(String userId) async {
    try {
      await _apiService.delete('/friends/$userId/');
    } catch (e) {
      throw Exception('Failed to remove friend: $e');
    }
  }

  Future<void> blockUser(String userId) async {
    try {
      await _apiService.post('/friends/$userId/block/');
    } catch (e) {
      throw Exception('Failed to block user: $e');
    }
  }

  Future<void> unblockUser(String userId) async {
    try {
      await _apiService.post('/friends/$userId/unblock/');
    } catch (e) {
      throw Exception('Failed to unblock user: $e');
    }
  }

  Future<void> muteUser(String userId) async {
    try {
      await _apiService.post('/friends/$userId/mute/');
    } catch (e) {
      throw Exception('Failed to mute user: $e');
    }
  }

  Future<void> unmuteUser(String userId) async {
    try {
      await _apiService.post('/friends/$userId/unmute/');
    } catch (e) {
      throw Exception('Failed to unmute user: $e');
    }
  }

  Future<void> addToCloseFriends(String userId) async {
    try {
      await _apiService.post('/friends/$userId/close-friends/');
    } catch (e) {
      throw Exception('Failed to add to close friends: $e');
    }
  }

  Future<void> removeFromCloseFriends(String userId) async {
    try {
      await _apiService.delete('/friends/$userId/close-friends/');
    } catch (e) {
      throw Exception('Failed to remove from close friends: $e');
    }
  }

  // Friend Requests
  Future<List<FriendRequest>> getFriendRequests({
    int page = 1,
    int pageSize = 20,
    FriendRequestStatus? status,
    bool sent = false,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
        if (status != null) 'status': status.name,
        'sent': sent,
      };

      final response = await _apiService.get('/friend-requests/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => FriendRequest.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch friend requests: $e');
    }
  }

  Future<FriendRequest> sendFriendRequest(SendFriendRequestModel request) async {
    try {
      final response = await _apiService.post('/friend-requests/', data: request.toJson());
      final friendRequest = FriendRequest.fromJson(response.data);
      
      // Send real-time notification
      _webSocketService.sendMessage('friend_request_sent', {
        'receiver_id': request.userId,
        'request': friendRequest.toJson(),
      });
      
      return friendRequest;
    } catch (e) {
      throw Exception('Failed to send friend request: $e');
    }
  }

  Future<FriendRequest> acceptFriendRequest(String requestId) async {
    try {
      final response = await _apiService.post('/friend-requests/$requestId/accept/');
      final friendRequest = FriendRequest.fromJson(response.data);
      
      // Send real-time notification
      _webSocketService.sendMessage('friend_request_accepted', {
        'sender_id': friendRequest.senderId,
        'request': friendRequest.toJson(),
      });
      
      return friendRequest;
    } catch (e) {
      throw Exception('Failed to accept friend request: $e');
    }
  }

  Future<FriendRequest> declineFriendRequest(String requestId) async {
    try {
      final response = await _apiService.post('/friend-requests/$requestId/decline/');
      return FriendRequest.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to decline friend request: $e');
    }
  }

  Future<void> cancelFriendRequest(String requestId) async {
    try {
      await _apiService.delete('/friend-requests/$requestId/');
    } catch (e) {
      throw Exception('Failed to cancel friend request: $e');
    }
  }

  // User Discovery
  Future<List<UserSuggestion>> getUserSuggestions({
    int page = 1,
    int pageSize = 20,
    SuggestionReason? reason,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
        if (reason != null) 'reason': reason.name,
      };

      final response = await _apiService.get('/friends/suggestions/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => UserSuggestion.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch user suggestions: $e');
    }
  }

  Future<List<FriendConnection>> searchUsers(String query, {
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'q': query,
        'page': page,
        'page_size': pageSize,
      };

      final response = await _apiService.get('/users/search/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => FriendConnection.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to search users: $e');
    }
  }

  Future<List<FriendConnection>> getMutualFriends(String userId, {
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
      };

      final response = await _apiService.get('/friends/$userId/mutual/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => FriendConnection.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch mutual friends: $e');
    }
  }

  // Real-time streams
  Stream<FriendRequest> get friendRequestStream => _webSocketService.messageStream
      .where((data) => data['type'] == 'friend_request_received')
      .map((data) => FriendRequest.fromJson(data['request']));

  Stream<Map<String, dynamic>> get friendshipUpdateStream => _webSocketService.messageStream
      .where((data) => data['type'] == 'friendship_updated');

  Stream<Map<String, dynamic>> get userOnlineStatusStream => _webSocketService.messageStream
      .where((data) => data['type'] == 'user_status_changed');

  // Privacy and blocking
  Future<List<FriendConnection>> getBlockedUsers({
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
      };

      final response = await _apiService.get('/friends/blocked/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => FriendConnection.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch blocked users: $e');
    }
  }

  Future<void> reportUser(String userId, String reason, String? description) async {
    try {
      await _apiService.post('/users/$userId/report/', data: {
        'reason': reason,
        if (description != null) 'description': description,
      });
    } catch (e) {
      throw Exception('Failed to report user: $e');
    }
  }

  // Bulk operations
  Future<void> syncContacts(List<Map<String, String>> contacts) async {
    try {
      await _apiService.post('/friends/sync-contacts/', data: {
        'contacts': contacts,
      });
    } catch (e) {
      throw Exception('Failed to sync contacts: $e');
    }
  }

  Future<void> dismissSuggestion(String userId) async {
    try {
      await _apiService.post('/friends/suggestions/$userId/dismiss/');
    } catch (e) {
      throw Exception('Failed to dismiss suggestion: $e');
    }
  }

  Future<void> updatePrivacySettings(Map<String, dynamic> settings) async {
    try {
      await _apiService.patch('/users/privacy/', data: settings);
    } catch (e) {
      throw Exception('Failed to update privacy settings: $e');
    }
  }
}

final networkRepositoryProvider = Provider<NetworkRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  final webSocketService = ref.watch(webSocketServiceProvider);
  return NetworkRepository(apiService, webSocketService);
});