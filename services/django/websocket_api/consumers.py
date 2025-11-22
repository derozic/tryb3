import json
import asyncio
from channels.generic.websocket import AsyncWebsocketConsumer
from channels.db import database_sync_to_async
from django.contrib.auth.models import AnonymousUser
from users.models import User, UserStatus
from notifications.models import Notification
import logging

logger = logging.getLogger(__name__)


class BaseConsumer(AsyncWebsocketConsumer):
    """Base WebSocket consumer with common functionality"""
    
    async def connect(self):
        """Handle WebSocket connection"""
        self.user = self.scope.get('user', AnonymousUser())
        
        # Only allow authenticated approved users
        if self.user.is_anonymous or not await self.is_user_approved(self.user):
            await self.close()
            return
        
        await self.accept()
        logger.info(f"WebSocket connected: {self.user.username}")
    
    async def disconnect(self, close_code):
        """Handle WebSocket disconnection"""
        if hasattr(self, 'group_name'):
            await self.channel_layer.group_discard(
                self.group_name,
                self.channel_name
            )
        logger.info(f"WebSocket disconnected: {self.user.username} (code: {close_code})")
    
    @database_sync_to_async
    def is_user_approved(self, user):
        """Check if user is approved for WebSocket access"""
        try:
            return user.is_authenticated and user.status == UserStatus.APPROVED
        except:
            return False
    
    async def send_error(self, error_message, error_code='error'):
        """Send error message to client"""
        await self.send(text_data=json.dumps({
            'type': 'error',
            'code': error_code,
            'message': error_message,
            'timestamp': self.get_timestamp()
        }))
    
    def get_timestamp(self):
        """Get current timestamp"""
        from django.utils import timezone
        return timezone.now().isoformat()


class FeedConsumer(BaseConsumer):
    """WebSocket consumer for real-time feed updates"""
    
    async def connect(self):
        """Connect to feed updates"""
        await super().connect()
        
        if not self.user.is_anonymous:
            self.group_name = f'feed_user_{self.user.id}'
            
            # Join global feed group
            await self.channel_layer.group_add(
                'global_feed',
                self.channel_name
            )
            
            # Join user-specific feed group
            await self.channel_layer.group_add(
                self.group_name,
                self.channel_name
            )
            
            # Send connection confirmation
            await self.send(text_data=json.dumps({
                'type': 'connection_established',
                'message': 'Connected to feed updates',
                'user': await self.get_user_data(),
                'timestamp': self.get_timestamp()
            }))
    
    async def disconnect(self, close_code):
        """Disconnect from feed updates"""
        if not self.user.is_anonymous:
            await self.channel_layer.group_discard(
                'global_feed',
                self.channel_name
            )
            
            if hasattr(self, 'group_name'):
                await self.channel_layer.group_discard(
                    self.group_name,
                    self.channel_name
                )
        
        await super().disconnect(close_code)
    
    async def receive(self, text_data):
        """Handle incoming WebSocket messages"""
        try:
            data = json.loads(text_data)
            message_type = data.get('type')
            
            if message_type == 'heartbeat':
                await self.send_heartbeat()
            elif message_type == 'post_like':
                await self.handle_post_like(data)
            elif message_type == 'post_unlike':
                await self.handle_post_unlike(data)
            else:
                await self.send_error(f'Unknown message type: {message_type}')
                
        except json.JSONDecodeError:
            await self.send_error('Invalid JSON format')
        except Exception as e:
            logger.error(f"Error processing WebSocket message: {e}")
            await self.send_error('Internal server error')
    
    async def send_heartbeat(self):
        """Send heartbeat response"""
        await self.send(text_data=json.dumps({
            'type': 'heartbeat_response',
            'server_time': self.get_timestamp(),
            'status': 'alive'
        }))
    
    async def handle_post_like(self, data):
        """Handle post like event"""
        post_id = data.get('post_id')
        if post_id:
            # Broadcast like to global feed
            await self.channel_layer.group_send(
                'global_feed',
                {
                    'type': 'post_liked',
                    'post_id': post_id,
                    'user_id': self.user.id,
                    'username': self.user.username,
                    'timestamp': self.get_timestamp()
                }
            )
    
    async def handle_post_unlike(self, data):
        """Handle post unlike event"""
        post_id = data.get('post_id')
        if post_id:
            # Broadcast unlike to global feed
            await self.channel_layer.group_send(
                'global_feed',
                {
                    'type': 'post_unliked',
                    'post_id': post_id,
                    'user_id': self.user.id,
                    'username': self.user.username,
                    'timestamp': self.get_timestamp()
                }
            )
    
    # Event handlers for group messages
    async def post_created(self, event):
        """Handle new post creation"""
        await self.send(text_data=json.dumps({
            'type': 'post_created',
            'post': event['post'],
            'timestamp': event['timestamp']
        }))
    
    async def post_liked(self, event):
        """Handle post like event"""
        await self.send(text_data=json.dumps({
            'type': 'post_liked',
            'post_id': event['post_id'],
            'user_id': event['user_id'],
            'username': event['username'],
            'timestamp': event['timestamp']
        }))
    
    async def post_unliked(self, event):
        """Handle post unlike event"""
        await self.send(text_data=json.dumps({
            'type': 'post_unliked',
            'post_id': event['post_id'],
            'user_id': event['user_id'],
            'username': event['username'],
            'timestamp': event['timestamp']
        }))
    
    async def post_commented(self, event):
        """Handle post comment event"""
        await self.send(text_data=json.dumps({
            'type': 'post_commented',
            'post_id': event['post_id'],
            'comment': event['comment'],
            'user_id': event['user_id'],
            'username': event['username'],
            'timestamp': event['timestamp']
        }))
    
    @database_sync_to_async
    def get_user_data(self):
        """Get user data for connection confirmation"""
        return {
            'id': self.user.id,
            'username': self.user.username,
            'email': self.user.email
        }


class NotificationConsumer(BaseConsumer):
    """WebSocket consumer for real-time notifications"""
    
    async def connect(self):
        """Connect to notification updates"""
        await super().connect()
        
        if not self.user.is_anonymous:
            self.group_name = f'notifications_user_{self.user.id}'
            
            await self.channel_layer.group_add(
                self.group_name,
                self.channel_name
            )
            
            # Send unread notification count
            unread_count = await self.get_unread_notification_count()
            await self.send(text_data=json.dumps({
                'type': 'connection_established',
                'message': 'Connected to notifications',
                'unread_count': unread_count,
                'timestamp': self.get_timestamp()
            }))
    
    async def disconnect(self, close_code):
        """Disconnect from notifications"""
        if hasattr(self, 'group_name'):
            await self.channel_layer.group_discard(
                self.group_name,
                self.channel_name
            )
        
        await super().disconnect(close_code)
    
    async def receive(self, text_data):
        """Handle incoming notification messages"""
        try:
            data = json.loads(text_data)
            message_type = data.get('type')
            
            if message_type == 'mark_read':
                await self.handle_mark_read(data)
            elif message_type == 'mark_all_read':
                await self.handle_mark_all_read()
            elif message_type == 'heartbeat':
                await self.send_heartbeat()
            else:
                await self.send_error(f'Unknown message type: {message_type}')
                
        except json.JSONDecodeError:
            await self.send_error('Invalid JSON format')
        except Exception as e:
            logger.error(f"Error processing notification message: {e}")
            await self.send_error('Internal server error')
    
    async def handle_mark_read(self, data):
        """Mark notification as read"""
        notification_id = data.get('notification_id')
        if notification_id:
            success = await self.mark_notification_read(notification_id)
            if success:
                unread_count = await self.get_unread_notification_count()
                await self.send(text_data=json.dumps({
                    'type': 'notification_marked_read',
                    'notification_id': notification_id,
                    'unread_count': unread_count,
                    'timestamp': self.get_timestamp()
                }))
    
    async def handle_mark_all_read(self):
        """Mark all notifications as read"""
        await self.mark_all_notifications_read()
        await self.send(text_data=json.dumps({
            'type': 'all_notifications_marked_read',
            'unread_count': 0,
            'timestamp': self.get_timestamp()
        }))
    
    async def send_heartbeat(self):
        """Send heartbeat response"""
        await self.send(text_data=json.dumps({
            'type': 'heartbeat_response',
            'server_time': self.get_timestamp(),
            'status': 'alive'
        }))
    
    # Event handlers
    async def notification_created(self, event):
        """Handle new notification"""
        await self.send(text_data=json.dumps({
            'type': 'notification_created',
            'notification': event['notification'],
            'unread_count': event['unread_count'],
            'timestamp': event['timestamp']
        }))
    
    @database_sync_to_async
    def get_unread_notification_count(self):
        """Get unread notification count"""
        try:
            return Notification.objects.filter(
                user=self.user,
                is_read=False
            ).count()
        except:
            return 0
    
    @database_sync_to_async
    def mark_notification_read(self, notification_id):
        """Mark specific notification as read"""
        try:
            notification = Notification.objects.get(
                id=notification_id,
                user=self.user
            )
            notification.is_read = True
            notification.save()
            return True
        except Notification.DoesNotExist:
            return False
    
    @database_sync_to_async
    def mark_all_notifications_read(self):
        """Mark all notifications as read"""
        Notification.objects.filter(
            user=self.user,
            is_read=False
        ).update(is_read=True)


class ChatConsumer(BaseConsumer):
    """WebSocket consumer for real-time chat"""
    
    async def connect(self):
        """Connect to chat room"""
        self.room_name = self.scope['url_route']['kwargs']['room_name']
        self.room_group_name = f'chat_{self.room_name}'
        
        await super().connect()
        
        if not self.user.is_anonymous:
            # Join room group
            await self.channel_layer.group_add(
                self.room_group_name,
                self.channel_name
            )
            
            # Notify room of user joining
            await self.channel_layer.group_send(
                self.room_group_name,
                {
                    'type': 'user_joined',
                    'username': self.user.username,
                    'user_id': self.user.id,
                    'timestamp': self.get_timestamp()
                }
            )
    
    async def disconnect(self, close_code):
        """Disconnect from chat room"""
        if not self.user.is_anonymous and hasattr(self, 'room_group_name'):
            # Notify room of user leaving
            await self.channel_layer.group_send(
                self.room_group_name,
                {
                    'type': 'user_left',
                    'username': self.user.username,
                    'user_id': self.user.id,
                    'timestamp': self.get_timestamp()
                }
            )
            
            # Leave room group
            await self.channel_layer.group_discard(
                self.room_group_name,
                self.channel_name
            )
        
        await super().disconnect(close_code)
    
    async def receive(self, text_data):
        """Handle chat messages"""
        try:
            data = json.loads(text_data)
            message_type = data.get('type', 'chat_message')
            
            if message_type == 'chat_message':
                message = data.get('message', '').strip()
                if message:
                    # Send message to room group
                    await self.channel_layer.group_send(
                        self.room_group_name,
                        {
                            'type': 'chat_message',
                            'message': message,
                            'username': self.user.username,
                            'user_id': self.user.id,
                            'timestamp': self.get_timestamp()
                        }
                    )
            elif message_type == 'typing':
                # Handle typing indicators
                await self.channel_layer.group_send(
                    self.room_group_name,
                    {
                        'type': 'user_typing',
                        'username': self.user.username,
                        'user_id': self.user.id,
                        'is_typing': data.get('is_typing', False),
                        'timestamp': self.get_timestamp()
                    }
                )
            
        except json.JSONDecodeError:
            await self.send_error('Invalid JSON format')
        except Exception as e:
            logger.error(f"Error processing chat message: {e}")
            await self.send_error('Internal server error')
    
    # Event handlers
    async def chat_message(self, event):
        """Send chat message to WebSocket"""
        await self.send(text_data=json.dumps({
            'type': 'chat_message',
            'message': event['message'],
            'username': event['username'],
            'user_id': event['user_id'],
            'timestamp': event['timestamp']
        }))
    
    async def user_joined(self, event):
        """Handle user joined event"""
        await self.send(text_data=json.dumps({
            'type': 'user_joined',
            'username': event['username'],
            'user_id': event['user_id'],
            'timestamp': event['timestamp']
        }))
    
    async def user_left(self, event):
        """Handle user left event"""
        await self.send(text_data=json.dumps({
            'type': 'user_left',
            'username': event['username'],
            'user_id': event['user_id'],
            'timestamp': event['timestamp']
        }))
    
    async def user_typing(self, event):
        """Handle typing indicator"""
        # Don't send typing indicators back to the sender
        if event['user_id'] != self.user.id:
            await self.send(text_data=json.dumps({
                'type': 'user_typing',
                'username': event['username'],
                'user_id': event['user_id'],
                'is_typing': event['is_typing'],
                'timestamp': event['timestamp']
            }))


class UserConsumer(BaseConsumer):
    """WebSocket consumer for user-specific events"""
    
    async def connect(self):
        """Connect to user-specific events"""
        self.user_id = self.scope['url_route']['kwargs']['user_id']
        
        await super().connect()
        
        # Only allow users to connect to their own channel
        if not self.user.is_anonymous and str(self.user.id) == self.user_id:
            self.group_name = f'user_{self.user_id}'
            
            await self.channel_layer.group_add(
                self.group_name,
                self.channel_name
            )
            
            await self.send(text_data=json.dumps({
                'type': 'connection_established',
                'message': f'Connected to user events for {self.user.username}',
                'timestamp': self.get_timestamp()
            }))
        else:
            await self.close()
    
    async def disconnect(self, close_code):
        """Disconnect from user events"""
        if hasattr(self, 'group_name'):
            await self.channel_layer.group_discard(
                self.group_name,
                self.channel_name
            )
        
        await super().disconnect(close_code)
    
    async def receive(self, text_data):
        """Handle user event messages"""
        try:
            data = json.loads(text_data)
            message_type = data.get('type')
            
            if message_type == 'heartbeat':
                await self.send_heartbeat()
            elif message_type == 'status_update':
                await self.handle_status_update(data)
            else:
                await self.send_error(f'Unknown message type: {message_type}')
                
        except json.JSONDecodeError:
            await self.send_error('Invalid JSON format')
        except Exception as e:
            logger.error(f"Error processing user event message: {e}")
            await self.send_error('Internal server error')
    
    async def handle_status_update(self, data):
        """Handle user status update"""
        status = data.get('status')
        if status in ['online', 'away', 'busy', 'offline']:
            # Update user status
            await self.update_user_status(status)
            
            # Broadcast status to followers
            await self.broadcast_status_to_followers(status)
    
    async def send_heartbeat(self):
        """Send heartbeat response"""
        await self.send(text_data=json.dumps({
            'type': 'heartbeat_response',
            'server_time': self.get_timestamp(),
            'status': 'alive'
        }))
    
    # Event handlers
    async def status_changed(self, event):
        """Handle user status change"""
        await self.send(text_data=json.dumps({
            'type': 'status_changed',
            'user_id': event['user_id'],
            'username': event['username'],
            'status': event['status'],
            'timestamp': event['timestamp']
        }))
    
    async def follower_activity(self, event):
        """Handle follower activity"""
        await self.send(text_data=json.dumps({
            'type': 'follower_activity',
            'activity': event['activity'],
            'timestamp': event['timestamp']
        }))
    
    @database_sync_to_async
    def update_user_status(self, status):
        """Update user status in database"""
        # This would typically update a user status field
        # For now, we'll just log it
        logger.info(f"User {self.user.username} status updated to: {status}")
    
    @database_sync_to_async
    def broadcast_status_to_followers(self, status):
        """Broadcast status update to followers"""
        # This would get user's followers and send them updates
        # For now, we'll just log it
        logger.info(f"Broadcasting {self.user.username} status '{status}' to followers")