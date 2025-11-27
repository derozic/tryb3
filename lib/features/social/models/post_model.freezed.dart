// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return _PostModel.fromJson(json);
}

/// @nodoc
mixin _$PostModel {
  String get id => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  String? get authorAvatar => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<String>? get imageUrls => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  String? get linkUrl => throw _privateConstructorUsedError;
  String? get linkTitle => throw _privateConstructorUsedError;
  String? get linkDescription => throw _privateConstructorUsedError;
  String? get linkImage => throw _privateConstructorUsedError;
  PostType get postType => throw _privateConstructorUsedError;
  PostVisibility get visibility => throw _privateConstructorUsedError;
  List<String> get likedByIds => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  int get shareCount => throw _privateConstructorUsedError;
  List<String> get hashtags => throw _privateConstructorUsedError;
  List<String> get mentionedUserIds => throw _privateConstructorUsedError;
  String? get locationName => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get eventId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool get isEdited => throw _privateConstructorUsedError;
  bool get isPinned => throw _privateConstructorUsedError;
  bool get isPromoted => throw _privateConstructorUsedError;

  /// Serializes this PostModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostModelCopyWith<PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) then) =
      _$PostModelCopyWithImpl<$Res, PostModel>;
  @useResult
  $Res call({
    String id,
    String authorId,
    String authorName,
    String? authorAvatar,
    String content,
    List<String>? imageUrls,
    String? videoUrl,
    String? linkUrl,
    String? linkTitle,
    String? linkDescription,
    String? linkImage,
    PostType postType,
    PostVisibility visibility,
    List<String> likedByIds,
    int commentCount,
    int shareCount,
    List<String> hashtags,
    List<String> mentionedUserIds,
    String? locationName,
    double? latitude,
    double? longitude,
    String? eventId,
    Map<String, dynamic>? metadata,
    DateTime createdAt,
    DateTime? updatedAt,
    bool isEdited,
    bool isPinned,
    bool isPromoted,
  });
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res, $Val extends PostModel>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? authorAvatar = freezed,
    Object? content = null,
    Object? imageUrls = freezed,
    Object? videoUrl = freezed,
    Object? linkUrl = freezed,
    Object? linkTitle = freezed,
    Object? linkDescription = freezed,
    Object? linkImage = freezed,
    Object? postType = null,
    Object? visibility = null,
    Object? likedByIds = null,
    Object? commentCount = null,
    Object? shareCount = null,
    Object? hashtags = null,
    Object? mentionedUserIds = null,
    Object? locationName = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? eventId = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? isEdited = null,
    Object? isPinned = null,
    Object? isPromoted = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            authorId: null == authorId
                ? _value.authorId
                : authorId // ignore: cast_nullable_to_non_nullable
                      as String,
            authorName: null == authorName
                ? _value.authorName
                : authorName // ignore: cast_nullable_to_non_nullable
                      as String,
            authorAvatar: freezed == authorAvatar
                ? _value.authorAvatar
                : authorAvatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrls: freezed == imageUrls
                ? _value.imageUrls
                : imageUrls // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            videoUrl: freezed == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            linkUrl: freezed == linkUrl
                ? _value.linkUrl
                : linkUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            linkTitle: freezed == linkTitle
                ? _value.linkTitle
                : linkTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            linkDescription: freezed == linkDescription
                ? _value.linkDescription
                : linkDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
            linkImage: freezed == linkImage
                ? _value.linkImage
                : linkImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            postType: null == postType
                ? _value.postType
                : postType // ignore: cast_nullable_to_non_nullable
                      as PostType,
            visibility: null == visibility
                ? _value.visibility
                : visibility // ignore: cast_nullable_to_non_nullable
                      as PostVisibility,
            likedByIds: null == likedByIds
                ? _value.likedByIds
                : likedByIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            commentCount: null == commentCount
                ? _value.commentCount
                : commentCount // ignore: cast_nullable_to_non_nullable
                      as int,
            shareCount: null == shareCount
                ? _value.shareCount
                : shareCount // ignore: cast_nullable_to_non_nullable
                      as int,
            hashtags: null == hashtags
                ? _value.hashtags
                : hashtags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            mentionedUserIds: null == mentionedUserIds
                ? _value.mentionedUserIds
                : mentionedUserIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            locationName: freezed == locationName
                ? _value.locationName
                : locationName // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            eventId: freezed == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isEdited: null == isEdited
                ? _value.isEdited
                : isEdited // ignore: cast_nullable_to_non_nullable
                      as bool,
            isPinned: null == isPinned
                ? _value.isPinned
                : isPinned // ignore: cast_nullable_to_non_nullable
                      as bool,
            isPromoted: null == isPromoted
                ? _value.isPromoted
                : isPromoted // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PostModelImplCopyWith<$Res>
    implements $PostModelCopyWith<$Res> {
  factory _$$PostModelImplCopyWith(
    _$PostModelImpl value,
    $Res Function(_$PostModelImpl) then,
  ) = __$$PostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String authorId,
    String authorName,
    String? authorAvatar,
    String content,
    List<String>? imageUrls,
    String? videoUrl,
    String? linkUrl,
    String? linkTitle,
    String? linkDescription,
    String? linkImage,
    PostType postType,
    PostVisibility visibility,
    List<String> likedByIds,
    int commentCount,
    int shareCount,
    List<String> hashtags,
    List<String> mentionedUserIds,
    String? locationName,
    double? latitude,
    double? longitude,
    String? eventId,
    Map<String, dynamic>? metadata,
    DateTime createdAt,
    DateTime? updatedAt,
    bool isEdited,
    bool isPinned,
    bool isPromoted,
  });
}

/// @nodoc
class __$$PostModelImplCopyWithImpl<$Res>
    extends _$PostModelCopyWithImpl<$Res, _$PostModelImpl>
    implements _$$PostModelImplCopyWith<$Res> {
  __$$PostModelImplCopyWithImpl(
    _$PostModelImpl _value,
    $Res Function(_$PostModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? authorAvatar = freezed,
    Object? content = null,
    Object? imageUrls = freezed,
    Object? videoUrl = freezed,
    Object? linkUrl = freezed,
    Object? linkTitle = freezed,
    Object? linkDescription = freezed,
    Object? linkImage = freezed,
    Object? postType = null,
    Object? visibility = null,
    Object? likedByIds = null,
    Object? commentCount = null,
    Object? shareCount = null,
    Object? hashtags = null,
    Object? mentionedUserIds = null,
    Object? locationName = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? eventId = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? isEdited = null,
    Object? isPinned = null,
    Object? isPromoted = null,
  }) {
    return _then(
      _$PostModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        authorId: null == authorId
            ? _value.authorId
            : authorId // ignore: cast_nullable_to_non_nullable
                  as String,
        authorName: null == authorName
            ? _value.authorName
            : authorName // ignore: cast_nullable_to_non_nullable
                  as String,
        authorAvatar: freezed == authorAvatar
            ? _value.authorAvatar
            : authorAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrls: freezed == imageUrls
            ? _value._imageUrls
            : imageUrls // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        videoUrl: freezed == videoUrl
            ? _value.videoUrl
            : videoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        linkUrl: freezed == linkUrl
            ? _value.linkUrl
            : linkUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        linkTitle: freezed == linkTitle
            ? _value.linkTitle
            : linkTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        linkDescription: freezed == linkDescription
            ? _value.linkDescription
            : linkDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
        linkImage: freezed == linkImage
            ? _value.linkImage
            : linkImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        postType: null == postType
            ? _value.postType
            : postType // ignore: cast_nullable_to_non_nullable
                  as PostType,
        visibility: null == visibility
            ? _value.visibility
            : visibility // ignore: cast_nullable_to_non_nullable
                  as PostVisibility,
        likedByIds: null == likedByIds
            ? _value._likedByIds
            : likedByIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        commentCount: null == commentCount
            ? _value.commentCount
            : commentCount // ignore: cast_nullable_to_non_nullable
                  as int,
        shareCount: null == shareCount
            ? _value.shareCount
            : shareCount // ignore: cast_nullable_to_non_nullable
                  as int,
        hashtags: null == hashtags
            ? _value._hashtags
            : hashtags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        mentionedUserIds: null == mentionedUserIds
            ? _value._mentionedUserIds
            : mentionedUserIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        locationName: freezed == locationName
            ? _value.locationName
            : locationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        eventId: freezed == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isEdited: null == isEdited
            ? _value.isEdited
            : isEdited // ignore: cast_nullable_to_non_nullable
                  as bool,
        isPinned: null == isPinned
            ? _value.isPinned
            : isPinned // ignore: cast_nullable_to_non_nullable
                  as bool,
        isPromoted: null == isPromoted
            ? _value.isPromoted
            : isPromoted // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PostModelImpl implements _PostModel {
  const _$PostModelImpl({
    required this.id,
    required this.authorId,
    required this.authorName,
    this.authorAvatar,
    required this.content,
    final List<String>? imageUrls,
    this.videoUrl,
    this.linkUrl,
    this.linkTitle,
    this.linkDescription,
    this.linkImage,
    required this.postType,
    required this.visibility,
    final List<String> likedByIds = const [],
    this.commentCount = 0,
    this.shareCount = 0,
    final List<String> hashtags = const [],
    final List<String> mentionedUserIds = const [],
    this.locationName,
    this.latitude,
    this.longitude,
    this.eventId,
    final Map<String, dynamic>? metadata,
    required this.createdAt,
    this.updatedAt,
    this.isEdited = false,
    this.isPinned = false,
    this.isPromoted = false,
  }) : _imageUrls = imageUrls,
       _likedByIds = likedByIds,
       _hashtags = hashtags,
       _mentionedUserIds = mentionedUserIds,
       _metadata = metadata;

  factory _$PostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostModelImplFromJson(json);

  @override
  final String id;
  @override
  final String authorId;
  @override
  final String authorName;
  @override
  final String? authorAvatar;
  @override
  final String content;
  final List<String>? _imageUrls;
  @override
  List<String>? get imageUrls {
    final value = _imageUrls;
    if (value == null) return null;
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? videoUrl;
  @override
  final String? linkUrl;
  @override
  final String? linkTitle;
  @override
  final String? linkDescription;
  @override
  final String? linkImage;
  @override
  final PostType postType;
  @override
  final PostVisibility visibility;
  final List<String> _likedByIds;
  @override
  @JsonKey()
  List<String> get likedByIds {
    if (_likedByIds is EqualUnmodifiableListView) return _likedByIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likedByIds);
  }

  @override
  @JsonKey()
  final int commentCount;
  @override
  @JsonKey()
  final int shareCount;
  final List<String> _hashtags;
  @override
  @JsonKey()
  List<String> get hashtags {
    if (_hashtags is EqualUnmodifiableListView) return _hashtags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashtags);
  }

  final List<String> _mentionedUserIds;
  @override
  @JsonKey()
  List<String> get mentionedUserIds {
    if (_mentionedUserIds is EqualUnmodifiableListView)
      return _mentionedUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mentionedUserIds);
  }

  @override
  final String? locationName;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? eventId;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final bool isEdited;
  @override
  @JsonKey()
  final bool isPinned;
  @override
  @JsonKey()
  final bool isPromoted;

  @override
  String toString() {
    return 'PostModel(id: $id, authorId: $authorId, authorName: $authorName, authorAvatar: $authorAvatar, content: $content, imageUrls: $imageUrls, videoUrl: $videoUrl, linkUrl: $linkUrl, linkTitle: $linkTitle, linkDescription: $linkDescription, linkImage: $linkImage, postType: $postType, visibility: $visibility, likedByIds: $likedByIds, commentCount: $commentCount, shareCount: $shareCount, hashtags: $hashtags, mentionedUserIds: $mentionedUserIds, locationName: $locationName, latitude: $latitude, longitude: $longitude, eventId: $eventId, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt, isEdited: $isEdited, isPinned: $isPinned, isPromoted: $isPromoted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.authorAvatar, authorAvatar) ||
                other.authorAvatar == authorAvatar) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(
              other._imageUrls,
              _imageUrls,
            ) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl) &&
            (identical(other.linkTitle, linkTitle) ||
                other.linkTitle == linkTitle) &&
            (identical(other.linkDescription, linkDescription) ||
                other.linkDescription == linkDescription) &&
            (identical(other.linkImage, linkImage) ||
                other.linkImage == linkImage) &&
            (identical(other.postType, postType) ||
                other.postType == postType) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            const DeepCollectionEquality().equals(
              other._likedByIds,
              _likedByIds,
            ) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.shareCount, shareCount) ||
                other.shareCount == shareCount) &&
            const DeepCollectionEquality().equals(other._hashtags, _hashtags) &&
            const DeepCollectionEquality().equals(
              other._mentionedUserIds,
              _mentionedUserIds,
            ) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isEdited, isEdited) ||
                other.isEdited == isEdited) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.isPromoted, isPromoted) ||
                other.isPromoted == isPromoted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    authorId,
    authorName,
    authorAvatar,
    content,
    const DeepCollectionEquality().hash(_imageUrls),
    videoUrl,
    linkUrl,
    linkTitle,
    linkDescription,
    linkImage,
    postType,
    visibility,
    const DeepCollectionEquality().hash(_likedByIds),
    commentCount,
    shareCount,
    const DeepCollectionEquality().hash(_hashtags),
    const DeepCollectionEquality().hash(_mentionedUserIds),
    locationName,
    latitude,
    longitude,
    eventId,
    const DeepCollectionEquality().hash(_metadata),
    createdAt,
    updatedAt,
    isEdited,
    isPinned,
    isPromoted,
  ]);

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostModelImplCopyWith<_$PostModelImpl> get copyWith =>
      __$$PostModelImplCopyWithImpl<_$PostModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostModelImplToJson(this);
  }
}

abstract class _PostModel implements PostModel {
  const factory _PostModel({
    required final String id,
    required final String authorId,
    required final String authorName,
    final String? authorAvatar,
    required final String content,
    final List<String>? imageUrls,
    final String? videoUrl,
    final String? linkUrl,
    final String? linkTitle,
    final String? linkDescription,
    final String? linkImage,
    required final PostType postType,
    required final PostVisibility visibility,
    final List<String> likedByIds,
    final int commentCount,
    final int shareCount,
    final List<String> hashtags,
    final List<String> mentionedUserIds,
    final String? locationName,
    final double? latitude,
    final double? longitude,
    final String? eventId,
    final Map<String, dynamic>? metadata,
    required final DateTime createdAt,
    final DateTime? updatedAt,
    final bool isEdited,
    final bool isPinned,
    final bool isPromoted,
  }) = _$PostModelImpl;

  factory _PostModel.fromJson(Map<String, dynamic> json) =
      _$PostModelImpl.fromJson;

  @override
  String get id;
  @override
  String get authorId;
  @override
  String get authorName;
  @override
  String? get authorAvatar;
  @override
  String get content;
  @override
  List<String>? get imageUrls;
  @override
  String? get videoUrl;
  @override
  String? get linkUrl;
  @override
  String? get linkTitle;
  @override
  String? get linkDescription;
  @override
  String? get linkImage;
  @override
  PostType get postType;
  @override
  PostVisibility get visibility;
  @override
  List<String> get likedByIds;
  @override
  int get commentCount;
  @override
  int get shareCount;
  @override
  List<String> get hashtags;
  @override
  List<String> get mentionedUserIds;
  @override
  String? get locationName;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get eventId;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool get isEdited;
  @override
  bool get isPinned;
  @override
  bool get isPromoted;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostModelImplCopyWith<_$PostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostComment _$PostCommentFromJson(Map<String, dynamic> json) {
  return _PostComment.fromJson(json);
}

/// @nodoc
mixin _$PostComment {
  String get id => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  String? get authorAvatar => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get parentCommentId => throw _privateConstructorUsedError;
  List<String> get likedByIds => throw _privateConstructorUsedError;
  int get replyCount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool get isEdited => throw _privateConstructorUsedError;

  /// Serializes this PostComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostCommentCopyWith<PostComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCommentCopyWith<$Res> {
  factory $PostCommentCopyWith(
    PostComment value,
    $Res Function(PostComment) then,
  ) = _$PostCommentCopyWithImpl<$Res, PostComment>;
  @useResult
  $Res call({
    String id,
    String postId,
    String authorId,
    String authorName,
    String? authorAvatar,
    String content,
    String? parentCommentId,
    List<String> likedByIds,
    int replyCount,
    DateTime createdAt,
    DateTime? updatedAt,
    bool isEdited,
  });
}

/// @nodoc
class _$PostCommentCopyWithImpl<$Res, $Val extends PostComment>
    implements $PostCommentCopyWith<$Res> {
  _$PostCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? authorAvatar = freezed,
    Object? content = null,
    Object? parentCommentId = freezed,
    Object? likedByIds = null,
    Object? replyCount = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? isEdited = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            postId: null == postId
                ? _value.postId
                : postId // ignore: cast_nullable_to_non_nullable
                      as String,
            authorId: null == authorId
                ? _value.authorId
                : authorId // ignore: cast_nullable_to_non_nullable
                      as String,
            authorName: null == authorName
                ? _value.authorName
                : authorName // ignore: cast_nullable_to_non_nullable
                      as String,
            authorAvatar: freezed == authorAvatar
                ? _value.authorAvatar
                : authorAvatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            parentCommentId: freezed == parentCommentId
                ? _value.parentCommentId
                : parentCommentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            likedByIds: null == likedByIds
                ? _value.likedByIds
                : likedByIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            replyCount: null == replyCount
                ? _value.replyCount
                : replyCount // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isEdited: null == isEdited
                ? _value.isEdited
                : isEdited // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PostCommentImplCopyWith<$Res>
    implements $PostCommentCopyWith<$Res> {
  factory _$$PostCommentImplCopyWith(
    _$PostCommentImpl value,
    $Res Function(_$PostCommentImpl) then,
  ) = __$$PostCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String postId,
    String authorId,
    String authorName,
    String? authorAvatar,
    String content,
    String? parentCommentId,
    List<String> likedByIds,
    int replyCount,
    DateTime createdAt,
    DateTime? updatedAt,
    bool isEdited,
  });
}

/// @nodoc
class __$$PostCommentImplCopyWithImpl<$Res>
    extends _$PostCommentCopyWithImpl<$Res, _$PostCommentImpl>
    implements _$$PostCommentImplCopyWith<$Res> {
  __$$PostCommentImplCopyWithImpl(
    _$PostCommentImpl _value,
    $Res Function(_$PostCommentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? authorAvatar = freezed,
    Object? content = null,
    Object? parentCommentId = freezed,
    Object? likedByIds = null,
    Object? replyCount = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? isEdited = null,
  }) {
    return _then(
      _$PostCommentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        postId: null == postId
            ? _value.postId
            : postId // ignore: cast_nullable_to_non_nullable
                  as String,
        authorId: null == authorId
            ? _value.authorId
            : authorId // ignore: cast_nullable_to_non_nullable
                  as String,
        authorName: null == authorName
            ? _value.authorName
            : authorName // ignore: cast_nullable_to_non_nullable
                  as String,
        authorAvatar: freezed == authorAvatar
            ? _value.authorAvatar
            : authorAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        parentCommentId: freezed == parentCommentId
            ? _value.parentCommentId
            : parentCommentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        likedByIds: null == likedByIds
            ? _value._likedByIds
            : likedByIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        replyCount: null == replyCount
            ? _value.replyCount
            : replyCount // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isEdited: null == isEdited
            ? _value.isEdited
            : isEdited // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PostCommentImpl implements _PostComment {
  const _$PostCommentImpl({
    required this.id,
    required this.postId,
    required this.authorId,
    required this.authorName,
    this.authorAvatar,
    required this.content,
    this.parentCommentId,
    final List<String> likedByIds = const [],
    this.replyCount = 0,
    required this.createdAt,
    this.updatedAt,
    this.isEdited = false,
  }) : _likedByIds = likedByIds;

  factory _$PostCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostCommentImplFromJson(json);

  @override
  final String id;
  @override
  final String postId;
  @override
  final String authorId;
  @override
  final String authorName;
  @override
  final String? authorAvatar;
  @override
  final String content;
  @override
  final String? parentCommentId;
  final List<String> _likedByIds;
  @override
  @JsonKey()
  List<String> get likedByIds {
    if (_likedByIds is EqualUnmodifiableListView) return _likedByIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likedByIds);
  }

  @override
  @JsonKey()
  final int replyCount;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final bool isEdited;

  @override
  String toString() {
    return 'PostComment(id: $id, postId: $postId, authorId: $authorId, authorName: $authorName, authorAvatar: $authorAvatar, content: $content, parentCommentId: $parentCommentId, likedByIds: $likedByIds, replyCount: $replyCount, createdAt: $createdAt, updatedAt: $updatedAt, isEdited: $isEdited)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.authorAvatar, authorAvatar) ||
                other.authorAvatar == authorAvatar) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.parentCommentId, parentCommentId) ||
                other.parentCommentId == parentCommentId) &&
            const DeepCollectionEquality().equals(
              other._likedByIds,
              _likedByIds,
            ) &&
            (identical(other.replyCount, replyCount) ||
                other.replyCount == replyCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isEdited, isEdited) ||
                other.isEdited == isEdited));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    postId,
    authorId,
    authorName,
    authorAvatar,
    content,
    parentCommentId,
    const DeepCollectionEquality().hash(_likedByIds),
    replyCount,
    createdAt,
    updatedAt,
    isEdited,
  );

  /// Create a copy of PostComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostCommentImplCopyWith<_$PostCommentImpl> get copyWith =>
      __$$PostCommentImplCopyWithImpl<_$PostCommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostCommentImplToJson(this);
  }
}

abstract class _PostComment implements PostComment {
  const factory _PostComment({
    required final String id,
    required final String postId,
    required final String authorId,
    required final String authorName,
    final String? authorAvatar,
    required final String content,
    final String? parentCommentId,
    final List<String> likedByIds,
    final int replyCount,
    required final DateTime createdAt,
    final DateTime? updatedAt,
    final bool isEdited,
  }) = _$PostCommentImpl;

  factory _PostComment.fromJson(Map<String, dynamic> json) =
      _$PostCommentImpl.fromJson;

  @override
  String get id;
  @override
  String get postId;
  @override
  String get authorId;
  @override
  String get authorName;
  @override
  String? get authorAvatar;
  @override
  String get content;
  @override
  String? get parentCommentId;
  @override
  List<String> get likedByIds;
  @override
  int get replyCount;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool get isEdited;

  /// Create a copy of PostComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostCommentImplCopyWith<_$PostCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatePostRequest _$CreatePostRequestFromJson(Map<String, dynamic> json) {
  return _CreatePostRequest.fromJson(json);
}

/// @nodoc
mixin _$CreatePostRequest {
  String get content => throw _privateConstructorUsedError;
  List<String>? get imageUrls => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  String? get linkUrl => throw _privateConstructorUsedError;
  PostType get postType => throw _privateConstructorUsedError;
  PostVisibility get visibility => throw _privateConstructorUsedError;
  List<String>? get hashtags => throw _privateConstructorUsedError;
  List<String>? get mentionedUserIds => throw _privateConstructorUsedError;
  String? get locationName => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get eventId => throw _privateConstructorUsedError;

  /// Serializes this CreatePostRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePostRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePostRequestCopyWith<CreatePostRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePostRequestCopyWith<$Res> {
  factory $CreatePostRequestCopyWith(
    CreatePostRequest value,
    $Res Function(CreatePostRequest) then,
  ) = _$CreatePostRequestCopyWithImpl<$Res, CreatePostRequest>;
  @useResult
  $Res call({
    String content,
    List<String>? imageUrls,
    String? videoUrl,
    String? linkUrl,
    PostType postType,
    PostVisibility visibility,
    List<String>? hashtags,
    List<String>? mentionedUserIds,
    String? locationName,
    double? latitude,
    double? longitude,
    String? eventId,
  });
}

/// @nodoc
class _$CreatePostRequestCopyWithImpl<$Res, $Val extends CreatePostRequest>
    implements $CreatePostRequestCopyWith<$Res> {
  _$CreatePostRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePostRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? imageUrls = freezed,
    Object? videoUrl = freezed,
    Object? linkUrl = freezed,
    Object? postType = null,
    Object? visibility = null,
    Object? hashtags = freezed,
    Object? mentionedUserIds = freezed,
    Object? locationName = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? eventId = freezed,
  }) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrls: freezed == imageUrls
                ? _value.imageUrls
                : imageUrls // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            videoUrl: freezed == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            linkUrl: freezed == linkUrl
                ? _value.linkUrl
                : linkUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            postType: null == postType
                ? _value.postType
                : postType // ignore: cast_nullable_to_non_nullable
                      as PostType,
            visibility: null == visibility
                ? _value.visibility
                : visibility // ignore: cast_nullable_to_non_nullable
                      as PostVisibility,
            hashtags: freezed == hashtags
                ? _value.hashtags
                : hashtags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            mentionedUserIds: freezed == mentionedUserIds
                ? _value.mentionedUserIds
                : mentionedUserIds // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            locationName: freezed == locationName
                ? _value.locationName
                : locationName // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            eventId: freezed == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreatePostRequestImplCopyWith<$Res>
    implements $CreatePostRequestCopyWith<$Res> {
  factory _$$CreatePostRequestImplCopyWith(
    _$CreatePostRequestImpl value,
    $Res Function(_$CreatePostRequestImpl) then,
  ) = __$$CreatePostRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String content,
    List<String>? imageUrls,
    String? videoUrl,
    String? linkUrl,
    PostType postType,
    PostVisibility visibility,
    List<String>? hashtags,
    List<String>? mentionedUserIds,
    String? locationName,
    double? latitude,
    double? longitude,
    String? eventId,
  });
}

/// @nodoc
class __$$CreatePostRequestImplCopyWithImpl<$Res>
    extends _$CreatePostRequestCopyWithImpl<$Res, _$CreatePostRequestImpl>
    implements _$$CreatePostRequestImplCopyWith<$Res> {
  __$$CreatePostRequestImplCopyWithImpl(
    _$CreatePostRequestImpl _value,
    $Res Function(_$CreatePostRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreatePostRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? imageUrls = freezed,
    Object? videoUrl = freezed,
    Object? linkUrl = freezed,
    Object? postType = null,
    Object? visibility = null,
    Object? hashtags = freezed,
    Object? mentionedUserIds = freezed,
    Object? locationName = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? eventId = freezed,
  }) {
    return _then(
      _$CreatePostRequestImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrls: freezed == imageUrls
            ? _value._imageUrls
            : imageUrls // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        videoUrl: freezed == videoUrl
            ? _value.videoUrl
            : videoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        linkUrl: freezed == linkUrl
            ? _value.linkUrl
            : linkUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        postType: null == postType
            ? _value.postType
            : postType // ignore: cast_nullable_to_non_nullable
                  as PostType,
        visibility: null == visibility
            ? _value.visibility
            : visibility // ignore: cast_nullable_to_non_nullable
                  as PostVisibility,
        hashtags: freezed == hashtags
            ? _value._hashtags
            : hashtags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        mentionedUserIds: freezed == mentionedUserIds
            ? _value._mentionedUserIds
            : mentionedUserIds // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        locationName: freezed == locationName
            ? _value.locationName
            : locationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        eventId: freezed == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePostRequestImpl implements _CreatePostRequest {
  const _$CreatePostRequestImpl({
    required this.content,
    final List<String>? imageUrls,
    this.videoUrl,
    this.linkUrl,
    this.postType = PostType.text,
    this.visibility = PostVisibility.public,
    final List<String>? hashtags,
    final List<String>? mentionedUserIds,
    this.locationName,
    this.latitude,
    this.longitude,
    this.eventId,
  }) : _imageUrls = imageUrls,
       _hashtags = hashtags,
       _mentionedUserIds = mentionedUserIds;

  factory _$CreatePostRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePostRequestImplFromJson(json);

  @override
  final String content;
  final List<String>? _imageUrls;
  @override
  List<String>? get imageUrls {
    final value = _imageUrls;
    if (value == null) return null;
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? videoUrl;
  @override
  final String? linkUrl;
  @override
  @JsonKey()
  final PostType postType;
  @override
  @JsonKey()
  final PostVisibility visibility;
  final List<String>? _hashtags;
  @override
  List<String>? get hashtags {
    final value = _hashtags;
    if (value == null) return null;
    if (_hashtags is EqualUnmodifiableListView) return _hashtags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _mentionedUserIds;
  @override
  List<String>? get mentionedUserIds {
    final value = _mentionedUserIds;
    if (value == null) return null;
    if (_mentionedUserIds is EqualUnmodifiableListView)
      return _mentionedUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? locationName;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? eventId;

  @override
  String toString() {
    return 'CreatePostRequest(content: $content, imageUrls: $imageUrls, videoUrl: $videoUrl, linkUrl: $linkUrl, postType: $postType, visibility: $visibility, hashtags: $hashtags, mentionedUserIds: $mentionedUserIds, locationName: $locationName, latitude: $latitude, longitude: $longitude, eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePostRequestImpl &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(
              other._imageUrls,
              _imageUrls,
            ) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl) &&
            (identical(other.postType, postType) ||
                other.postType == postType) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            const DeepCollectionEquality().equals(other._hashtags, _hashtags) &&
            const DeepCollectionEquality().equals(
              other._mentionedUserIds,
              _mentionedUserIds,
            ) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    content,
    const DeepCollectionEquality().hash(_imageUrls),
    videoUrl,
    linkUrl,
    postType,
    visibility,
    const DeepCollectionEquality().hash(_hashtags),
    const DeepCollectionEquality().hash(_mentionedUserIds),
    locationName,
    latitude,
    longitude,
    eventId,
  );

  /// Create a copy of CreatePostRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePostRequestImplCopyWith<_$CreatePostRequestImpl> get copyWith =>
      __$$CreatePostRequestImplCopyWithImpl<_$CreatePostRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePostRequestImplToJson(this);
  }
}

abstract class _CreatePostRequest implements CreatePostRequest {
  const factory _CreatePostRequest({
    required final String content,
    final List<String>? imageUrls,
    final String? videoUrl,
    final String? linkUrl,
    final PostType postType,
    final PostVisibility visibility,
    final List<String>? hashtags,
    final List<String>? mentionedUserIds,
    final String? locationName,
    final double? latitude,
    final double? longitude,
    final String? eventId,
  }) = _$CreatePostRequestImpl;

  factory _CreatePostRequest.fromJson(Map<String, dynamic> json) =
      _$CreatePostRequestImpl.fromJson;

  @override
  String get content;
  @override
  List<String>? get imageUrls;
  @override
  String? get videoUrl;
  @override
  String? get linkUrl;
  @override
  PostType get postType;
  @override
  PostVisibility get visibility;
  @override
  List<String>? get hashtags;
  @override
  List<String>? get mentionedUserIds;
  @override
  String? get locationName;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get eventId;

  /// Create a copy of CreatePostRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePostRequestImplCopyWith<_$CreatePostRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostReaction _$PostReactionFromJson(Map<String, dynamic> json) {
  return _PostReaction.fromJson(json);
}

/// @nodoc
mixin _$PostReaction {
  String get id => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get userAvatar => throw _privateConstructorUsedError;
  ReactionType get reactionType => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PostReaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostReaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostReactionCopyWith<PostReaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostReactionCopyWith<$Res> {
  factory $PostReactionCopyWith(
    PostReaction value,
    $Res Function(PostReaction) then,
  ) = _$PostReactionCopyWithImpl<$Res, PostReaction>;
  @useResult
  $Res call({
    String id,
    String postId,
    String userId,
    String username,
    String? userAvatar,
    ReactionType reactionType,
    DateTime createdAt,
  });
}

/// @nodoc
class _$PostReactionCopyWithImpl<$Res, $Val extends PostReaction>
    implements $PostReactionCopyWith<$Res> {
  _$PostReactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostReaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? userId = null,
    Object? username = null,
    Object? userAvatar = freezed,
    Object? reactionType = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            postId: null == postId
                ? _value.postId
                : postId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            userAvatar: freezed == userAvatar
                ? _value.userAvatar
                : userAvatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            reactionType: null == reactionType
                ? _value.reactionType
                : reactionType // ignore: cast_nullable_to_non_nullable
                      as ReactionType,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PostReactionImplCopyWith<$Res>
    implements $PostReactionCopyWith<$Res> {
  factory _$$PostReactionImplCopyWith(
    _$PostReactionImpl value,
    $Res Function(_$PostReactionImpl) then,
  ) = __$$PostReactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String postId,
    String userId,
    String username,
    String? userAvatar,
    ReactionType reactionType,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$PostReactionImplCopyWithImpl<$Res>
    extends _$PostReactionCopyWithImpl<$Res, _$PostReactionImpl>
    implements _$$PostReactionImplCopyWith<$Res> {
  __$$PostReactionImplCopyWithImpl(
    _$PostReactionImpl _value,
    $Res Function(_$PostReactionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostReaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? userId = null,
    Object? username = null,
    Object? userAvatar = freezed,
    Object? reactionType = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$PostReactionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        postId: null == postId
            ? _value.postId
            : postId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        userAvatar: freezed == userAvatar
            ? _value.userAvatar
            : userAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        reactionType: null == reactionType
            ? _value.reactionType
            : reactionType // ignore: cast_nullable_to_non_nullable
                  as ReactionType,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PostReactionImpl implements _PostReaction {
  const _$PostReactionImpl({
    required this.id,
    required this.postId,
    required this.userId,
    required this.username,
    this.userAvatar,
    required this.reactionType,
    required this.createdAt,
  });

  factory _$PostReactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostReactionImplFromJson(json);

  @override
  final String id;
  @override
  final String postId;
  @override
  final String userId;
  @override
  final String username;
  @override
  final String? userAvatar;
  @override
  final ReactionType reactionType;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'PostReaction(id: $id, postId: $postId, userId: $userId, username: $username, userAvatar: $userAvatar, reactionType: $reactionType, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostReactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.userAvatar, userAvatar) ||
                other.userAvatar == userAvatar) &&
            (identical(other.reactionType, reactionType) ||
                other.reactionType == reactionType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    postId,
    userId,
    username,
    userAvatar,
    reactionType,
    createdAt,
  );

  /// Create a copy of PostReaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostReactionImplCopyWith<_$PostReactionImpl> get copyWith =>
      __$$PostReactionImplCopyWithImpl<_$PostReactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostReactionImplToJson(this);
  }
}

abstract class _PostReaction implements PostReaction {
  const factory _PostReaction({
    required final String id,
    required final String postId,
    required final String userId,
    required final String username,
    final String? userAvatar,
    required final ReactionType reactionType,
    required final DateTime createdAt,
  }) = _$PostReactionImpl;

  factory _PostReaction.fromJson(Map<String, dynamic> json) =
      _$PostReactionImpl.fromJson;

  @override
  String get id;
  @override
  String get postId;
  @override
  String get userId;
  @override
  String get username;
  @override
  String? get userAvatar;
  @override
  ReactionType get reactionType;
  @override
  DateTime get createdAt;

  /// Create a copy of PostReaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostReactionImplCopyWith<_$PostReactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
