// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendConnectionImpl _$$FriendConnectionImplFromJson(
  Map<String, dynamic> json,
) => _$FriendConnectionImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  friendId: json['friendId'] as String,
  friend: User.fromJson(json['friend'] as Map<String, dynamic>),
  status: $enumDecode(_$FriendshipStatusEnumMap, json['status']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  acceptedAt: json['acceptedAt'] == null
      ? null
      : DateTime.parse(json['acceptedAt'] as String),
  mutualConnectionCount: json['mutualConnectionCount'] as String?,
  isBlocked: json['isBlocked'] as bool? ?? false,
  isMuted: json['isMuted'] as bool? ?? false,
  isCloseFriend: json['isCloseFriend'] as bool? ?? false,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$FriendConnectionImplToJson(
  _$FriendConnectionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'friendId': instance.friendId,
  'friend': instance.friend,
  'status': _$FriendshipStatusEnumMap[instance.status]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'acceptedAt': instance.acceptedAt?.toIso8601String(),
  'mutualConnectionCount': instance.mutualConnectionCount,
  'isBlocked': instance.isBlocked,
  'isMuted': instance.isMuted,
  'isCloseFriend': instance.isCloseFriend,
  'metadata': instance.metadata,
};

const _$FriendshipStatusEnumMap = {
  FriendshipStatus.pending: 'pending',
  FriendshipStatus.accepted: 'accepted',
  FriendshipStatus.blocked: 'blocked',
  FriendshipStatus.removed: 'removed',
};

_$FriendRequestImpl _$$FriendRequestImplFromJson(Map<String, dynamic> json) =>
    _$FriendRequestImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      sender: User.fromJson(json['sender'] as Map<String, dynamic>),
      receiverId: json['receiverId'] as String,
      receiver: User.fromJson(json['receiver'] as Map<String, dynamic>),
      message: json['message'] as String?,
      status: $enumDecode(_$FriendRequestStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      respondedAt: json['respondedAt'] == null
          ? null
          : DateTime.parse(json['respondedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$FriendRequestImplToJson(_$FriendRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'sender': instance.sender,
      'receiverId': instance.receiverId,
      'receiver': instance.receiver,
      'message': instance.message,
      'status': _$FriendRequestStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'respondedAt': instance.respondedAt?.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$FriendRequestStatusEnumMap = {
  FriendRequestStatus.pending: 'pending',
  FriendRequestStatus.accepted: 'accepted',
  FriendRequestStatus.declined: 'declined',
  FriendRequestStatus.cancelled: 'cancelled',
};

_$SendFriendRequestModelImpl _$$SendFriendRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$SendFriendRequestModelImpl(
  userId: json['userId'] as String,
  message: json['message'] as String?,
);

Map<String, dynamic> _$$SendFriendRequestModelImplToJson(
  _$SendFriendRequestModelImpl instance,
) => <String, dynamic>{'userId': instance.userId, 'message': instance.message};

_$UserSuggestionImpl _$$UserSuggestionImplFromJson(Map<String, dynamic> json) =>
    _$UserSuggestionImpl(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      reason: $enumDecode(_$SuggestionReasonEnumMap, json['reason']),
      mutualFriends:
          (json['mutualFriends'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      mutualFriendsCount: (json['mutualFriendsCount'] as num?)?.toInt() ?? 0,
      relevanceScore: (json['relevanceScore'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$UserSuggestionImplToJson(
  _$UserSuggestionImpl instance,
) => <String, dynamic>{
  'user': instance.user,
  'reason': _$SuggestionReasonEnumMap[instance.reason]!,
  'mutualFriends': instance.mutualFriends,
  'mutualFriendsCount': instance.mutualFriendsCount,
  'relevanceScore': instance.relevanceScore,
};

const _$SuggestionReasonEnumMap = {
  SuggestionReason.mutualFriends: 'mutualFriends',
  SuggestionReason.location: 'location',
  SuggestionReason.interests: 'interests',
  SuggestionReason.contacts: 'contacts',
  SuggestionReason.recentActivity: 'recentActivity',
  SuggestionReason.profileSimilarity: 'profileSimilarity',
};

_$NetworkStatsImpl _$$NetworkStatsImplFromJson(Map<String, dynamic> json) =>
    _$NetworkStatsImpl(
      friendsCount: (json['friendsCount'] as num).toInt(),
      pendingRequestsCount: (json['pendingRequestsCount'] as num).toInt(),
      sentRequestsCount: (json['sentRequestsCount'] as num).toInt(),
      mutualConnectionsCount: (json['mutualConnectionsCount'] as num).toInt(),
      blockedUsersCount: (json['blockedUsersCount'] as num).toInt(),
      recentConnections:
          (json['recentConnections'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      suggestions:
          (json['suggestions'] as List<dynamic>?)
              ?.map((e) => UserSuggestion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$NetworkStatsImplToJson(_$NetworkStatsImpl instance) =>
    <String, dynamic>{
      'friendsCount': instance.friendsCount,
      'pendingRequestsCount': instance.pendingRequestsCount,
      'sentRequestsCount': instance.sentRequestsCount,
      'mutualConnectionsCount': instance.mutualConnectionsCount,
      'blockedUsersCount': instance.blockedUsersCount,
      'recentConnections': instance.recentConnections,
      'suggestions': instance.suggestions,
    };
