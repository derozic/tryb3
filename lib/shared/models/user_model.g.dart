// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      displayName: json['displayName'] as String?,
      bio: json['bio'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
      status:
          $enumDecodeNullable(_$UserStatusEnumMap, json['status']) ??
          UserStatus.pending,
      followersCount: (json['followersCount'] as num?)?.toInt() ?? 0,
      followingCount: (json['followingCount'] as num?)?.toInt() ?? 0,
      postsCount: (json['postsCount'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
      approvedBy: json['approvedBy'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'displayName': instance.displayName,
      'bio': instance.bio,
      'profileImageUrl': instance.profileImageUrl,
      'isVerified': instance.isVerified,
      'status': _$UserStatusEnumMap[instance.status]!,
      'followersCount': instance.followersCount,
      'followingCount': instance.followingCount,
      'postsCount': instance.postsCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'approvedBy': instance.approvedBy,
    };

const _$UserStatusEnumMap = {
  UserStatus.pending: 'pending',
  UserStatus.approved: 'approved',
  UserStatus.rejected: 'rejected',
  UserStatus.suspended: 'suspended',
  UserStatus.deleted: 'deleted',
};
