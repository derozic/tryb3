import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// User account status for approval workflow
enum UserStatus {
  pending,   // Newly registered, awaiting admin approval
  approved,  // Admin approved, fully functional account
  rejected,  // Admin rejected registration
  suspended, // Account suspended after approval
  deleted    // Soft deleted account
}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required String username,
    String? displayName,
    String? bio,
    String? profileImageUrl,
    @Default(false) bool isVerified,
    @Default(UserStatus.pending) UserStatus status, // New approval status
    @Default(0) int followersCount,
    @Default(0) int followingCount,
    @Default(0) int postsCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? approvedAt,
    String? approvedBy,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
      
  // Helper method for display name fallback
  const UserModel._();
  
  String get name => displayName?.isNotEmpty == true ? displayName! : username;
}