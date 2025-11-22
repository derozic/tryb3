import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    String? displayName,
    String? avatarUrl,
    String? bio,
    @Default(false) bool isEmailVerified,
    @Default(UserRole.user) UserRole role,
    DateTime? lastLoginAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

enum UserRole {
  user,
  admin,
  moderator,
}

extension UserRoleExtension on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.user:
        return 'User';
      case UserRole.admin:
        return 'Admin';
      case UserRole.moderator:
        return 'Moderator';
    }
  }

  bool get isAdmin => this == UserRole.admin;
  bool get isModerator => this == UserRole.moderator || isAdmin;
}