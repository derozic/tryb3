// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MediaModel _$MediaModelFromJson(Map<String, dynamic> json) {
  return _MediaModel.fromJson(json);
}

/// @nodoc
mixin _$MediaModel {
  String get id => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  String get originalFilename => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  int get fileSize => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get altText => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this MediaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaModelCopyWith<MediaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaModelCopyWith<$Res> {
  factory $MediaModelCopyWith(
    MediaModel value,
    $Res Function(MediaModel) then,
  ) = _$MediaModelCopyWithImpl<$Res, MediaModel>;
  @useResult
  $Res call({
    String id,
    String filename,
    String originalFilename,
    String mimeType,
    int fileSize,
    String url,
    String? thumbnailUrl,
    int? width,
    int? height,
    String? description,
    String? altText,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$MediaModelCopyWithImpl<$Res, $Val extends MediaModel>
    implements $MediaModelCopyWith<$Res> {
  _$MediaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filename = null,
    Object? originalFilename = null,
    Object? mimeType = null,
    Object? fileSize = null,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? description = freezed,
    Object? altText = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            filename: null == filename
                ? _value.filename
                : filename // ignore: cast_nullable_to_non_nullable
                      as String,
            originalFilename: null == originalFilename
                ? _value.originalFilename
                : originalFilename // ignore: cast_nullable_to_non_nullable
                      as String,
            mimeType: null == mimeType
                ? _value.mimeType
                : mimeType // ignore: cast_nullable_to_non_nullable
                      as String,
            fileSize: null == fileSize
                ? _value.fileSize
                : fileSize // ignore: cast_nullable_to_non_nullable
                      as int,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            thumbnailUrl: freezed == thumbnailUrl
                ? _value.thumbnailUrl
                : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            width: freezed == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                      as int?,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as int?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            altText: freezed == altText
                ? _value.altText
                : altText // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MediaModelImplCopyWith<$Res>
    implements $MediaModelCopyWith<$Res> {
  factory _$$MediaModelImplCopyWith(
    _$MediaModelImpl value,
    $Res Function(_$MediaModelImpl) then,
  ) = __$$MediaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String filename,
    String originalFilename,
    String mimeType,
    int fileSize,
    String url,
    String? thumbnailUrl,
    int? width,
    int? height,
    String? description,
    String? altText,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$MediaModelImplCopyWithImpl<$Res>
    extends _$MediaModelCopyWithImpl<$Res, _$MediaModelImpl>
    implements _$$MediaModelImplCopyWith<$Res> {
  __$$MediaModelImplCopyWithImpl(
    _$MediaModelImpl _value,
    $Res Function(_$MediaModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filename = null,
    Object? originalFilename = null,
    Object? mimeType = null,
    Object? fileSize = null,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? description = freezed,
    Object? altText = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$MediaModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        filename: null == filename
            ? _value.filename
            : filename // ignore: cast_nullable_to_non_nullable
                  as String,
        originalFilename: null == originalFilename
            ? _value.originalFilename
            : originalFilename // ignore: cast_nullable_to_non_nullable
                  as String,
        mimeType: null == mimeType
            ? _value.mimeType
            : mimeType // ignore: cast_nullable_to_non_nullable
                  as String,
        fileSize: null == fileSize
            ? _value.fileSize
            : fileSize // ignore: cast_nullable_to_non_nullable
                  as int,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnailUrl: freezed == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        width: freezed == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as int?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as int?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        altText: freezed == altText
            ? _value.altText
            : altText // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaModelImpl implements _MediaModel {
  const _$MediaModelImpl({
    required this.id,
    required this.filename,
    required this.originalFilename,
    required this.mimeType,
    required this.fileSize,
    required this.url,
    this.thumbnailUrl,
    this.width,
    this.height,
    this.description,
    this.altText,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$MediaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaModelImplFromJson(json);

  @override
  final String id;
  @override
  final String filename;
  @override
  final String originalFilename;
  @override
  final String mimeType;
  @override
  final int fileSize;
  @override
  final String url;
  @override
  final String? thumbnailUrl;
  @override
  final int? width;
  @override
  final int? height;
  @override
  final String? description;
  @override
  final String? altText;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'MediaModel(id: $id, filename: $filename, originalFilename: $originalFilename, mimeType: $mimeType, fileSize: $fileSize, url: $url, thumbnailUrl: $thumbnailUrl, width: $width, height: $height, description: $description, altText: $altText, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.originalFilename, originalFilename) ||
                other.originalFilename == originalFilename) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.altText, altText) || other.altText == altText) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    filename,
    originalFilename,
    mimeType,
    fileSize,
    url,
    thumbnailUrl,
    width,
    height,
    description,
    altText,
    createdAt,
    updatedAt,
  );

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaModelImplCopyWith<_$MediaModelImpl> get copyWith =>
      __$$MediaModelImplCopyWithImpl<_$MediaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaModelImplToJson(this);
  }
}

abstract class _MediaModel implements MediaModel {
  const factory _MediaModel({
    required final String id,
    required final String filename,
    required final String originalFilename,
    required final String mimeType,
    required final int fileSize,
    required final String url,
    final String? thumbnailUrl,
    final int? width,
    final int? height,
    final String? description,
    final String? altText,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$MediaModelImpl;

  factory _MediaModel.fromJson(Map<String, dynamic> json) =
      _$MediaModelImpl.fromJson;

  @override
  String get id;
  @override
  String get filename;
  @override
  String get originalFilename;
  @override
  String get mimeType;
  @override
  int get fileSize;
  @override
  String get url;
  @override
  String? get thumbnailUrl;
  @override
  int? get width;
  @override
  int? get height;
  @override
  String? get description;
  @override
  String? get altText;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of MediaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaModelImplCopyWith<_$MediaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MediaUploadRequest _$MediaUploadRequestFromJson(Map<String, dynamic> json) {
  return _MediaUploadRequest.fromJson(json);
}

/// @nodoc
mixin _$MediaUploadRequest {
  String get filename => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  List<int> get bytes => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get altText => throw _privateConstructorUsedError;

  /// Serializes this MediaUploadRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaUploadRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaUploadRequestCopyWith<MediaUploadRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaUploadRequestCopyWith<$Res> {
  factory $MediaUploadRequestCopyWith(
    MediaUploadRequest value,
    $Res Function(MediaUploadRequest) then,
  ) = _$MediaUploadRequestCopyWithImpl<$Res, MediaUploadRequest>;
  @useResult
  $Res call({
    String filename,
    String mimeType,
    List<int> bytes,
    String? description,
    String? altText,
  });
}

/// @nodoc
class _$MediaUploadRequestCopyWithImpl<$Res, $Val extends MediaUploadRequest>
    implements $MediaUploadRequestCopyWith<$Res> {
  _$MediaUploadRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaUploadRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filename = null,
    Object? mimeType = null,
    Object? bytes = null,
    Object? description = freezed,
    Object? altText = freezed,
  }) {
    return _then(
      _value.copyWith(
            filename: null == filename
                ? _value.filename
                : filename // ignore: cast_nullable_to_non_nullable
                      as String,
            mimeType: null == mimeType
                ? _value.mimeType
                : mimeType // ignore: cast_nullable_to_non_nullable
                      as String,
            bytes: null == bytes
                ? _value.bytes
                : bytes // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            altText: freezed == altText
                ? _value.altText
                : altText // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MediaUploadRequestImplCopyWith<$Res>
    implements $MediaUploadRequestCopyWith<$Res> {
  factory _$$MediaUploadRequestImplCopyWith(
    _$MediaUploadRequestImpl value,
    $Res Function(_$MediaUploadRequestImpl) then,
  ) = __$$MediaUploadRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String filename,
    String mimeType,
    List<int> bytes,
    String? description,
    String? altText,
  });
}

/// @nodoc
class __$$MediaUploadRequestImplCopyWithImpl<$Res>
    extends _$MediaUploadRequestCopyWithImpl<$Res, _$MediaUploadRequestImpl>
    implements _$$MediaUploadRequestImplCopyWith<$Res> {
  __$$MediaUploadRequestImplCopyWithImpl(
    _$MediaUploadRequestImpl _value,
    $Res Function(_$MediaUploadRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MediaUploadRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filename = null,
    Object? mimeType = null,
    Object? bytes = null,
    Object? description = freezed,
    Object? altText = freezed,
  }) {
    return _then(
      _$MediaUploadRequestImpl(
        filename: null == filename
            ? _value.filename
            : filename // ignore: cast_nullable_to_non_nullable
                  as String,
        mimeType: null == mimeType
            ? _value.mimeType
            : mimeType // ignore: cast_nullable_to_non_nullable
                  as String,
        bytes: null == bytes
            ? _value._bytes
            : bytes // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        altText: freezed == altText
            ? _value.altText
            : altText // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaUploadRequestImpl implements _MediaUploadRequest {
  const _$MediaUploadRequestImpl({
    required this.filename,
    required this.mimeType,
    required final List<int> bytes,
    this.description,
    this.altText,
  }) : _bytes = bytes;

  factory _$MediaUploadRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaUploadRequestImplFromJson(json);

  @override
  final String filename;
  @override
  final String mimeType;
  final List<int> _bytes;
  @override
  List<int> get bytes {
    if (_bytes is EqualUnmodifiableListView) return _bytes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bytes);
  }

  @override
  final String? description;
  @override
  final String? altText;

  @override
  String toString() {
    return 'MediaUploadRequest(filename: $filename, mimeType: $mimeType, bytes: $bytes, description: $description, altText: $altText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaUploadRequestImpl &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            const DeepCollectionEquality().equals(other._bytes, _bytes) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.altText, altText) || other.altText == altText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    filename,
    mimeType,
    const DeepCollectionEquality().hash(_bytes),
    description,
    altText,
  );

  /// Create a copy of MediaUploadRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaUploadRequestImplCopyWith<_$MediaUploadRequestImpl> get copyWith =>
      __$$MediaUploadRequestImplCopyWithImpl<_$MediaUploadRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaUploadRequestImplToJson(this);
  }
}

abstract class _MediaUploadRequest implements MediaUploadRequest {
  const factory _MediaUploadRequest({
    required final String filename,
    required final String mimeType,
    required final List<int> bytes,
    final String? description,
    final String? altText,
  }) = _$MediaUploadRequestImpl;

  factory _MediaUploadRequest.fromJson(Map<String, dynamic> json) =
      _$MediaUploadRequestImpl.fromJson;

  @override
  String get filename;
  @override
  String get mimeType;
  @override
  List<int> get bytes;
  @override
  String? get description;
  @override
  String? get altText;

  /// Create a copy of MediaUploadRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaUploadRequestImplCopyWith<_$MediaUploadRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MediaUploadProgress {
  String get filename => throw _privateConstructorUsedError;
  int get bytesUploaded => throw _privateConstructorUsedError;
  int get totalBytes => throw _privateConstructorUsedError;
  MediaUploadStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of MediaUploadProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaUploadProgressCopyWith<MediaUploadProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaUploadProgressCopyWith<$Res> {
  factory $MediaUploadProgressCopyWith(
    MediaUploadProgress value,
    $Res Function(MediaUploadProgress) then,
  ) = _$MediaUploadProgressCopyWithImpl<$Res, MediaUploadProgress>;
  @useResult
  $Res call({
    String filename,
    int bytesUploaded,
    int totalBytes,
    MediaUploadStatus status,
    String? error,
  });
}

/// @nodoc
class _$MediaUploadProgressCopyWithImpl<$Res, $Val extends MediaUploadProgress>
    implements $MediaUploadProgressCopyWith<$Res> {
  _$MediaUploadProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaUploadProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filename = null,
    Object? bytesUploaded = null,
    Object? totalBytes = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            filename: null == filename
                ? _value.filename
                : filename // ignore: cast_nullable_to_non_nullable
                      as String,
            bytesUploaded: null == bytesUploaded
                ? _value.bytesUploaded
                : bytesUploaded // ignore: cast_nullable_to_non_nullable
                      as int,
            totalBytes: null == totalBytes
                ? _value.totalBytes
                : totalBytes // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as MediaUploadStatus,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MediaUploadProgressImplCopyWith<$Res>
    implements $MediaUploadProgressCopyWith<$Res> {
  factory _$$MediaUploadProgressImplCopyWith(
    _$MediaUploadProgressImpl value,
    $Res Function(_$MediaUploadProgressImpl) then,
  ) = __$$MediaUploadProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String filename,
    int bytesUploaded,
    int totalBytes,
    MediaUploadStatus status,
    String? error,
  });
}

/// @nodoc
class __$$MediaUploadProgressImplCopyWithImpl<$Res>
    extends _$MediaUploadProgressCopyWithImpl<$Res, _$MediaUploadProgressImpl>
    implements _$$MediaUploadProgressImplCopyWith<$Res> {
  __$$MediaUploadProgressImplCopyWithImpl(
    _$MediaUploadProgressImpl _value,
    $Res Function(_$MediaUploadProgressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MediaUploadProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filename = null,
    Object? bytesUploaded = null,
    Object? totalBytes = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(
      _$MediaUploadProgressImpl(
        filename: null == filename
            ? _value.filename
            : filename // ignore: cast_nullable_to_non_nullable
                  as String,
        bytesUploaded: null == bytesUploaded
            ? _value.bytesUploaded
            : bytesUploaded // ignore: cast_nullable_to_non_nullable
                  as int,
        totalBytes: null == totalBytes
            ? _value.totalBytes
            : totalBytes // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MediaUploadStatus,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$MediaUploadProgressImpl extends _MediaUploadProgress {
  const _$MediaUploadProgressImpl({
    required this.filename,
    required this.bytesUploaded,
    required this.totalBytes,
    required this.status,
    this.error,
  }) : super._();

  @override
  final String filename;
  @override
  final int bytesUploaded;
  @override
  final int totalBytes;
  @override
  final MediaUploadStatus status;
  @override
  final String? error;

  @override
  String toString() {
    return 'MediaUploadProgress(filename: $filename, bytesUploaded: $bytesUploaded, totalBytes: $totalBytes, status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaUploadProgressImpl &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.bytesUploaded, bytesUploaded) ||
                other.bytesUploaded == bytesUploaded) &&
            (identical(other.totalBytes, totalBytes) ||
                other.totalBytes == totalBytes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    filename,
    bytesUploaded,
    totalBytes,
    status,
    error,
  );

  /// Create a copy of MediaUploadProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaUploadProgressImplCopyWith<_$MediaUploadProgressImpl> get copyWith =>
      __$$MediaUploadProgressImplCopyWithImpl<_$MediaUploadProgressImpl>(
        this,
        _$identity,
      );
}

abstract class _MediaUploadProgress extends MediaUploadProgress {
  const factory _MediaUploadProgress({
    required final String filename,
    required final int bytesUploaded,
    required final int totalBytes,
    required final MediaUploadStatus status,
    final String? error,
  }) = _$MediaUploadProgressImpl;
  const _MediaUploadProgress._() : super._();

  @override
  String get filename;
  @override
  int get bytesUploaded;
  @override
  int get totalBytes;
  @override
  MediaUploadStatus get status;
  @override
  String? get error;

  /// Create a copy of MediaUploadProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaUploadProgressImplCopyWith<_$MediaUploadProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
