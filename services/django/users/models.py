from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils import timezone
from PIL import Image
import os


class UserStatus(models.TextChoices):
    """User status enum matching Flutter frontend"""
    PENDING = 'pending', 'Pending'
    APPROVED = 'approved', 'Approved'
    REJECTED = 'rejected', 'Rejected'
    SUSPENDED = 'suspended', 'Suspended'
    DELETED = 'deleted', 'Deleted'


class User(AbstractUser):
    """
    Custom User model extending Django's AbstractUser
    Matches the UserModel structure from Flutter frontend
    """
    
    # Basic Profile Information
    email = models.EmailField(unique=True)
    bio = models.TextField(max_length=500, blank=True)
    avatar = models.ImageField(upload_to='avatars/', blank=True, null=True)
    is_verified = models.BooleanField(default=False)
    
    # User Status and Approval Workflow
    status = models.CharField(
        max_length=20,
        choices=UserStatus.choices,
        default=UserStatus.PENDING,
        help_text="User approval status"
    )
    approved_at = models.DateTimeField(blank=True, null=True)
    approved_by = models.ForeignKey(
        'self',
        on_delete=models.SET_NULL,
        blank=True,
        null=True,
        related_name='approved_users'
    )
    
    # Social Features
    followers = models.ManyToManyField(
        'self',
        through='UserFollow',
        symmetrical=False,
        related_name='following'
    )
    
    # Timestamps
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    last_login_at = models.DateTimeField(blank=True, null=True)
    
    # Settings
    is_private = models.BooleanField(default=False)
    email_notifications = models.BooleanField(default=True)
    push_notifications = models.BooleanField(default=True)
    
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']
    
    class Meta:
        db_table = 'users'
        indexes = [
            models.Index(fields=['email']),
            models.Index(fields=['username']),
            models.Index(fields=['status']),
            models.Index(fields=['created_at']),
        ]
    
    def __str__(self):
        return f"{self.username} ({self.email})"
    
    @property
    def avatar_url(self):
        """Get avatar URL for API responses"""
        if self.avatar:
            return self.avatar.url
        return f"https://i.pravatar.cc/150?u={self.email}"
    
    @property
    def full_name(self):
        """Get user's full name"""
        if self.first_name and self.last_name:
            return f"{self.first_name} {self.last_name}"
        return self.username
    
    @property
    def followers_count(self):
        """Get follower count"""
        return self.followers.filter(
            userfollow__is_active=True
        ).count()
    
    @property
    def following_count(self):
        """Get following count"""
        return self.following.filter(
            userfollow__is_active=True
        ).count()
    
    def approve(self, approved_by_user):
        """Approve user account"""
        self.status = UserStatus.APPROVED
        self.approved_at = timezone.now()
        self.approved_by = approved_by_user
        self.save()
    
    def reject(self):
        """Reject user account"""
        self.status = UserStatus.REJECTED
        self.save()
    
    def suspend(self):
        """Suspend user account"""
        self.status = UserStatus.SUSPENDED
        self.is_active = False
        self.save()
    
    def can_login(self):
        """Check if user can login"""
        return (
            self.is_active and 
            self.status == UserStatus.APPROVED
        )
    
    def save(self, *args, **kwargs):
        """Override save to handle avatar resizing"""
        super().save(*args, **kwargs)
        
        if self.avatar:
            img = Image.open(self.avatar.path)
            
            # Resize avatar to 300x300
            if img.height > 300 or img.width > 300:
                output_size = (300, 300)
                img.thumbnail(output_size)
                img.save(self.avatar.path)


class UserFollow(models.Model):
    """Through model for user follow relationships"""
    
    follower = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='following_relationships'
    )
    followed = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='follower_relationships'
    )
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        db_table = 'user_follows'
        unique_together = ('follower', 'followed')
        indexes = [
            models.Index(fields=['follower', 'is_active']),
            models.Index(fields=['followed', 'is_active']),
        ]
    
    def __str__(self):
        return f"{self.follower.username} follows {self.followed.username}"


class UserProfile(models.Model):
    """Extended user profile information"""
    
    user = models.OneToOneField(
        User,
        on_delete=models.CASCADE,
        related_name='profile'
    )
    
    # Extended Profile Fields
    phone = models.CharField(max_length=20, blank=True)
    date_of_birth = models.DateField(blank=True, null=True)
    location = models.CharField(max_length=100, blank=True)
    website = models.URLField(blank=True)
    
    # Privacy Settings
    show_email = models.BooleanField(default=False)
    show_phone = models.BooleanField(default=False)
    show_location = models.BooleanField(default=True)
    
    # Analytics
    profile_views = models.PositiveIntegerField(default=0)
    last_profile_update = models.DateTimeField(auto_now=True)
    
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        db_table = 'user_profiles'
    
    def __str__(self):
        return f"Profile for {self.user.username}"


class UserSession(models.Model):
    """Track user sessions for analytics and security"""
    
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='sessions'
    )
    
    session_key = models.CharField(max_length=40, unique=True)
    ip_address = models.GenericIPAddressField()
    user_agent = models.TextField()
    
    # Location data (optional)
    country = models.CharField(max_length=2, blank=True)
    city = models.CharField(max_length=100, blank=True)
    
    # Session lifecycle
    created_at = models.DateTimeField(auto_now_add=True)
    last_activity = models.DateTimeField(auto_now=True)
    expires_at = models.DateTimeField()
    is_active = models.BooleanField(default=True)
    
    class Meta:
        db_table = 'user_sessions'
        indexes = [
            models.Index(fields=['user', 'is_active']),
            models.Index(fields=['session_key']),
            models.Index(fields=['expires_at']),
        ]
    
    def __str__(self):
        return f"Session for {self.user.username} from {self.ip_address}"
