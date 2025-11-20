from rest_framework import serializers
from django.contrib.auth import authenticate
from django.contrib.auth.password_validation import validate_password
from django.core.exceptions import ValidationError
from .models import User, UserProfile, UserFollow, UserStatus


class UserProfileSerializer(serializers.ModelSerializer):
    """Serializer for UserProfile model"""
    
    class Meta:
        model = UserProfile
        fields = [
            'phone', 'date_of_birth', 'location', 'website',
            'show_email', 'show_phone', 'show_location',
            'profile_views', 'last_profile_update'
        ]
        read_only_fields = ['profile_views', 'last_profile_update']


class UserSerializer(serializers.ModelSerializer):
    """Serializer for User model - matches Flutter UserModel"""
    
    profile = UserProfileSerializer(read_only=True)
    avatar_url = serializers.ReadOnlyField()
    full_name = serializers.ReadOnlyField()
    followers_count = serializers.ReadOnlyField()
    following_count = serializers.ReadOnlyField()
    password = serializers.CharField(write_only=True, validators=[validate_password])
    password_confirm = serializers.CharField(write_only=True)
    
    class Meta:
        model = User
        fields = [
            'id', 'username', 'email', 'first_name', 'last_name', 'bio',
            'avatar', 'avatar_url', 'full_name', 'is_verified', 'status',
            'approved_at', 'approved_by', 'followers_count', 'following_count',
            'created_at', 'updated_at', 'last_login_at', 'is_private',
            'email_notifications', 'push_notifications', 'profile',
            'password', 'password_confirm'
        ]
        read_only_fields = [
            'id', 'avatar_url', 'full_name', 'followers_count', 'following_count',
            'is_verified', 'status', 'approved_at', 'approved_by',
            'created_at', 'updated_at', 'last_login_at'
        ]
        extra_kwargs = {
            'password': {'write_only': True},
            'email': {'required': True}
        }
    
    def validate(self, attrs):
        """Validate password confirmation"""
        if 'password' in attrs and 'password_confirm' in attrs:
            if attrs['password'] != attrs['password_confirm']:
                raise serializers.ValidationError("Passwords don't match")
        return attrs
    
    def create(self, validated_data):
        """Create user with password hashing"""
        validated_data.pop('password_confirm', None)
        password = validated_data.pop('password')
        
        user = User.objects.create_user(
            password=password,
            **validated_data
        )
        
        # Create associated profile
        UserProfile.objects.create(user=user)
        
        return user
    
    def update(self, instance, validated_data):
        """Update user, handling password separately"""
        validated_data.pop('password_confirm', None)
        password = validated_data.pop('password', None)
        
        if password:
            instance.set_password(password)
        
        for attr, value in validated_data.items():
            setattr(instance, attr, value)
        
        instance.save()
        return instance


class UserListSerializer(serializers.ModelSerializer):
    """Lightweight serializer for user lists"""
    
    avatar_url = serializers.ReadOnlyField()
    full_name = serializers.ReadOnlyField()
    
    class Meta:
        model = User
        fields = [
            'id', 'username', 'email', 'first_name', 'last_name',
            'avatar_url', 'full_name', 'is_verified', 'status', 'bio'
        ]


class UserFollowSerializer(serializers.ModelSerializer):
    """Serializer for follow relationships"""
    
    follower = UserListSerializer(read_only=True)
    followed = UserListSerializer(read_only=True)
    
    class Meta:
        model = UserFollow
        fields = ['id', 'follower', 'followed', 'is_active', 'created_at']
        read_only_fields = ['id', 'created_at']


class LoginSerializer(serializers.Serializer):
    """Serializer for user login"""
    
    email = serializers.EmailField()
    password = serializers.CharField()
    
    def validate(self, attrs):
        """Validate login credentials"""
        email = attrs.get('email')
        password = attrs.get('password')
        
        if email and password:
            user = authenticate(
                request=self.context.get('request'),
                username=email,
                password=password
            )
            
            if not user:
                raise serializers.ValidationError('Invalid credentials')
            
            if not user.can_login():
                if user.status == UserStatus.PENDING:
                    raise serializers.ValidationError(
                        'Your account is pending approval. Please wait for admin approval.'
                    )
                elif user.status == UserStatus.REJECTED:
                    raise serializers.ValidationError('Your account has been rejected.')
                elif user.status == UserStatus.SUSPENDED:
                    raise serializers.ValidationError('Your account has been suspended.')
                else:
                    raise serializers.ValidationError('Your account is not active.')
            
            attrs['user'] = user
            return attrs
        
        raise serializers.ValidationError('Email and password are required')


class RegisterSerializer(serializers.ModelSerializer):
    """Serializer for user registration"""
    
    password = serializers.CharField(write_only=True, validators=[validate_password])
    password_confirm = serializers.CharField(write_only=True)
    
    class Meta:
        model = User
        fields = [
            'username', 'email', 'first_name', 'last_name',
            'password', 'password_confirm', 'bio'
        ]
        extra_kwargs = {
            'email': {'required': True},
            'username': {'required': True}
        }
    
    def validate_email(self, value):
        """Validate email uniqueness"""
        if User.objects.filter(email=value).exists():
            raise serializers.ValidationError('Email already exists')
        return value
    
    def validate_username(self, value):
        """Validate username uniqueness"""
        if User.objects.filter(username=value).exists():
            raise serializers.ValidationError('Username already exists')
        return value
    
    def validate(self, attrs):
        """Validate password confirmation"""
        if attrs['password'] != attrs['password_confirm']:
            raise serializers.ValidationError("Passwords don't match")
        return attrs
    
    def create(self, validated_data):
        """Create new user account"""
        validated_data.pop('password_confirm')
        password = validated_data.pop('password')
        
        user = User.objects.create_user(
            password=password,
            status=UserStatus.PENDING,  # Requires admin approval
            **validated_data
        )
        
        # Create associated profile
        UserProfile.objects.create(user=user)
        
        return user


class PasswordChangeSerializer(serializers.Serializer):
    """Serializer for password change"""
    
    current_password = serializers.CharField()
    new_password = serializers.CharField(validators=[validate_password])
    new_password_confirm = serializers.CharField()
    
    def validate_current_password(self, value):
        """Validate current password"""
        user = self.context['request'].user
        if not user.check_password(value):
            raise serializers.ValidationError('Current password is incorrect')
        return value
    
    def validate(self, attrs):
        """Validate new password confirmation"""
        if attrs['new_password'] != attrs['new_password_confirm']:
            raise serializers.ValidationError("New passwords don't match")
        return attrs
    
    def save(self):
        """Change user password"""
        user = self.context['request'].user
        user.set_password(self.validated_data['new_password'])
        user.save()
        return user


class UserApprovalSerializer(serializers.Serializer):
    """Serializer for admin user approval actions"""
    
    action = serializers.ChoiceField(choices=['approve', 'reject', 'suspend'])
    reason = serializers.CharField(required=False, max_length=500)
    
    def validate(self, attrs):
        """Validate approval action"""
        user = self.context['user']
        action = attrs['action']
        
        if action == 'approve' and user.status != UserStatus.PENDING:
            raise serializers.ValidationError('User is not pending approval')
        
        return attrs
    
    def save(self):
        """Apply approval action"""
        user = self.context['user']
        admin_user = self.context['request'].user
        action = self.validated_data['action']
        
        if action == 'approve':
            user.approve(admin_user)
        elif action == 'reject':
            user.reject()
        elif action == 'suspend':
            user.suspend()
        
        return user