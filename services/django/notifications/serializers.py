from rest_framework import serializers
from .models import Notification, NotificationPreference, NotificationDevice, NotificationType


class NotificationSerializer(serializers.ModelSerializer):
    """Serializer for Notification model - matches Flutter NotificationModel"""
    
    time_ago = serializers.ReadOnlyField()
    icon_data = serializers.ReadOnlyField()
    actor_username = serializers.CharField(source='actor.username', read_only=True)
    actor_avatar_url = serializers.CharField(source='actor.avatar_url', read_only=True)
    
    class Meta:
        model = Notification
        fields = [
            'id', 'title', 'message', 'notification_type', 'is_read',
            'action_data', 'actor', 'actor_username', 'actor_avatar_url',
            'time_ago', 'icon_data', 'created_at', 'updated_at'
        ]
        read_only_fields = [
            'id', 'time_ago', 'icon_data', 'actor', 'actor_username',
            'actor_avatar_url', 'created_at', 'updated_at'
        ]


class NotificationPreferenceSerializer(serializers.ModelSerializer):
    """Serializer for NotificationPreference model"""
    
    class Meta:
        model = NotificationPreference
        fields = [
            'push_notifications', 'push_likes', 'push_comments', 'push_follows',
            'push_mentions', 'push_shares', 'email_notifications', 'email_likes',
            'email_comments', 'email_follows', 'email_mentions', 'email_shares',
            'in_app_notifications', 'in_app_sound', 'daily_digest', 'weekly_digest',
            'quiet_hours_enabled', 'quiet_hours_start', 'quiet_hours_end'
        ]


class NotificationDeviceSerializer(serializers.ModelSerializer):
    """Serializer for NotificationDevice model"""
    
    class Meta:
        model = NotificationDevice
        fields = [
            'id', 'device_type', 'device_token', 'device_id', 'device_name',
            'app_version', 'os_version', 'is_active', 'last_used', 'created_at'
        ]
        read_only_fields = ['id', 'last_used', 'created_at']
    
    def validate_device_token(self, value):
        """Validate device token format"""
        if not value or len(value) < 10:
            raise serializers.ValidationError('Invalid device token')
        return value


class BulkMarkReadSerializer(serializers.Serializer):
    """Serializer for bulk marking notifications as read"""
    
    notification_ids = serializers.ListField(
        child=serializers.IntegerField(),
        allow_empty=False
    )
    
    def validate_notification_ids(self, value):
        """Validate notification IDs belong to current user"""
        user = self.context['request'].user
        valid_ids = Notification.objects.filter(
            id__in=value,
            user=user
        ).values_list('id', flat=True)
        
        invalid_ids = set(value) - set(valid_ids)
        if invalid_ids:
            raise serializers.ValidationError(
                f'Invalid notification IDs: {list(invalid_ids)}'
            )
        return value


class NotificationCreateSerializer(serializers.Serializer):
    """Serializer for creating notifications (admin/system use)"""
    
    user_ids = serializers.ListField(
        child=serializers.IntegerField(),
        allow_empty=False
    )
    title = serializers.CharField(max_length=255)
    message = serializers.CharField()
    notification_type = serializers.ChoiceField(
        choices=NotificationType.choices,
        default=NotificationType.SYSTEM
    )
    action_data = serializers.JSONField(required=False, default=dict)
    
    def validate_user_ids(self, value):
        """Validate user IDs exist"""
        from users.models import User
        valid_ids = User.objects.filter(
            id__in=value,
            is_active=True
        ).values_list('id', flat=True)
        
        invalid_ids = set(value) - set(valid_ids)
        if invalid_ids:
            raise serializers.ValidationError(
                f'Invalid user IDs: {list(invalid_ids)}'
            )
        return value
    
    def create(self, validated_data):
        """Create notifications for multiple users"""
        from users.models import User
        
        user_ids = validated_data.pop('user_ids')
        users = User.objects.filter(id__in=user_ids)
        
        notifications = []
        for user in users:
            notification = Notification.objects.create(
                user=user,
                **validated_data
            )
            notifications.append(notification)
        
        return notifications


class PushNotificationSerializer(serializers.Serializer):
    """Serializer for sending push notifications"""
    
    title = serializers.CharField(max_length=255)
    body = serializers.CharField()
    data = serializers.JSONField(required=False, default=dict)
    user_ids = serializers.ListField(
        child=serializers.IntegerField(),
        required=False
    )
    device_tokens = serializers.ListField(
        child=serializers.CharField(),
        required=False
    )
    
    def validate(self, attrs):
        """Ensure either user_ids or device_tokens are provided"""
        if not attrs.get('user_ids') and not attrs.get('device_tokens'):
            raise serializers.ValidationError(
                'Either user_ids or device_tokens must be provided'
            )
        return attrs