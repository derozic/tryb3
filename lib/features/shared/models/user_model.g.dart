// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  displayName: json['displayName'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  bio: json['bio'] as String?,
  isEmailVerified: json['isEmailVerified'] as bool? ?? false,
  role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']) ?? UserRole.user,
  lastLoginAt: json['lastLoginAt'] == null
      ? null
      : DateTime.parse(json['lastLoginAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'displayName': instance.displayName,
      'avatarUrl': instance.avatarUrl,
      'bio': instance.bio,
      'isEmailVerified': instance.isEmailVerified,
      'role': _$UserRoleEnumMap[instance.role]!,
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.user: 'user',
  UserRole.admin: 'admin',
  UserRole.moderator: 'moderator',
};
