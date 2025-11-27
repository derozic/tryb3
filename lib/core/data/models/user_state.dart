import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

/// Professional state management models with immutability and serialization
@freezed
class UserState with _$UserState {
  const factory UserState({
    required AuthenticationStatus authStatus,
    UserProfile? currentUser,
    PersonalizationSettings? personalization,
    SyncStatus? syncStatus,
    @Default({}) Map<String, dynamic> metadata,
    DateTime? lastSyncedAt,
  }) = _UserState;
  
  factory UserState.initial() => const UserState(
    authStatus: AuthenticationStatus.unknown(),
  );
  
  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
}

@freezed
class AuthenticationStatus with _$AuthenticationStatus {
  const factory AuthenticationStatus.unknown() = _Unknown;
  const factory AuthenticationStatus.authenticated({
    required String userId,
    required String token,
    String? refreshToken,
    DateTime? expiresAt,
  }) = _Authenticated;
  const factory AuthenticationStatus.unauthenticated({
    String? reason,
  }) = _Unauthenticated;
  const factory AuthenticationStatus.authenticating() = _Authenticating;
}

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String username,
    required String email,
    String? displayName,
    String? avatar,
    String? bio,
    String? phoneNumber,
    @Default(false) bool isVerified,
    @Default(false) bool isPremium,
    UserPreferences? preferences,
    UserStats? stats,
    @Default({}) Map<String, dynamic> metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserProfile;
  
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    @Default('system') String theme,
    @Default('en') String language,
    @Default(true) bool notificationsEnabled,
    @Default(true) bool soundEnabled,
    @Default(true) bool vibrationEnabled,
    @Default('public') String defaultPostVisibility,
    @Default(true) bool autoPlayVideos,
    @Default(false) bool reducedMotion,
    PrivacySettings? privacy,
    @Default({}) Map<String, dynamic> custom,
  }) = _UserPreferences;
  
  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
}

@freezed
class PrivacySettings with _$PrivacySettings {
  const factory PrivacySettings({
    @Default(true) bool allowDirectMessages,
    @Default(true) bool allowFriendRequests,
    @Default('friends') String profileVisibility, // public, friends, private
    @Default('everyone') String whoCanTag, // everyone, friends, no_one
    @Default(false) bool hideOnlineStatus,
    @Default(false) bool hideLastSeen,
    @Default([]) List<String> blockedUsers,
    @Default([]) List<String> mutedUsers,
  }) = _PrivacySettings;
  
  factory PrivacySettings.fromJson(Map<String, dynamic> json) =>
      _$PrivacySettingsFromJson(json);
}

@freezed
class UserStats with _$UserStats {
  const factory UserStats({
    @Default(0) int postsCount,
    @Default(0) int followersCount,
    @Default(0) int followingCount,
    @Default(0) int friendsCount,
    @Default(0) int likesReceived,
    @Default(0) int commentsReceived,
    @Default(0) int sharesCount,
    @Default(0) int achievementsUnlocked,
    @Default(0) int streakDays,
    DateTime? memberSince,
    @Default({}) Map<String, int> activityByDay,
  }) = _UserStats;
  
  factory UserStats.fromJson(Map<String, dynamic> json) =>
      _$UserStatsFromJson(json);
}

@freezed
class PersonalizationSettings with _$PersonalizationSettings {
  const factory PersonalizationSettings({
    required String userId,
    @Default([]) List<String> interests,
    @Default([]) List<String> followedTopics,
    @Default({}) Map<String, double> contentPreferences, // content_type -> weight
    @Default([]) List<String> mutedWords,
    @Default([]) List<String> mutedTopics,
    RecommendationSettings? recommendations,
    @Default({}) Map<String, dynamic> mlFeatures,
    DateTime? lastUpdated,
  }) = _PersonalizationSettings;
  
  factory PersonalizationSettings.fromJson(Map<String, dynamic> json) =>
      _$PersonalizationSettingsFromJson(json);
}

@freezed
class RecommendationSettings with _$RecommendationSettings {
  const factory RecommendationSettings({
    @Default(true) bool enableRecommendations,
    @Default('balanced') String algorithm, // balanced, explore, exploit
    @Default(0.5) double diversityFactor,
    @Default(0.7) double relevanceThreshold,
    @Default([]) List<String> excludeCategories,
    @Default(20) int batchSize,
  }) = _RecommendationSettings;
  
  factory RecommendationSettings.fromJson(Map<String, dynamic> json) =>
      _$RecommendationSettingsFromJson(json);
}

@freezed
class SyncStatus with _$SyncStatus {
  const factory SyncStatus.idle() = _Idle;
  const factory SyncStatus.syncing({
    required double progress,
    String? message,
  }) = _Syncing;
  const factory SyncStatus.success({
    required DateTime syncedAt,
  }) = _Success;
  const factory SyncStatus.error({
    required String message,
    Object? error,
  }) = _Error;
  const factory SyncStatus.offline({
    required int pendingOperations,
  }) = _Offline;
}

/// App-wide state container
@freezed
class AppState with _$AppState {
  const factory AppState({
    required UserState userState,
    required ChatState chatState,
    required SocialState socialState,
    required NetworkState networkState,
    required UIState uiState,
    @Default({}) Map<String, dynamic> featureFlags,
    DateTime? lastActiveAt,
  }) = _AppState;
  
  factory AppState.initial() => AppState(
    userState: UserState.initial(),
    chatState: ChatState.initial(),
    socialState: SocialState.initial(),
    networkState: const NetworkState.connected(),
    uiState: UIState.initial(),
  );
  
  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<ChatRoom> rooms,
    @Default({}) Map<String, List<ChatMessage>> messages,
    @Default(0) int unreadCount,
    String? activeRoomId,
    @Default({}) Map<String, TypingIndicator> typingIndicators,
  }) = _ChatState;
  
  factory ChatState.initial() => const ChatState();
  
  factory ChatState.fromJson(Map<String, dynamic> json) =>
      _$ChatStateFromJson(json);
}

@freezed
class SocialState with _$SocialState {
  const factory SocialState({
    @Default([]) List<Post> feedPosts,
    @Default([]) List<Post> userPosts,
    @Default({}) Map<String, bool> likedPosts,
    @Default({}) Map<String, bool> savedPosts,
    FeedFilter? activeFilter,
    @Default(false) bool isRefreshing,
    String? nextPageToken,
  }) = _SocialState;
  
  factory SocialState.initial() => const SocialState();
  
  factory SocialState.fromJson(Map<String, dynamic> json) =>
      _$SocialStateFromJson(json);
}

@freezed
class NetworkState with _$NetworkState {
  const factory NetworkState.connected() = _Connected;
  const factory NetworkState.disconnected() = _Disconnected;
  const factory NetworkState.connecting() = _Connecting;
  const factory NetworkState.slow({
    required int latencyMs,
  }) = _Slow;
}

@freezed
class UIState with _$UIState {
  const factory UIState({
    @Default(0) int bottomNavIndex,
    @Default(false) bool isLoading,
    String? activeDialog,
    @Default([]) List<Toast> toasts,
    @Default({}) Map<String, bool> expandedSections,
    ScrollPosition? lastScrollPosition,
  }) = _UIState;
  
  factory UIState.initial() => const UIState();
  
  factory UIState.fromJson(Map<String, dynamic> json) =>
      _$UIStateFromJson(json);
}

// Supporting models
@freezed
class ChatRoom with _$ChatRoom {
  const factory ChatRoom({
    required String id,
    required String name,
    String? avatar,
    required List<String> participants,
    String? lastMessage,
    DateTime? lastMessageAt,
    @Default(0) int unreadCount,
    @Default(false) bool isPinned,
    @Default(false) bool isMuted,
  }) = _ChatRoom;
  
  factory ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomFromJson(json);
}

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required String roomId,
    required String senderId,
    required String content,
    @Default('text') String type,
    DateTime? sentAt,
    DateTime? readAt,
    DateTime? deliveredAt,
    String? replyToId,
    @Default({}) Map<String, dynamic> metadata,
  }) = _ChatMessage;
  
  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String authorId,
    required String authorName,
    String? authorAvatar,
    required String content,
    @Default([]) List<String> mediaUrls,
    @Default('text') String type,
    @Default(0) int likeCount,
    @Default(0) int commentCount,
    @Default(0) int shareCount,
    @Default(false) bool isLiked,
    @Default(false) bool isSaved,
    DateTime? createdAt,
    @Default({}) Map<String, dynamic> metadata,
  }) = _Post;
  
  factory Post.fromJson(Map<String, dynamic> json) =>
      _$PostFromJson(json);
}

@freezed
class TypingIndicator with _$TypingIndicator {
  const factory TypingIndicator({
    required String userId,
    required String roomId,
    required DateTime startedAt,
  }) = _TypingIndicator;
  
  factory TypingIndicator.fromJson(Map<String, dynamic> json) =>
      _$TypingIndicatorFromJson(json);
}

@freezed
class FeedFilter with _$FeedFilter {
  const factory FeedFilter({
    @Default('all') String type, // all, following, trending
    @Default('recent') String sortBy, // recent, popular, relevant
    List<String>? tags,
    DateTimeRange? dateRange,
  }) = _FeedFilter;
  
  factory FeedFilter.fromJson(Map<String, dynamic> json) =>
      _$FeedFilterFromJson(json);
}

@freezed
class Toast with _$Toast {
  const factory Toast({
    required String id,
    required String message,
    @Default('info') String type, // info, success, warning, error
    @Default(3000) int durationMs,
    String? actionLabel,
    Function? onAction,
  }) = _Toast;
}

@freezed
class ScrollPosition with _$ScrollPosition {
  const factory ScrollPosition({
    required String screenId,
    required double offset,
    DateTime? savedAt,
  }) = _ScrollPosition;
  
  factory ScrollPosition.fromJson(Map<String, dynamic> json) =>
      _$ScrollPositionFromJson(json);
}

class DateTimeRange {
  final DateTime start;
  final DateTime end;
  
  DateTimeRange({required this.start, required this.end});
}