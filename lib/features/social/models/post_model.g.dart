// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      id: json['id'] as String,
      authorId: json['authorId'] as String,
      authorName: json['authorName'] as String,
      authorAvatar: json['authorAvatar'] as String?,
      content: json['content'] as String,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      videoUrl: json['videoUrl'] as String?,
      linkUrl: json['linkUrl'] as String?,
      linkTitle: json['linkTitle'] as String?,
      linkDescription: json['linkDescription'] as String?,
      linkImage: json['linkImage'] as String?,
      postType: $enumDecode(_$PostTypeEnumMap, json['postType']),
      visibility: $enumDecode(_$PostVisibilityEnumMap, json['visibility']),
      likedByIds:
          (json['likedByIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      commentCount: (json['commentCount'] as num?)?.toInt() ?? 0,
      shareCount: (json['shareCount'] as num?)?.toInt() ?? 0,
      hashtags:
          (json['hashtags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      mentionedUserIds:
          (json['mentionedUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      locationName: json['locationName'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      eventId: json['eventId'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isEdited: json['isEdited'] as bool? ?? false,
      isPinned: json['isPinned'] as bool? ?? false,
      isPromoted: json['isPromoted'] as bool? ?? false,
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'authorAvatar': instance.authorAvatar,
      'content': instance.content,
      'imageUrls': instance.imageUrls,
      'videoUrl': instance.videoUrl,
      'linkUrl': instance.linkUrl,
      'linkTitle': instance.linkTitle,
      'linkDescription': instance.linkDescription,
      'linkImage': instance.linkImage,
      'postType': _$PostTypeEnumMap[instance.postType]!,
      'visibility': _$PostVisibilityEnumMap[instance.visibility]!,
      'likedByIds': instance.likedByIds,
      'commentCount': instance.commentCount,
      'shareCount': instance.shareCount,
      'hashtags': instance.hashtags,
      'mentionedUserIds': instance.mentionedUserIds,
      'locationName': instance.locationName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'eventId': instance.eventId,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isEdited': instance.isEdited,
      'isPinned': instance.isPinned,
      'isPromoted': instance.isPromoted,
    };

const _$PostTypeEnumMap = {
  PostType.text: 'text',
  PostType.image: 'image',
  PostType.video: 'video',
  PostType.link: 'link',
  PostType.poll: 'poll',
  PostType.event: 'event',
  PostType.location: 'location',
};

const _$PostVisibilityEnumMap = {
  PostVisibility.public: 'public',
  PostVisibility.friends: 'friends',
  PostVisibility.private: 'private',
  PostVisibility.unlisted: 'unlisted',
};

_$PostCommentImpl _$$PostCommentImplFromJson(Map<String, dynamic> json) =>
    _$PostCommentImpl(
      id: json['id'] as String,
      postId: json['postId'] as String,
      authorId: json['authorId'] as String,
      authorName: json['authorName'] as String,
      authorAvatar: json['authorAvatar'] as String?,
      content: json['content'] as String,
      parentCommentId: json['parentCommentId'] as String?,
      likedByIds:
          (json['likedByIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      replyCount: (json['replyCount'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isEdited: json['isEdited'] as bool? ?? false,
    );

Map<String, dynamic> _$$PostCommentImplToJson(_$PostCommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'authorAvatar': instance.authorAvatar,
      'content': instance.content,
      'parentCommentId': instance.parentCommentId,
      'likedByIds': instance.likedByIds,
      'replyCount': instance.replyCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isEdited': instance.isEdited,
    };

_$CreatePostRequestImpl _$$CreatePostRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreatePostRequestImpl(
  content: json['content'] as String,
  imageUrls: (json['imageUrls'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  videoUrl: json['videoUrl'] as String?,
  linkUrl: json['linkUrl'] as String?,
  postType:
      $enumDecodeNullable(_$PostTypeEnumMap, json['postType']) ?? PostType.text,
  visibility:
      $enumDecodeNullable(_$PostVisibilityEnumMap, json['visibility']) ??
      PostVisibility.public,
  hashtags: (json['hashtags'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  mentionedUserIds: (json['mentionedUserIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  locationName: json['locationName'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  eventId: json['eventId'] as String?,
);

Map<String, dynamic> _$$CreatePostRequestImplToJson(
  _$CreatePostRequestImpl instance,
) => <String, dynamic>{
  'content': instance.content,
  'imageUrls': instance.imageUrls,
  'videoUrl': instance.videoUrl,
  'linkUrl': instance.linkUrl,
  'postType': _$PostTypeEnumMap[instance.postType]!,
  'visibility': _$PostVisibilityEnumMap[instance.visibility]!,
  'hashtags': instance.hashtags,
  'mentionedUserIds': instance.mentionedUserIds,
  'locationName': instance.locationName,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'eventId': instance.eventId,
};

_$PostReactionImpl _$$PostReactionImplFromJson(Map<String, dynamic> json) =>
    _$PostReactionImpl(
      id: json['id'] as String,
      postId: json['postId'] as String,
      userId: json['userId'] as String,
      username: json['username'] as String,
      userAvatar: json['userAvatar'] as String?,
      reactionType: $enumDecode(_$ReactionTypeEnumMap, json['reactionType']),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PostReactionImplToJson(_$PostReactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'userId': instance.userId,
      'username': instance.username,
      'userAvatar': instance.userAvatar,
      'reactionType': _$ReactionTypeEnumMap[instance.reactionType]!,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$ReactionTypeEnumMap = {
  ReactionType.like: 'like',
  ReactionType.love: 'love',
  ReactionType.laugh: 'laugh',
  ReactionType.wow: 'wow',
  ReactionType.sad: 'sad',
  ReactionType.angry: 'angry',
};
