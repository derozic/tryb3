from django.db import models
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
from users.models import User


class NotificationType(models.TextChoices):
    """Notification types matching Flutter frontend"""
    LIKE = 'like', 'Like'
    COMMENT = 'comment', 'Comment'
    FOLLOW = 'follow', 'Follow'
    MENTION = 'mention', 'Mention'
    SHARE = 'share', 'Share'
    SYSTEM = 'system', 'System'
    GENERAL = 'general', 'General'


class Notification(models.Model):
    """Notification model matching Flutter NotificationModel"""
    
    # Core fields
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='notifications'
    )
    title = models.CharField(max_length=255)
    message = models.TextField()
    notification_type = models.CharField(
        max_length=20,
        choices=NotificationType.choices,
        default=NotificationType.GENERAL
    )
    
    # Status
    is_read = models.BooleanField(default=False)
    
    # Related objects (generic foreign key)
    content_type = models.ForeignKey(
        ContentType,
        on_delete=models.CASCADE,
        null=True,
        blank=True
    )
    object_id = models.PositiveIntegerField(null=True, blank=True)
    content_object = GenericForeignKey('content_type', 'object_id')
    
    # Additional data (JSON field for flexible data storage)
    action_data = models.JSONField(default=dict, blank=True)
    
    # Actor (who triggered the notification)
    actor = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        null=True,
        blank=True,
        related_name='triggered_notifications'
    )
    
    # Timestamps
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        db_table = 'notifications'
        indexes = [
            models.Index(fields=['user', 'is_read']),
            models.Index(fields=['user', 'created_at']),
            models.Index(fields=['notification_type']),
            models.Index(fields=['created_at']),
        ]
        ordering = ['-created_at']
    
    def __str__(self):
        return f"{self.title} for {self.user.username}"
    
    @property
    def time_ago(self):
        """Get time ago string"""
        from django.utils import timezone
        now = timezone.now()
        diff = now - self.created_at
        
        if diff.total_seconds() < 60:
            return 'Just now'
        elif diff.total_seconds() < 3600:
            return f'{int(diff.total_seconds() / 60)}m ago'
        elif diff.total_seconds() < 86400:
            return f'{int(diff.total_seconds() / 3600)}h ago'
        elif diff.days < 7:
            return f'{diff.days}d ago'
        else:
            return f'{int(diff.days / 7)}w ago'
    
    @property
    def icon_data(self):
        """Get icon data for notification type"""
        icons = {
            NotificationType.LIKE: '❤️',
            NotificationType.COMMENT: '💬',
            NotificationType.FOLLOW: '👤',
            NotificationType.MENTION: '📢',
            NotificationType.SHARE: '🔄',
            NotificationType.SYSTEM: '⚙️',
            NotificationType.GENERAL: '🔔',
        }
        return icons.get(self.notification_type, '🔔')
    
    def mark_as_read(self):
        """Mark notification as read"""
        if not self.is_read:
            self.is_read = True
            self.save(update_fields=['is_read', 'updated_at'])
    
    @classmethod
    def create_notification(cls, user, title, message, notification_type=NotificationType.GENERAL, 
                          actor=None, content_object=None, action_data=None):
        """Create a new notification"""
        return cls.objects.create(
            user=user,
            title=title,
            message=message,
            notification_type=notification_type,
            actor=actor,
            content_object=content_object,
            action_data=action_data or {}
        )


class NotificationPreference(models.Model):
    """User notification preferences"""
    
    user = models.OneToOneField(
        User,
        on_delete=models.CASCADE,
        related_name='notification_preferences'
    )
    
    # Push notification settings
    push_notifications = models.BooleanField(default=True)
    push_likes = models.BooleanField(default=True)
    push_comments = models.BooleanField(default=True)
    push_follows = models.BooleanField(default=True)
    push_mentions = models.BooleanField(default=True)
    push_shares = models.BooleanField(default=True)
    
    # Email notification settings
    email_notifications = models.BooleanField(default=True)
    email_likes = models.BooleanField(default=False)
    email_comments = models.BooleanField(default=True)
    email_follows = models.BooleanField(default=True)
    email_mentions = models.BooleanField(default=True)
    email_shares = models.BooleanField(default=False)
    
    # In-app notification settings
    in_app_notifications = models.BooleanField(default=True)
    in_app_sound = models.BooleanField(default=True)
    
    # Digest settings
    daily_digest = models.BooleanField(default=True)
    weekly_digest = models.BooleanField(default=True)
    
    # Quiet hours
    quiet_hours_enabled = models.BooleanField(default=False)
    quiet_hours_start = models.TimeField(null=True, blank=True)  # e.g., 22:00
    quiet_hours_end = models.TimeField(null=True, blank=True)    # e.g., 08:00
    
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        db_table = 'notification_preferences'
    
    def __str__(self):
        return f"Notification preferences for {self.user.username}"
    
    def should_send_notification(self, notification_type, delivery_method='push'):
        """Check if notification should be sent based on preferences"""
        if not self.in_app_notifications and delivery_method == 'in_app':
            return False
        
        if delivery_method == 'push' and not self.push_notifications:
            return False
        
        if delivery_method == 'email' and not self.email_notifications:
            return False
        
        # Check specific notification type preferences
        type_mapping = {
            NotificationType.LIKE: f'{delivery_method}_likes',
            NotificationType.COMMENT: f'{delivery_method}_comments',
            NotificationType.FOLLOW: f'{delivery_method}_follows',
            NotificationType.MENTION: f'{delivery_method}_mentions',
            NotificationType.SHARE: f'{delivery_method}_shares',
        }
        
        pref_field = type_mapping.get(notification_type)
        if pref_field and hasattr(self, pref_field):
            return getattr(self, pref_field)
        
        return True  # Default to sending for system/general notifications
    
    def is_quiet_hours(self):
        """Check if current time is in quiet hours"""
        if not self.quiet_hours_enabled or not self.quiet_hours_start or not self.quiet_hours_end:
            return False
        
        from django.utils import timezone
        now = timezone.localtime().time()
        
        if self.quiet_hours_start < self.quiet_hours_end:
            # Same day quiet hours (e.g., 14:00 - 18:00)
            return self.quiet_hours_start <= now <= self.quiet_hours_end
        else:
            # Overnight quiet hours (e.g., 22:00 - 08:00)
            return now >= self.quiet_hours_start or now <= self.quiet_hours_end


class NotificationDevice(models.Model):
    """Device tokens for push notifications"""
    
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='notification_devices'
    )
    
    device_type = models.CharField(
        max_length=20,
        choices=[
            ('ios', 'iOS'),
            ('android', 'Android'),
            ('web', 'Web'),
            ('desktop', 'Desktop'),
        ]
    )
    device_token = models.TextField()  # FCM token or similar
    device_id = models.CharField(max_length=255, unique=True)
    
    # Device info
    device_name = models.CharField(max_length=255, blank=True)
    app_version = models.CharField(max_length=50, blank=True)
    os_version = models.CharField(max_length=50, blank=True)
    
    # Status
    is_active = models.BooleanField(default=True)
    last_used = models.DateTimeField(auto_now=True)
    
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        db_table = 'notification_devices'
        unique_together = ['user', 'device_id']
        indexes = [
            models.Index(fields=['user', 'is_active']),
            models.Index(fields=['device_token']),
        ]
    
    def __str__(self):
        return f"{self.device_name or self.device_type} for {self.user.username}"
