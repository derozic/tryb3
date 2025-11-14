import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logger/logger.dart';

part 'firebase_service.g.dart';

@riverpod
FirebaseService firebaseService(FirebaseServiceRef ref) {
  return FirebaseService();
}

class FirebaseService {
  static final _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  final Logger _logger = Logger();
  
  // Firebase instances
  FirebaseAuth get auth => FirebaseAuth.instance;
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;
  FirebaseMessaging get messaging => FirebaseMessaging.instance;
  FirebaseAnalytics get analytics => FirebaseAnalytics.instance;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  Future<void> initialize() async {
    try {
      if (_isInitialized) return;
      
      _logger.i('Initializing Firebase...');
      
      await Firebase.initializeApp();
      
      // Configure Firestore settings
      firestore.settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
      );
      
      // Enable offline persistence for better user experience
      await firestore.enableNetwork();
      
      _isInitialized = true;
      _logger.i('Firebase initialized successfully');
      
    } catch (e, stackTrace) {
      _logger.e('Failed to initialize Firebase', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> initializePushNotifications() async {
    try {
      // Request permission for iOS
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        _logger.i('User granted permission for notifications');
        
        // Get the token
        String? token = await messaging.getToken();
        if (token != null) {
          _logger.i('FCM Token: $token');
          // TODO: Send token to backend for storage
        }
        
        // Listen for token refresh
        messaging.onTokenRefresh.listen((token) {
          _logger.i('FCM Token refreshed: $token');
          // TODO: Update token on backend
        });
        
      } else {
        _logger.w('User declined notifications permission');
      }
      
    } catch (e, stackTrace) {
      _logger.e('Failed to initialize push notifications', error: e, stackTrace: stackTrace);
    }
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    _logger.i('Handling background message: ${message.messageId}');
    // Handle background messages
  }

  Future<void> setupMessageHandlers() async {
    // Handle messages when app is in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _logger.i('Received foreground message: ${message.messageId}');
      // Show in-app notification or update UI
    });

    // Handle messages when app is in background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _logger.i('Message opened app: ${message.messageId}');
      // Navigate to specific screen based on message data
    });

    // Handle messages when app is terminated
    RemoteMessage? initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      _logger.i('App opened from terminated state: ${initialMessage.messageId}');
      // Handle the initial message
    }
  }

  Future<void> logEvent(String name, Map<String, Object>? parameters) async {
    try {
      await analytics.logEvent(name: name, parameters: parameters);
      _logger.d('Logged analytics event: $name');
    } catch (e) {
      _logger.e('Failed to log analytics event: $name', error: e);
    }
  }

  Future<void> setUserId(String userId) async {
    try {
      await analytics.setUserId(id: userId);
      _logger.d('Set analytics user ID: $userId');
    } catch (e) {
      _logger.e('Failed to set analytics user ID', error: e);
    }
  }

  Future<void> setUserProperty(String name, String value) async {
    try {
      await analytics.setUserProperty(name: name, value: value);
      _logger.d('Set analytics user property: $name = $value');
    } catch (e) {
      _logger.e('Failed to set analytics user property', error: e);
    }
  }
}