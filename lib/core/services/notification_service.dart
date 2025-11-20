import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logger/logger.dart';
import '../../shared/models/notification_model.dart';
import 'websocket_service.dart';

part 'notification_service.g.dart';

@riverpod
NotificationService notificationService(NotificationServiceRef ref) {
  final service = NotificationService();
  final webSocketService = ref.watch(webSocketServiceProvider);
  
  // Listen to WebSocket events and handle notifications
  webSocketService.eventStream.listen((event) {
    service._handleWebSocketEvent(event);
  });
  
  ref.onDispose(() {
    service.dispose();
  });
  
  return service;
}

@riverpod
class NotificationList extends _$NotificationList {
  @override
  List<NotificationModel> build() {
    final notificationService = ref.watch(notificationServiceProvider);
    return notificationService.notifications;
  }

  void markAsRead(String notificationId) {
    final notificationService = ref.read(notificationServiceProvider);
    notificationService.markAsRead(notificationId);
    ref.invalidateSelf();
  }

  void markAllAsRead() {
    final notificationService = ref.read(notificationServiceProvider);
    notificationService.markAllAsRead();
    ref.invalidateSelf();
  }

  void removeNotification(String notificationId) {
    final notificationService = ref.read(notificationServiceProvider);
    notificationService.removeNotification(notificationId);
    ref.invalidateSelf();
  }

  void clearAll() {
    final notificationService = ref.read(notificationServiceProvider);
    notificationService.clearAll();
    ref.invalidateSelf();
  }
}

@riverpod
int unreadNotificationCount(UnreadNotificationCountRef ref) {
  final notifications = ref.watch(notificationListProvider);
  return notifications.where((n) => !n.isRead).length;
}

class NotificationService {
  static final _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final Logger _logger = Logger();
  final List<NotificationModel> _notifications = [];
  final _notificationStreamController = StreamController<NotificationModel>.broadcast();

  List<NotificationModel> get notifications => List.unmodifiable(_notifications);
  Stream<NotificationModel> get notificationStream => _notificationStreamController.stream;

  int get unreadCount => _notifications.where((n) => !n.isRead).length;

  void _handleWebSocketEvent(WebSocketEvent event) {
    switch (event.type) {
      case WebSocketEventType.notificationReceived:
        _addNotificationFromEvent(event);
        break;
      case WebSocketEventType.postLiked:
        _createLikeNotification(event);
        break;
      case WebSocketEventType.postCommented:
        _createCommentNotification(event);
        break;
      default:
        break;
    }
  }

  void _addNotificationFromEvent(WebSocketEvent event) {
    final data = event.data;
    final notification = NotificationModel(
      id: data['id'] ?? 'notification_${DateTime.now().millisecondsSinceEpoch}',
      title: _getNotificationTitle(data['type'] ?? 'general'),
      message: data['message'] ?? 'New notification',
      type: _parseNotificationType(data['type'] ?? 'general'),
      isRead: data['isRead'] ?? false,
      userId: data['userId'],
      postId: data['postId'],
      actionData: data['actionData'],
      createdAt: DateTime.tryParse(data['createdAt'] ?? '') ?? DateTime.now(),
    );

    _addNotification(notification);
  }

  void _createLikeNotification(WebSocketEvent event) {
    final data = event.data;
    final notification = NotificationModel(
      id: 'like_${DateTime.now().millisecondsSinceEpoch}',
      title: '❤️ New Like',
      message: data['message'] ?? 'Someone liked your post',
      type: NotificationType.like,
      isRead: false,
      userId: data['userId'],
      postId: data['postId'],
      actionData: {
        'userName': data['userName'],
        'newLikeCount': data['newLikeCount'],
      },
      createdAt: DateTime.now(),
    );

    _addNotification(notification);
  }

  void _createCommentNotification(WebSocketEvent event) {
    final data = event.data;
    final notification = NotificationModel(
      id: 'comment_${DateTime.now().millisecondsSinceEpoch}',
      title: '💬 New Comment',
      message: data['message'] ?? 'Someone commented on your post',
      type: NotificationType.comment,
      isRead: false,
      userId: data['userId'],
      postId: data['postId'],
      actionData: {
        'userName': data['userName'],
        'comment': data['comment'],
        'newCommentCount': data['newCommentCount'],
      },
      createdAt: DateTime.now(),
    );

    _addNotification(notification);
  }

  void _addNotification(NotificationModel notification) {
    _notifications.insert(0, notification); // Add to beginning for newest first
    _notificationStreamController.add(notification);
    
    // Limit to 50 notifications
    if (_notifications.length > 50) {
      _notifications.removeRange(50, _notifications.length);
    }

    _logger.d('Notification added: ${notification.message}');
  }

  void markAsRead(String notificationId) {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      _notifications[index] = _notifications[index].copyWith(isRead: true);
      _logger.d('Notification marked as read: $notificationId');
    }
  }

  void markAllAsRead() {
    for (int i = 0; i < _notifications.length; i++) {
      if (!_notifications[i].isRead) {
        _notifications[i] = _notifications[i].copyWith(isRead: true);
      }
    }
    _logger.d('All notifications marked as read');
  }

  void removeNotification(String notificationId) {
    _notifications.removeWhere((n) => n.id == notificationId);
    _logger.d('Notification removed: $notificationId');
  }

  void clearAll() {
    _notifications.clear();
    _logger.d('All notifications cleared');
  }

  String _getNotificationTitle(String type) {
    switch (type) {
      case 'like':
        return '❤️ New Like';
      case 'comment':
        return '💬 New Comment';
      case 'follow':
        return '👤 New Follower';
      case 'mention':
        return '📢 You were mentioned';
      case 'share':
        return '🔄 Post Shared';
      default:
        return '🔔 Notification';
    }
  }

  NotificationType _parseNotificationType(String type) {
    switch (type) {
      case 'like':
        return NotificationType.like;
      case 'comment':
        return NotificationType.comment;
      case 'follow':
        return NotificationType.follow;
      case 'mention':
        return NotificationType.mention;
      case 'share':
        return NotificationType.share;
      case 'system':
        return NotificationType.system;
      default:
        return NotificationType.general;
    }
  }

  void dispose() {
    _notificationStreamController.close();
  }

  // Manual notification creation for testing
  void createTestNotification({
    required String title,
    required String message,
    NotificationType type = NotificationType.general,
    String? userId,
    String? postId,
    Map<String, dynamic>? actionData,
  }) {
    final notification = NotificationModel(
      id: 'test_${DateTime.now().millisecondsSinceEpoch}',
      title: title,
      message: message,
      type: type,
      isRead: false,
      userId: userId,
      postId: postId,
      actionData: actionData,
      createdAt: DateTime.now(),
    );

    _addNotification(notification);
  }
}