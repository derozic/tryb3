from django.urls import path
from . import views

app_name = 'users'

urlpatterns = [
    # Authentication endpoints
    path('auth/register/', views.register_view, name='register'),
    path('auth/login/', views.login_view, name='login'),
    path('auth/logout/', views.logout_view, name='logout'),
    
    # Profile endpoints
    path('profile/', views.profile_view, name='profile'),
    path('profile/update/', views.update_profile_view, name='update_profile'),
    path('profile/change-password/', views.change_password_view, name='change_password'),
    
    # User management
    path('users/', views.UserListView.as_view(), name='user_list'),
    path('users/<str:username>/', views.UserDetailView.as_view(), name='user_detail'),
    
    # Admin endpoints
    path('admin/pending/', views.PendingUsersView.as_view(), name='pending_users'),
    path('admin/approve/<int:user_id>/', views.approve_user_view, name='approve_user'),
    
    # Follow/Unfollow
    path('follow/<str:username>/', views.follow_user_view, name='follow_user'),
    path('unfollow/<str:username>/', views.unfollow_user_view, name='unfollow_user'),
    path('<str:username>/followers/', views.user_followers_view, name='user_followers'),
    path('<str:username>/following/', views.user_following_view, name='user_following'),
]