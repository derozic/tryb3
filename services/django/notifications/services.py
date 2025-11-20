from django.conf import settings
from django.utils import timezone
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync
import logging
import json

logger = logging.getLogger(__name__)


class PushNotificationService:
    """Service for sending push notifications"""
    
    def __init__(self):
        self.channel_layer = get_channel_layer()
    
    def send_notification_push(self, notification):
        """Send push notification for a notification instance"""
        try:
            # Check user preferences
            preferences = getattr(notification.user, 'notification_preferences', None)
            if preferences and not preferences.should_send_notification(
                notification.notification_type, 'push'
            ):
                logger.info(f"Push notifications disabled for user {notification.user.id}")
                return False
            
            # Check quiet hours
            if preferences and preferences.is_quiet_hours():
                logger.info(f"User {notification.user.id} is in quiet hours")
                return False
            
            # Get active devices
            devices = notification.user.notification_devices.filter(is_active=True)
            if not devices.exists():
                logger.info(f"No active devices for user {notification.user.id}")
                return False
            
            # Send to all active devices
            success_count = 0
            for device in devices:
                if self._send_to_device(device, notification):
                    success_count += 1
            
            logger.info(f"Sent push notification to {success_count}/{devices.count()} devices for user {notification.user.id}")
            return success_count > 0
            
        except Exception as e:
            logger.error(f"Failed to send push notification: {e}")
            return False
    
    def send_to_users(self, user_ids, title, body, data=None):
        """Send push notification to specific users"""
        from users.models import User
        from .models import NotificationDevice
        
        users = User.objects.filter(id__in=user_ids, is_active=True)
        results = []
        
        for user in users:
            devices = NotificationDevice.objects.filter(user=user, is_active=True)
            user_result = {
                'user_id': user.id,
                'devices_sent': 0,
                'total_devices': devices.count()
            }
            
            for device in devices:
                if self._send_push_message(device, title, body, data):
                    user_result['devices_sent'] += 1
            
            results.append(user_result)
        
        return {
            'users_targeted': len(user_ids),
            'users_found': users.count(),
            'results': results
        }
    
    def send_to_tokens(self, device_tokens, title, body, data=None):
        """Send push notification to specific device tokens"""
        results = []
        
        for token in device_tokens:
            success = self._send_push_message_by_token(token, title, body, data)
            results.append({
                'device_token': token[:20] + '...',  # Truncate for security
                'success': success
            })
        
        return {
            'tokens_targeted': len(device_tokens),
            'results': results
        }
    
    def _send_to_device(self, device, notification):
        """Send notification to a specific device"""
        try:
            payload = {
                'title': notification.title,
                'body': notification.message,
                'data': {
                    'notification_id': str(notification.id),
                    'notification_type': notification.notification_type,
                    'action_data': notification.action_data,
                    'created_at': notification.created_at.isoformat(),
                }
            }
            
            return self._send_push_message_by_token(
                device.device_token, 
                payload['title'], 
                payload['body'], 
                payload['data']
            )
            
        except Exception as e:
            logger.error(f"Failed to send to device {device.id}: {e}")
            return False
    
    def _send_push_message(self, device, title, body, data=None):
        """Send push message to a device object"""
        return self._send_push_message_by_token(device.device_token, title, body, data)
    
    def _send_push_message_by_token(self, device_token, title, body, data=None):
        """Send push message to a device token"""
        try:
            # This is a placeholder implementation
            # In production, you would integrate with FCM, APNs, or similar
            logger.info(f"[MOCK] Sending push notification: {title} - {body} to token {device_token[:20]}...")
            
            # Simulate push notification via WebSocket for development
            if self.channel_layer:
                async_to_sync(self.channel_layer.group_send)('push_notifications', {
                    'type': 'push_notification',
                    'title': title,
                    'body': body,
                    'data': data or {},
                    'device_token': device_token[:20] + '...'
                })
            
            return True
            
        except Exception as e:
            logger.error(f"Failed to send push message: {e}")
            return False


class NotificationWebSocketService:
    """Service for sending real-time notifications via WebSocket"""
    
    def __init__(self):
        self.channel_layer = get_channel_layer()
    
    def send_notification_to_user(self, user_id, notification_data):
        """Send notification to a specific user via WebSocket"""
        try:
            group_name = f"notifications_{user_id}"
            
            async_to_sync(self.channel_layer.group_send)(group_name, {
                'type': 'notification_created',
                'notification': notification_data
            })
            
            logger.info(f"Sent WebSocket notification to user {user_id}")
            return True
            
        except Exception as e:
            logger.error(f"Failed to send WebSocket notification: {e}")
            return False
    
    def send_unread_count_to_user(self, user_id, unread_count):
        """Send unread count update to a specific user"""
        try:
            group_name = f"notifications_{user_id}"
            
            async_to_sync(self.channel_layer.group_send)(group_name, {
                'type': 'unread_count_update',
                'unread_count': unread_count
            })
            
            logger.info(f"Sent unread count {unread_count} to user {user_id}")
            return True
            
        except Exception as e:
            logger.error(f"Failed to send unread count update: {e}")
            return False
    
    def broadcast_system_notification(self, title, message, data=None):
        """Broadcast system notification to all connected users"""
        try:
            async_to_sync(self.channel_layer.group_send)('global_notifications', {
                'type': 'system_notification',
                'title': title,
                'message': message,
                'data': data or {}
            })
            
            logger.info(f"Broadcasted system notification: {title}")
            return True
            
        except Exception as e:
            logger.error(f"Failed to broadcast system notification: {e}")
            return False


class NotificationCreationService:
    """Service for creating and dispatching notifications"""
    
    def __init__(self):
        self.push_service = PushNotificationService()
        self.websocket_service = NotificationWebSocketService()
    
    def create_notification(self, user, title, message, notification_type, actor=None, 
                          content_object=None, action_data=None, send_push=True):
        """Create a notification and send it via all channels"""
        from .models import Notification
        from .serializers import NotificationSerializer
        
        try:
            # Create the notification
            notification = Notification.objects.create(
                user=user,
                title=title,
                message=message,
                notification_type=notification_type,
                actor=actor,
                content_object=content_object,
                action_data=action_data or {}
            )
            
            # Serialize for transmission
            notification_data = NotificationSerializer(notification).data
            
            # Send via WebSocket
            self.websocket_service.send_notification_to_user(
                user.id, notification_data
            )
            
            # Send push notification if enabled
            if send_push:
                self.push_service.send_notification_push(notification)
            
            logger.info(f"Created notification {notification.id} for user {user.id}")
            return notification
            
        except Exception as e:
            logger.error(f"Failed to create notification: {e}")
            return None
    
    def create_bulk_notifications(self, user_ids, title, message, notification_type, 
                                actor=None, action_data=None, send_push=True):
        """Create notifications for multiple users"""
        from users.models import User
        from .models import Notification
        
        users = User.objects.filter(id__in=user_ids, is_active=True)
        notifications = []
        
        for user in users:
            notification = self.create_notification(
                user=user,
                title=title,
                message=message,
                notification_type=notification_type,
                actor=actor,
                action_data=action_data,
                send_push=send_push
            )
            if notification:
                notifications.append(notification)
        
        logger.info(f"Created {len(notifications)} bulk notifications")
        return notifications