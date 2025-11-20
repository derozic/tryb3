from rest_framework import viewsets, status, permissions
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.pagination import PageNumberPagination
from django.db.models import Q
from django.utils import timezone
from django.db import transaction
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync
import logging

from .models import Notification, NotificationPreference, NotificationDevice, NotificationType
from .serializers import (
    NotificationSerializer, NotificationPreferenceSerializer, 
    NotificationDeviceSerializer, BulkMarkReadSerializer, 
    NotificationCreateSerializer, PushNotificationSerializer
)
# from .services import PushNotificationService

logger = logging.getLogger(__name__)


class NotificationPagination(PageNumberPagination):
    page_size = 20
    page_size_query_param = 'page_size'
    max_page_size = 100


class NotificationViewSet(viewsets.ModelViewSet):
    serializer_class = NotificationSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = NotificationPagination
    
    def get_queryset(self):
        queryset = Notification.objects.filter(user=self.request.user)
        
        notification_type = self.request.query_params.get('type')
        if notification_type:
            queryset = queryset.filter(notification_type=notification_type)
        
        is_read = self.request.query_params.get('is_read')
        if is_read is not None:
            queryset = queryset.filter(is_read=is_read.lower() == 'true')
        
        search = self.request.query_params.get('search')
        if search:
            queryset = queryset.filter(
                Q(title__icontains=search) | Q(message__icontains=search)
            )
        
        return queryset.select_related('actor').order_by('-created_at')
    
    def perform_create(self, serializer):
        serializer.save(user=self.request.user)
    
    @action(detail=True, methods=['post'])
    def mark_read(self, request, pk=None):
        notification = self.get_object()
        notification.mark_as_read()
        
        self._send_notification_update(notification)
        
        return Response(
            NotificationSerializer(notification).data,
            status=status.HTTP_200_OK
        )
    
    @action(detail=False, methods=['post'])
    def mark_all_read(self, request):
        updated_count = Notification.objects.filter(
            user=request.user,
            is_read=False
        ).update(is_read=True, updated_at=timezone.now())
        
        self._send_unread_count_update(request.user)
        
        return Response({
            'message': f'Marked {updated_count} notifications as read',
            'updated_count': updated_count
        }, status=status.HTTP_200_OK)
    
    @action(detail=False, methods=['post'])
    def bulk_mark_read(self, request):
        serializer = BulkMarkReadSerializer(
            data=request.data,
            context={'request': request}
        )
        serializer.is_valid(raise_exception=True)
        
        notification_ids = serializer.validated_data['notification_ids']
        updated_count = Notification.objects.filter(
            id__in=notification_ids,
            user=request.user,
            is_read=False
        ).update(is_read=True, updated_at=timezone.now())
        
        self._send_unread_count_update(request.user)
        
        return Response({
            'message': f'Marked {updated_count} notifications as read',
            'updated_count': updated_count
        }, status=status.HTTP_200_OK)
    
    @action(detail=False, methods=['get'])
    def unread_count(self, request):
        count = Notification.objects.filter(
            user=request.user,
            is_read=False
        ).count()
        
        return Response({'unread_count': count}, status=status.HTTP_200_OK)
    
    @action(detail=False, methods=['delete'])
    def clear_old(self, request):
        cutoff_date = timezone.now() - timezone.timedelta(days=30)
        deleted_count, _ = Notification.objects.filter(
            user=request.user,
            is_read=True,
            created_at__lt=cutoff_date
        ).delete()
        
        return Response({
            'message': f'Cleared {deleted_count} old notifications',
            'deleted_count': deleted_count
        }, status=status.HTTP_200_OK)
    
    def _send_notification_update(self, notification):
        try:
            channel_layer = get_channel_layer()
            group_name = f"notifications_{notification.user.id}"
            
            async_to_sync(channel_layer.group_send)(group_name, {
                'type': 'notification_update',
                'notification': NotificationSerializer(notification).data
            })
        except Exception as e:
            logger.error(f"Failed to send notification update: {e}")
    
    def _send_unread_count_update(self, user):
        try:
            channel_layer = get_channel_layer()
            group_name = f"notifications_{user.id}"
            
            unread_count = Notification.objects.filter(
                user=user,
                is_read=False
            ).count()
            
            async_to_sync(channel_layer.group_send)(group_name, {
                'type': 'unread_count_update',
                'unread_count': unread_count
            })
        except Exception as e:
            logger.error(f"Failed to send unread count update: {e}")


class NotificationPreferenceViewSet(viewsets.ModelViewSet):
    serializer_class = NotificationPreferenceSerializer
    permission_classes = [permissions.IsAuthenticated]
    http_method_names = ['get', 'put', 'patch']
    
    def get_object(self):
        preference, created = NotificationPreference.objects.get_or_create(
            user=self.request.user
        )
        return preference
    
    def get_queryset(self):
        return NotificationPreference.objects.filter(user=self.request.user)
    
    def list(self, request):
        preference = self.get_object()
        serializer = self.get_serializer(preference)
        return Response(serializer.data)


class NotificationDeviceViewSet(viewsets.ModelViewSet):
    serializer_class = NotificationDeviceSerializer
    permission_classes = [permissions.IsAuthenticated]
    
    def get_queryset(self):
        return NotificationDevice.objects.filter(
            user=self.request.user
        ).order_by('-last_used')
    
    def perform_create(self, serializer):
        device_id = serializer.validated_data.get('device_id')
        existing_device = NotificationDevice.objects.filter(
            user=self.request.user,
            device_id=device_id
        ).first()
        
        if existing_device:
            for attr, value in serializer.validated_data.items():
                setattr(existing_device, attr, value)
            existing_device.is_active = True
            existing_device.save()
            self.instance = existing_device
        else:
            serializer.save(user=self.request.user)
    
    @action(detail=True, methods=['post'])
    def deactivate(self, request, pk=None):
        device = self.get_object()
        device.is_active = False
        device.save()
        
        return Response(
            NotificationDeviceSerializer(device).data,
            status=status.HTTP_200_OK
        )
    
    @action(detail=False, methods=['post'])
    def deactivate_all(self, request):
        updated_count = NotificationDevice.objects.filter(
            user=request.user,
            is_active=True
        ).update(is_active=False)
        
        return Response({
            'message': f'Deactivated {updated_count} devices',
            'updated_count': updated_count
        }, status=status.HTTP_200_OK)


class AdminNotificationViewSet(viewsets.ViewSet):
    permission_classes = [permissions.IsAdminUser]
    
    @action(detail=False, methods=['post'])
    def create_bulk(self, request):
        serializer = NotificationCreateSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        
        notifications = serializer.save()
        
        for notification in notifications:
            self._send_notification_created(notification)
        
        return Response({
            'message': f'Created {len(notifications)} notifications',
            'created_count': len(notifications),
            'notifications': NotificationSerializer(notifications, many=True).data
        }, status=status.HTTP_201_CREATED)
    
    @action(detail=False, methods=['get'])
    def stats(self, request):
        from django.db.models import Count
        
        cutoff_date = timezone.now() - timezone.timedelta(days=30)
        
        stats = {
            'total_notifications': Notification.objects.filter(
                created_at__gte=cutoff_date
            ).count(),
            'by_type': dict(Notification.objects.filter(
                created_at__gte=cutoff_date
            ).values('notification_type').annotate(
                count=Count('id')
            ).values_list('notification_type', 'count')),
            'read_rate': self._calculate_read_rate(cutoff_date),
            'active_devices': NotificationDevice.objects.filter(
                is_active=True
            ).count(),
            'users_with_notifications': Notification.objects.filter(
                created_at__gte=cutoff_date
            ).values('user').distinct().count()
        }
        
        return Response(stats, status=status.HTTP_200_OK)
    
    def _calculate_read_rate(self, cutoff_date):
        total = Notification.objects.filter(created_at__gte=cutoff_date).count()
        read = Notification.objects.filter(
            created_at__gte=cutoff_date,
            is_read=True
        ).count()
        
        return round((read / total * 100) if total > 0 else 0, 2)
    
    def _send_notification_created(self, notification):
        try:
            channel_layer = get_channel_layer()
            group_name = f"notifications_{notification.user.id}"
            
            async_to_sync(channel_layer.group_send)(group_name, {
                'type': 'notification_created',
                'notification': NotificationSerializer(notification).data
            })
        except Exception as e:
            logger.error(f"Failed to send notification created update: {e}")
