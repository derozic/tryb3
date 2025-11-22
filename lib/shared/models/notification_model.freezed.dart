// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get postId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get actionData => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
    NotificationModel value,
    $Res Function(NotificationModel) then,
  ) = _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call({
    String id,
    String title,
    String message,
    NotificationType type,
    bool isRead,
    String? userId,
    String? postId,
    Map<String, dynamic>? actionData,
    DateTime createdAt,
  });
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? isRead = null,
    Object? userId = freezed,
    Object? postId = freezed,
    Object? actionData = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as NotificationType,
            isRead: null == isRead
                ? _value.isRead
                : isRead // ignore: cast_nullable_to_non_nullable
                      as bool,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            postId: freezed == postId
                ? _value.postId
                : postId // ignore: cast_nullable_to_non_nullable
                      as String?,
            actionData: freezed == actionData
                ? _value.actionData
                : actionData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
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
abstract class _$$NotificationModelImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$NotificationModelImplCopyWith(
    _$NotificationModelImpl value,
    $Res Function(_$NotificationModelImpl) then,
  ) = __$$NotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String message,
    NotificationType type,
    bool isRead,
    String? userId,
    String? postId,
    Map<String, dynamic>? actionData,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$NotificationModelImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$NotificationModelImpl>
    implements _$$NotificationModelImplCopyWith<$Res> {
  __$$NotificationModelImplCopyWithImpl(
    _$NotificationModelImpl _value,
    $Res Function(_$NotificationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? isRead = null,
    Object? userId = freezed,
    Object? postId = freezed,
    Object? actionData = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$NotificationModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as NotificationType,
        isRead: null == isRead
            ? _value.isRead
            : isRead // ignore: cast_nullable_to_non_nullable
                  as bool,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        postId: freezed == postId
            ? _value.postId
            : postId // ignore: cast_nullable_to_non_nullable
                  as String?,
        actionData: freezed == actionData
            ? _value._actionData
            : actionData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
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
class _$NotificationModelImpl extends _NotificationModel {
  const _$NotificationModelImpl({
    required this.id,
    required this.title,
    required this.message,
    this.type = NotificationType.general,
    this.isRead = false,
    this.userId,
    this.postId,
    final Map<String, dynamic>? actionData,
    required this.createdAt,
  }) : _actionData = actionData,
       super._();

  factory _$NotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String message;
  @override
  @JsonKey()
  final NotificationType type;
  @override
  @JsonKey()
  final bool isRead;
  @override
  final String? userId;
  @override
  final String? postId;
  final Map<String, dynamic>? _actionData;
  @override
  Map<String, dynamic>? get actionData {
    final value = _actionData;
    if (value == null) return null;
    if (_actionData is EqualUnmodifiableMapView) return _actionData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, message: $message, type: $type, isRead: $isRead, userId: $userId, postId: $postId, actionData: $actionData, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            const DeepCollectionEquality().equals(
              other._actionData,
              _actionData,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    message,
    type,
    isRead,
    userId,
    postId,
    const DeepCollectionEquality().hash(_actionData),
    createdAt,
  );

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      __$$NotificationModelImplCopyWithImpl<_$NotificationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationModelImplToJson(this);
  }
}

abstract class _NotificationModel extends NotificationModel {
  const factory _NotificationModel({
    required final String id,
    required final String title,
    required final String message,
    final NotificationType type,
    final bool isRead,
    final String? userId,
    final String? postId,
    final Map<String, dynamic>? actionData,
    required final DateTime createdAt,
  }) = _$NotificationModelImpl;
  const _NotificationModel._() : super._();

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$NotificationModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get message;
  @override
  NotificationType get type;
  @override
  bool get isRead;
  @override
  String? get userId;
  @override
  String? get postId;
  @override
  Map<String, dynamic>? get actionData;
  @override
  DateTime get createdAt;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
