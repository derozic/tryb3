import 'package:freezed_annotation/freezed_annotation.dart';
import '../../shared/models/user_model.dart';

part 'friend_model.freezed.dart';
part 'friend_model.g.dart';

@freezed
class FriendConnection with _$FriendConnection {
  const factory FriendConnection({
    required String id,
    required String userId,
    required String friendId,
    required User friend,
    required FriendshipStatus status,
    required DateTime createdAt,
    DateTime? acceptedAt,
    String? mutualConnectionCount,
    @Default(false) bool isBlocked,
    @Default(false) bool isMuted,
    @Default(false) bool isCloseFriend,
    Map<String, dynamic>? metadata,
  }) = _FriendConnection;

  factory FriendConnection.fromJson(Map<String, dynamic> json) => _$FriendConnectionFromJson(json);
}

@freezed
class FriendRequest with _$FriendRequest {
  const factory FriendRequest({
    required String id,
    required String senderId,
    required User sender,
    required String receiverId,
    required User receiver,
    String? message,
    required FriendRequestStatus status,
    required DateTime createdAt,
    DateTime? respondedAt,
    Map<String, dynamic>? metadata,
  }) = _FriendRequest;

  factory FriendRequest.fromJson(Map<String, dynamic> json) => _$FriendRequestFromJson(json);
}

@freezed
class SendFriendRequestModel with _$SendFriendRequestModel {
  const factory SendFriendRequestModel({
    required String userId,
    String? message,
  }) = _SendFriendRequestModel;

  factory SendFriendRequestModel.fromJson(Map<String, dynamic> json) => _$SendFriendRequestModelFromJson(json);
}

@freezed
class UserSuggestion with _$UserSuggestion {
  const factory UserSuggestion({
    required User user,
    required SuggestionReason reason,
    @Default([]) List<User> mutualFriends,
    @Default(0) int mutualFriendsCount,
    @Default(0.0) double relevanceScore,
  }) = _UserSuggestion;

  factory UserSuggestion.fromJson(Map<String, dynamic> json) => _$UserSuggestionFromJson(json);
}

@freezed
class NetworkStats with _$NetworkStats {
  const factory NetworkStats({
    required int friendsCount,
    required int pendingRequestsCount,
    required int sentRequestsCount,
    required int mutualConnectionsCount,
    required int blockedUsersCount,
    @Default([]) List<User> recentConnections,
    @Default([]) List<UserSuggestion> suggestions,
  }) = _NetworkStats;

  factory NetworkStats.fromJson(Map<String, dynamic> json) => _$NetworkStatsFromJson(json);
}

enum FriendshipStatus {
  pending,
  accepted,
  blocked,
  removed,
}

enum FriendRequestStatus {
  pending,
  accepted,
  declined,
  cancelled,
}

enum SuggestionReason {
  mutualFriends,
  location,
  interests,
  contacts,
  recentActivity,
  profileSimilarity,
}

extension FriendshipStatusExtension on FriendshipStatus {
  String get displayName {
    switch (this) {
      case FriendshipStatus.pending:
        return 'Pending';
      case FriendshipStatus.accepted:
        return 'Friends';
      case FriendshipStatus.blocked:
        return 'Blocked';
      case FriendshipStatus.removed:
        return 'Removed';
    }
  }

  String get icon {
    switch (this) {
      case FriendshipStatus.pending:
        return '⏳';
      case FriendshipStatus.accepted:
        return '✅';
      case FriendshipStatus.blocked:
        return '🚫';
      case FriendshipStatus.removed:
        return '❌';
    }
  }
}

extension FriendRequestStatusExtension on FriendRequestStatus {
  String get displayName {
    switch (this) {
      case FriendRequestStatus.pending:
        return 'Pending';
      case FriendRequestStatus.accepted:
        return 'Accepted';
      case FriendRequestStatus.declined:
        return 'Declined';
      case FriendRequestStatus.cancelled:
        return 'Cancelled';
    }
  }

  String get icon {
    switch (this) {
      case FriendRequestStatus.pending:
        return '⏳';
      case FriendRequestStatus.accepted:
        return '✅';
      case FriendRequestStatus.declined:
        return '❌';
      case FriendRequestStatus.cancelled:
        return '🚫';
    }
  }
}

extension SuggestionReasonExtension on SuggestionReason {
  String get displayName {
    switch (this) {
      case SuggestionReason.mutualFriends:
        return 'Mutual Friends';
      case SuggestionReason.location:
        return 'Location';
      case SuggestionReason.interests:
        return 'Similar Interests';
      case SuggestionReason.contacts:
        return 'From Contacts';
      case SuggestionReason.recentActivity:
        return 'Recent Activity';
      case SuggestionReason.profileSimilarity:
        return 'Similar Profile';
    }
  }

  String get icon {
    switch (this) {
      case SuggestionReason.mutualFriends:
        return '👥';
      case SuggestionReason.location:
        return '📍';
      case SuggestionReason.interests:
        return '🎯';
      case SuggestionReason.contacts:
        return '📱';
      case SuggestionReason.recentActivity:
        return '⚡';
      case SuggestionReason.profileSimilarity:
        return '🔄';
    }
  }
}