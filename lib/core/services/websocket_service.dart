import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logger/logger.dart';
import '../../shared/models/post_model.dart';
import '../../shared/models/user_model.dart';

part 'websocket_service.g.dart';

@riverpod
WebSocketService webSocketService(WebSocketServiceRef ref) {
  final service = WebSocketService();
  ref.onDispose(() => service.dispose());
  return service;
}

enum WebSocketEventType {
  postCreated,
  postUpdated,
  postDeleted,
  postLiked,
  postUnliked,
  postCommented,
  userStatusChanged,
  notificationReceived,
  heartbeat,
  connected,
  disconnected,
  error,
}

class WebSocketEvent {
  final WebSocketEventType type;
  final Map<String, dynamic> data;
  final DateTime timestamp;

  WebSocketEvent({
    required this.type,
    required this.data,
    required this.timestamp,
  });

  factory WebSocketEvent.fromJson(Map<String, dynamic> json) {
    return WebSocketEvent(
      type: WebSocketEventType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => WebSocketEventType.heartbeat,
      ),
      data: json['data'] ?? {},
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'data': data,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

enum WebSocketConnectionState {
  disconnected,
  connecting,
  connected,
  reconnecting,
  error,
}

class WebSocketService {
  static final _instance = WebSocketService._internal();
  factory WebSocketService() => _instance;
  WebSocketService._internal();

  final Logger _logger = Logger();
  final Random _random = Random();
  
  WebSocketChannel? _channel;
  Timer? _heartbeatTimer;
  Timer? _reconnectTimer;
  
  WebSocketConnectionState _connectionState = WebSocketConnectionState.disconnected;
  String? _lastError;
  int _reconnectAttempts = 0;
  static const int _maxReconnectAttempts = 5;
  static const Duration _baseReconnectDelay = Duration(seconds: 2);
  
  final _eventStreamController = StreamController<WebSocketEvent>.broadcast();
  final _connectionStateController = StreamController<WebSocketConnectionState>.broadcast();
  
  // Configuration
  String _serverUrl = 'ws://localhost:8080/ws'; // Default WebSocket server URL
  Duration _heartbeatInterval = const Duration(seconds: 30);
  Duration _connectionTimeout = const Duration(seconds: 10);
  
  // Public getters
  Stream<WebSocketEvent> get eventStream => _eventStreamController.stream;
  Stream<WebSocketConnectionState> get connectionStateStream => _connectionStateController.stream;
  WebSocketConnectionState get connectionState => _connectionState;
  bool get isConnected => _connectionState == WebSocketConnectionState.connected;
  String? get lastError => _lastError;

  // Configuration methods
  void configure({
    String? serverUrl,
    Duration? heartbeatInterval,
    Duration? connectionTimeout,
  }) {
    if (serverUrl != null) _serverUrl = serverUrl;
    if (heartbeatInterval != null) _heartbeatInterval = heartbeatInterval;
    if (connectionTimeout != null) _connectionTimeout = connectionTimeout;
  }

  Future<void> connect({String? customUrl}) async {
    if (_connectionState == WebSocketConnectionState.connecting || 
        _connectionState == WebSocketConnectionState.connected) {
      return;
    }

    final url = customUrl ?? _serverUrl;
    _setConnectionState(WebSocketConnectionState.connecting);

    try {
      _logger.i('Connecting to WebSocket server: $url');

      // Create WebSocket connection with timeout
      final uri = Uri.parse(url);
      
      _channel = WebSocketChannel.connect(
        uri,
        protocols: ['echo-protocol'], // Optional: specify protocols
      );

      // Wait for connection with timeout
      await _channel!.ready.timeout(_connectionTimeout);

      // Listen to messages
      _channel!.stream.listen(
        _handleMessage,
        onError: _handleError,
        onDone: _handleDisconnection,
      );

      _setConnectionState(WebSocketConnectionState.connected);
      _resetReconnectAttempts();
      _startHeartbeat();
      
      _logger.i('WebSocket connected successfully');
      _emitEvent(WebSocketEventType.connected, {'url': url});

    } catch (e) {
      _logger.e('Failed to connect to WebSocket', error: e);
      _lastError = e.toString();
      _setConnectionState(WebSocketConnectionState.error);
      
      // Attempt reconnection if not manually disconnected
      if (_reconnectAttempts < _maxReconnectAttempts) {
        _scheduleReconnection();
      }
      
      _emitEvent(WebSocketEventType.error, {
        'error': e.toString(),
        'reconnectAttempts': _reconnectAttempts,
      });
    }
  }

  Future<void> disconnect() async {
    _logger.i('Disconnecting WebSocket...');
    
    _heartbeatTimer?.cancel();
    _reconnectTimer?.cancel();
    
    if (_channel != null) {
      await _channel!.sink.close(status.goingAway);
      _channel = null;
    }
    
    _setConnectionState(WebSocketConnectionState.disconnected);
    _emitEvent(WebSocketEventType.disconnected, {});
    
    _logger.i('WebSocket disconnected');
  }

  void _handleMessage(dynamic message) {
    try {
      final data = jsonDecode(message as String);
      final event = WebSocketEvent.fromJson(data);
      
      _logger.d('WebSocket message received: ${event.type.name}');
      _eventStreamController.add(event);
      
      // Handle internal message types
      if (event.type == WebSocketEventType.heartbeat) {
        _handleHeartbeat(event);
      }
      
    } catch (e) {
      _logger.e('Failed to parse WebSocket message', error: e);
    }
  }

  void _handleError(dynamic error) {
    _logger.e('WebSocket error', error: error);
    _lastError = error.toString();
    _setConnectionState(WebSocketConnectionState.error);
    
    _emitEvent(WebSocketEventType.error, {
      'error': error.toString(),
      'reconnectAttempts': _reconnectAttempts,
    });
    
    // Attempt reconnection
    if (_reconnectAttempts < _maxReconnectAttempts) {
      _scheduleReconnection();
    }
  }

  void _handleDisconnection() {
    _logger.w('WebSocket connection closed');
    _setConnectionState(WebSocketConnectionState.disconnected);
    _emitEvent(WebSocketEventType.disconnected, {});
    
    // Attempt reconnection if it wasn't a manual disconnect
    if (_connectionState != WebSocketConnectionState.disconnected && 
        _reconnectAttempts < _maxReconnectAttempts) {
      _scheduleReconnection();
    }
  }

  void _handleHeartbeat(WebSocketEvent event) {
    // Respond to server heartbeat if needed
    final serverTime = event.data['serverTime'];
    final latency = serverTime != null 
        ? DateTime.now().difference(DateTime.parse(serverTime)).inMilliseconds
        : 0;
        
    _logger.d('Heartbeat received, latency: ${latency}ms');
  }

  void _scheduleReconnection() {
    if (_reconnectTimer?.isActive == true) return;
    
    _reconnectAttempts++;
    final delay = Duration(
      seconds: _baseReconnectDelay.inSeconds * _reconnectAttempts,
    );
    
    _logger.i('Scheduling reconnection attempt $_reconnectAttempts in ${delay.inSeconds}s');
    _setConnectionState(WebSocketConnectionState.reconnecting);
    
    _reconnectTimer = Timer(delay, () {
      connect();
    });
  }

  void _resetReconnectAttempts() {
    _reconnectAttempts = 0;
    _reconnectTimer?.cancel();
    _lastError = null;
  }

  void _setConnectionState(WebSocketConnectionState state) {
    if (_connectionState != state) {
      _connectionState = state;
      _connectionStateController.add(state);
      _logger.d('WebSocket connection state changed to: ${state.name}');
    }
  }

  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(_heartbeatInterval, (timer) {
      if (isConnected) {
        sendMessage(WebSocketEventType.heartbeat, {
          'clientTime': DateTime.now().toIso8601String(),
          'timestamp': DateTime.now().millisecondsSinceEpoch,
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _emitEvent(WebSocketEventType type, Map<String, dynamic> data) {
    final event = WebSocketEvent(
      type: type,
      data: data,
      timestamp: DateTime.now(),
    );

    _eventStreamController.add(event);
  }

  // Public methods for sending messages
  void sendMessage(WebSocketEventType type, Map<String, dynamic> data) {
    if (!isConnected) {
      _logger.w('Cannot send message: WebSocket not connected');
      return;
    }

    final event = WebSocketEvent(
      type: type,
      data: data,
      timestamp: DateTime.now(),
    );

    final message = jsonEncode(event.toJson());
    
    try {
      _channel!.sink.add(message);
      _logger.d('WebSocket message sent: ${type.name}');
    } catch (e) {
      _logger.e('Failed to send WebSocket message', error: e);
    }
  }

  void sendPostLike(String postId, String userId) {
    sendMessage(WebSocketEventType.postLiked, {
      'postId': postId,
      'userId': userId,
      'action': 'like',
    });
  }

  void sendPostUnlike(String postId, String userId) {
    sendMessage(WebSocketEventType.postUnliked, {
      'postId': postId,
      'userId': userId,
      'action': 'unlike',
    });
  }

  void sendPostComment(String postId, String userId, String comment) {
    sendMessage(WebSocketEventType.postCommented, {
      'postId': postId,
      'userId': userId,
      'comment': comment,
    });
  }

  void sendPostCreate(PostModel post) {
    sendMessage(WebSocketEventType.postCreated, {
      'post': post.toJson(),
    });
  }

  void sendUserStatusChange(String userId, String status) {
    sendMessage(WebSocketEventType.userStatusChanged, {
      'userId': userId,
      'status': status,
    });
  }

  // Development helper: simulate server when no real server is available
  void enableMockMode({bool enabled = true}) {
    if (enabled && !isConnected) {
      _startMockEvents();
    }
  }

  void _startMockEvents() {
    // Start mock event generation when no real server is available
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!isConnected) {
        _generateMockEvent();
      } else {
        timer.cancel();
      }
    });
  }

  void _generateMockEvent() {
    final eventTypes = [
      WebSocketEventType.postCreated,
      WebSocketEventType.postLiked,
      WebSocketEventType.postCommented,
      WebSocketEventType.notificationReceived,
    ];

    final randomEvent = eventTypes[_random.nextInt(eventTypes.length)];
    
    switch (randomEvent) {
      case WebSocketEventType.postCreated:
        _emitEvent(WebSocketEventType.postCreated, {
          'post': _generateMockPost(),
          'message': 'New post created!',
        });
        break;
      case WebSocketEventType.postLiked:
        _emitEvent(WebSocketEventType.postLiked, {
          'postId': 'post_${_random.nextInt(100)}',
          'userId': 'user_${_random.nextInt(1000)}',
          'userName': 'User ${_random.nextInt(100)}',
          'newLikeCount': _random.nextInt(100) + 1,
        });
        break;
      case WebSocketEventType.postCommented:
        _emitEvent(WebSocketEventType.postCommented, {
          'postId': 'post_${_random.nextInt(100)}',
          'comment': 'Great post! 👍',
          'userName': 'User ${_random.nextInt(100)}',
        });
        break;
      case WebSocketEventType.notificationReceived:
        _emitEvent(WebSocketEventType.notificationReceived, {
          'id': 'notification_${DateTime.now().millisecondsSinceEpoch}',
          'message': 'You have a new notification!',
          'type': 'general',
        });
        break;
      default:
        break;
    }
  }

  Map<String, dynamic> _generateMockPost() {
    return {
      'id': 'post_${DateTime.now().millisecondsSinceEpoch}',
      'content': 'Mock post content created via WebSocket!',
      'authorId': 'mock_user_${_random.nextInt(100)}',
      'author': {
        'id': 'mock_user_${_random.nextInt(100)}',
        'name': 'Mock User ${_random.nextInt(100)}',
        'username': 'mockuser${_random.nextInt(100)}',
        'email': 'mock@example.com',
        'avatarUrl': 'https://i.pravatar.cc/150?u=${_random.nextInt(1000)}',
        'bio': 'Mock user bio',
        'isVerified': false,
        'status': 'approved',
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      },
      'likesCount': _random.nextInt(50),
      'commentsCount': _random.nextInt(20),
      'sharesCount': _random.nextInt(10),
      'isLiked': false,
      'isBookmarked': false,
      'createdAt': DateTime.now().toIso8601String(),
      'updatedAt': DateTime.now().toIso8601String(),
    };
  }

  void dispose() {
    _heartbeatTimer?.cancel();
    _reconnectTimer?.cancel();
    _channel?.sink.close();
    _eventStreamController.close();
    _connectionStateController.close();
  }
}

@riverpod
Stream<WebSocketEvent> webSocketEventStream(WebSocketEventStreamRef ref) {
  final webSocketService = ref.watch(webSocketServiceProvider);
  return webSocketService.eventStream;
}

@riverpod
Stream<WebSocketConnectionState> webSocketConnectionState(WebSocketConnectionStateRef ref) {
  final webSocketService = ref.watch(webSocketServiceProvider);
  return webSocketService.connectionStateStream;
}