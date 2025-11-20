from rest_framework import status, generics, permissions, filters
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from rest_framework.pagination import PageNumberPagination
from django.contrib.auth import login, logout
from django.utils import timezone
from django.db.models import Q
from django_filters.rest_framework import DjangoFilterBackend

from .models import User, UserFollow, UserStatus
from .serializers import (
    UserSerializer, UserListSerializer, LoginSerializer, 
    RegisterSerializer, PasswordChangeSerializer, UserApprovalSerializer,
    UserFollowSerializer
)


class UserPagination(PageNumberPagination):
    """Custom pagination for users"""
    page_size = 20
    page_size_query_param = 'page_size'
    max_page_size = 100


@api_view(['POST'])
@permission_classes([])
def register_view(request):
    """User registration endpoint"""
    serializer = RegisterSerializer(data=request.data)
    if serializer.is_valid():
        user = serializer.save()
        return Response({
            'message': 'Registration successful. Your account is pending approval.',
            'user': UserSerializer(user).data
        }, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@permission_classes([])
def login_view(request):
    """User login endpoint"""
    serializer = LoginSerializer(data=request.data, context={'request': request})
    if serializer.is_valid():
        user = serializer.validated_data['user']
        
        # Create or get token
        token, created = Token.objects.get_or_create(user=user)
        
        # Update last login
        user.last_login_at = timezone.now()
        user.save(update_fields=['last_login_at'])
        
        # Login user
        login(request, user)
        
        return Response({
            'message': 'Login successful',
            'token': token.key,
            'user': UserSerializer(user).data
        }, status=status.HTTP_200_OK)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def logout_view(request):
    """User logout endpoint"""
    try:
        # Delete token
        token = Token.objects.get(user=request.user)
        token.delete()
    except Token.DoesNotExist:
        pass
    
    logout(request)
    return Response({'message': 'Logout successful'}, status=status.HTTP_200_OK)


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def profile_view(request):
    """Get current user profile"""
    serializer = UserSerializer(request.user)
    return Response(serializer.data)


@api_view(['PUT', 'PATCH'])
@permission_classes([IsAuthenticated])
def update_profile_view(request):
    """Update current user profile"""
    serializer = UserSerializer(
        request.user, 
        data=request.data, 
        partial=request.method == 'PATCH'
    )
    if serializer.is_valid():
        serializer.save()
        return Response({
            'message': 'Profile updated successfully',
            'user': serializer.data
        })
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def change_password_view(request):
    """Change user password"""
    serializer = PasswordChangeSerializer(
        data=request.data,
        context={'request': request}
    )
    if serializer.is_valid():
        serializer.save()
        
        # Regenerate token after password change
        try:
            token = Token.objects.get(user=request.user)
            token.delete()
            new_token = Token.objects.create(user=request.user)
            return Response({
                'message': 'Password changed successfully',
                'token': new_token.key
            })
        except Token.DoesNotExist:
            return Response({'message': 'Password changed successfully'})
    
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UserListView(generics.ListAPIView):
    """List users with search and filtering"""
    
    queryset = User.objects.filter(status=UserStatus.APPROVED, is_active=True)
    serializer_class = UserListSerializer
    permission_classes = [IsAuthenticated]
    pagination_class = UserPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter]
    filterset_fields = ['is_verified', 'status']
    search_fields = ['username', 'first_name', 'last_name', 'email', 'bio']
    ordering_fields = ['username', 'created_at', 'last_login_at']
    ordering = ['-created_at']


class UserDetailView(generics.RetrieveAPIView):
    """Get user details"""
    
    queryset = User.objects.filter(status=UserStatus.APPROVED, is_active=True)
    serializer_class = UserSerializer
    permission_classes = [IsAuthenticated]
    lookup_field = 'username'


class PendingUsersView(generics.ListAPIView):
    """List pending users for admin approval"""
    
    queryset = User.objects.filter(status=UserStatus.PENDING)
    serializer_class = UserListSerializer
    permission_classes = [IsAdminUser]
    pagination_class = UserPagination
    filter_backends = [filters.OrderingFilter]
    ordering = ['created_at']


@api_view(['POST'])
@permission_classes([IsAdminUser])
def approve_user_view(request, user_id):
    """Admin endpoint to approve/reject/suspend users"""
    try:
        user = User.objects.get(id=user_id)
    except User.DoesNotExist:
        return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)
    
    serializer = UserApprovalSerializer(
        data=request.data,
        context={'request': request, 'user': user}
    )
    if serializer.is_valid():
        updated_user = serializer.save()
        return Response({
            'message': f'User {serializer.validated_data["action"]}d successfully',
            'user': UserListSerializer(updated_user).data
        })
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# Follow/Unfollow functionality
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def follow_user_view(request, username):
    """Follow a user"""
    try:
        user_to_follow = User.objects.get(
            username=username, 
            status=UserStatus.APPROVED,
            is_active=True
        )
    except User.DoesNotExist:
        return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)
    
    if user_to_follow == request.user:
        return Response({'error': 'Cannot follow yourself'}, status=status.HTTP_400_BAD_REQUEST)
    
    follow_obj, created = UserFollow.objects.get_or_create(
        follower=request.user,
        followed=user_to_follow,
        defaults={'is_active': True}
    )
    
    if not created and follow_obj.is_active:
        return Response({'message': 'Already following this user'}, status=status.HTTP_200_OK)
    
    if not created:
        follow_obj.is_active = True
        follow_obj.save()
    
    return Response({
        'message': f'Now following {user_to_follow.username}',
        'follow': UserFollowSerializer(follow_obj).data
    }, status=status.HTTP_201_CREATED)


@api_view(['DELETE'])
@permission_classes([IsAuthenticated])
def unfollow_user_view(request, username):
    """Unfollow a user"""
    try:
        user_to_unfollow = User.objects.get(username=username)
        follow_obj = UserFollow.objects.get(
            follower=request.user,
            followed=user_to_unfollow,
            is_active=True
        )
        follow_obj.is_active = False
        follow_obj.save()
        
        return Response({
            'message': f'Unfollowed {user_to_unfollow.username}'
        })
    except (User.DoesNotExist, UserFollow.DoesNotExist):
        return Response({'error': 'Follow relationship not found'}, status=status.HTTP_404_NOT_FOUND)


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def user_followers_view(request, username):
    """Get user's followers"""
    try:
        user = User.objects.get(username=username)
        followers = UserFollow.objects.filter(
            followed=user,
            is_active=True
        ).select_related('follower')
        
        paginator = UserPagination()
        page = paginator.paginate_queryset(followers, request)
        serializer = UserFollowSerializer(page, many=True)
        
        return paginator.get_paginated_response(serializer.data)
    except User.DoesNotExist:
        return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def user_following_view(request, username):
    """Get users that user is following"""
    try:
        user = User.objects.get(username=username)
        following = UserFollow.objects.filter(
            follower=user,
            is_active=True
        ).select_related('followed')
        
        paginator = UserPagination()
        page = paginator.paginate_queryset(following, request)
        serializer = UserFollowSerializer(page, many=True)
        
        return paginator.get_paginated_response(serializer.data)
    except User.DoesNotExist:
        return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)
