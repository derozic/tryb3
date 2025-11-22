import 'package:freezed_annotation/freezed_annotation.dart';
import '../../shared/models/user_model.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    required String id,
    required String authorId,
    required String authorName,
    String? authorAvatar,
    required String content,
    List<String>? imageUrls,
    String? videoUrl,
    String? linkUrl,
    String? linkTitle,
    String? linkDescription,
    String? linkImage,
    required PostType postType,
    required PostVisibility visibility,
    @Default([]) List<String> likedByIds,
    @Default(0) int commentCount,
    @Default(0) int shareCount,
    @Default([]) List<String> hashtags,
    @Default([]) List<String> mentionedUserIds,
    String? locationName,
    double? latitude,
    double? longitude,
    String? eventId,
    Map<String, dynamic>? metadata,
    required DateTime createdAt,
    DateTime? updatedAt,
    @Default(false) bool isEdited,
    @Default(false) bool isPinned,
    @Default(false) bool isPromoted,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}

@freezed
class PostComment with _$PostComment {
  const factory PostComment({
    required String id,
    required String postId,
    required String authorId,
    required String authorName,
    String? authorAvatar,
    required String content,
    String? parentCommentId,
    @Default([]) List<String> likedByIds,
    @Default(0) int replyCount,
    required DateTime createdAt,
    DateTime? updatedAt,
    @Default(false) bool isEdited,
  }) = _PostComment;

  factory PostComment.fromJson(Map<String, dynamic> json) => _$PostCommentFromJson(json);
}

@freezed
class CreatePostRequest with _$CreatePostRequest {
  const factory CreatePostRequest({
    required String content,
    List<String>? imageUrls,
    String? videoUrl,
    String? linkUrl,
    @Default(PostType.text) PostType postType,
    @Default(PostVisibility.public) PostVisibility visibility,
    List<String>? hashtags,
    List<String>? mentionedUserIds,
    String? locationName,
    double? latitude,
    double? longitude,
    String? eventId,
  }) = _CreatePostRequest;

  factory CreatePostRequest.fromJson(Map<String, dynamic> json) => _$CreatePostRequestFromJson(json);
}

@freezed
class PostReaction with _$PostReaction {
  const factory PostReaction({
    required String id,
    required String postId,
    required String userId,
    required String username,
    String? userAvatar,
    required ReactionType reactionType,
    required DateTime createdAt,
  }) = _PostReaction;

  factory PostReaction.fromJson(Map<String, dynamic> json) => _$PostReactionFromJson(json);
}

enum PostType {
  text,
  image,
  video,
  link,
  poll,
  event,
  location,
}

enum PostVisibility {
  public,
  friends,
  private,
  unlisted,
}

enum ReactionType {
  like,
  love,
  laugh,
  wow,
  sad,
  angry,
}

extension PostTypeExtension on PostType {
  String get displayName {
    switch (this) {
      case PostType.text:
        return 'Text';
      case PostType.image:
        return 'Image';
      case PostType.video:
        return 'Video';
      case PostType.link:
        return 'Link';
      case PostType.poll:
        return 'Poll';
      case PostType.event:
        return 'Event';
      case PostType.location:
        return 'Location';
    }
  }

  String get icon {
    switch (this) {
      case PostType.text:
        return '📝';
      case PostType.image:
        return '📸';
      case PostType.video:
        return '🎥';
      case PostType.link:
        return '🔗';
      case PostType.poll:
        return '📊';
      case PostType.event:
        return '📅';
      case PostType.location:
        return '📍';
    }
  }
}

extension ReactionTypeExtension on ReactionType {
  String get emoji {
    switch (this) {
      case ReactionType.like:
        return '👍';
      case ReactionType.love:
        return '❤️';
      case ReactionType.laugh:
        return '😂';
      case ReactionType.wow:
        return '😮';
      case ReactionType.sad:
        return '😢';
      case ReactionType.angry:
        return '😡';
    }
  }

  String get displayName {
    switch (this) {
      case ReactionType.like:
        return 'Like';
      case ReactionType.love:
        return 'Love';
      case ReactionType.laugh:
        return 'Laugh';
      case ReactionType.wow:
        return 'Wow';
      case ReactionType.sad:
        return 'Sad';
      case ReactionType.angry:
        return 'Angry';
    }
  }
}