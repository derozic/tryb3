import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    required String id,
    required String userId,
    required String username,
    String? userDisplayName,
    String? userProfileImage,
    required String content,
    List<String>? imageUrls,
    String? videoUrl,
    @Default(0) int likesCount,
    @Default(0) int commentsCount,
    @Default(0) int sharesCount,
    @Default(false) bool isLiked,
    @Default(false) bool isBookmarked,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
      
  const PostModel._();
  
  bool get hasMedia => (imageUrls?.isNotEmpty == true) || videoUrl != null;
  bool get hasImages => imageUrls?.isNotEmpty == true;
  bool get hasVideo => videoUrl != null;
}