// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FriendConnection _$FriendConnectionFromJson(Map<String, dynamic> json) {
  return _FriendConnection.fromJson(json);
}

/// @nodoc
mixin _$FriendConnection {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get friendId => throw _privateConstructorUsedError;
  User get friend => throw _privateConstructorUsedError;
  FriendshipStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get acceptedAt => throw _privateConstructorUsedError;
  String? get mutualConnectionCount => throw _privateConstructorUsedError;
  bool get isBlocked => throw _privateConstructorUsedError;
  bool get isMuted => throw _privateConstructorUsedError;
  bool get isCloseFriend => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this FriendConnection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FriendConnection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FriendConnectionCopyWith<FriendConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendConnectionCopyWith<$Res> {
  factory $FriendConnectionCopyWith(
    FriendConnection value,
    $Res Function(FriendConnection) then,
  ) = _$FriendConnectionCopyWithImpl<$Res, FriendConnection>;
  @useResult
  $Res call({
    String id,
    String userId,
    String friendId,
    User friend,
    FriendshipStatus status,
    DateTime createdAt,
    DateTime? acceptedAt,
    String? mutualConnectionCount,
    bool isBlocked,
    bool isMuted,
    bool isCloseFriend,
    Map<String, dynamic>? metadata,
  });

  $UserCopyWith<$Res> get friend;
}

/// @nodoc
class _$FriendConnectionCopyWithImpl<$Res, $Val extends FriendConnection>
    implements $FriendConnectionCopyWith<$Res> {
  _$FriendConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FriendConnection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? friendId = null,
    Object? friend = null,
    Object? status = null,
    Object? createdAt = null,
    Object? acceptedAt = freezed,
    Object? mutualConnectionCount = freezed,
    Object? isBlocked = null,
    Object? isMuted = null,
    Object? isCloseFriend = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            friendId: null == friendId
                ? _value.friendId
                : friendId // ignore: cast_nullable_to_non_nullable
                      as String,
            friend: null == friend
                ? _value.friend
                : friend // ignore: cast_nullable_to_non_nullable
                      as User,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as FriendshipStatus,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            acceptedAt: freezed == acceptedAt
                ? _value.acceptedAt
                : acceptedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            mutualConnectionCount: freezed == mutualConnectionCount
                ? _value.mutualConnectionCount
                : mutualConnectionCount // ignore: cast_nullable_to_non_nullable
                      as String?,
            isBlocked: null == isBlocked
                ? _value.isBlocked
                : isBlocked // ignore: cast_nullable_to_non_nullable
                      as bool,
            isMuted: null == isMuted
                ? _value.isMuted
                : isMuted // ignore: cast_nullable_to_non_nullable
                      as bool,
            isCloseFriend: null == isCloseFriend
                ? _value.isCloseFriend
                : isCloseFriend // ignore: cast_nullable_to_non_nullable
                      as bool,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }

  /// Create a copy of FriendConnection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get friend {
    return $UserCopyWith<$Res>(_value.friend, (value) {
      return _then(_value.copyWith(friend: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FriendConnectionImplCopyWith<$Res>
    implements $FriendConnectionCopyWith<$Res> {
  factory _$$FriendConnectionImplCopyWith(
    _$FriendConnectionImpl value,
    $Res Function(_$FriendConnectionImpl) then,
  ) = __$$FriendConnectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String friendId,
    User friend,
    FriendshipStatus status,
    DateTime createdAt,
    DateTime? acceptedAt,
    String? mutualConnectionCount,
    bool isBlocked,
    bool isMuted,
    bool isCloseFriend,
    Map<String, dynamic>? metadata,
  });

  @override
  $UserCopyWith<$Res> get friend;
}

/// @nodoc
class __$$FriendConnectionImplCopyWithImpl<$Res>
    extends _$FriendConnectionCopyWithImpl<$Res, _$FriendConnectionImpl>
    implements _$$FriendConnectionImplCopyWith<$Res> {
  __$$FriendConnectionImplCopyWithImpl(
    _$FriendConnectionImpl _value,
    $Res Function(_$FriendConnectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FriendConnection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? friendId = null,
    Object? friend = null,
    Object? status = null,
    Object? createdAt = null,
    Object? acceptedAt = freezed,
    Object? mutualConnectionCount = freezed,
    Object? isBlocked = null,
    Object? isMuted = null,
    Object? isCloseFriend = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _$FriendConnectionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        friendId: null == friendId
            ? _value.friendId
            : friendId // ignore: cast_nullable_to_non_nullable
                  as String,
        friend: null == friend
            ? _value.friend
            : friend // ignore: cast_nullable_to_non_nullable
                  as User,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as FriendshipStatus,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        acceptedAt: freezed == acceptedAt
            ? _value.acceptedAt
            : acceptedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        mutualConnectionCount: freezed == mutualConnectionCount
            ? _value.mutualConnectionCount
            : mutualConnectionCount // ignore: cast_nullable_to_non_nullable
                  as String?,
        isBlocked: null == isBlocked
            ? _value.isBlocked
            : isBlocked // ignore: cast_nullable_to_non_nullable
                  as bool,
        isMuted: null == isMuted
            ? _value.isMuted
            : isMuted // ignore: cast_nullable_to_non_nullable
                  as bool,
        isCloseFriend: null == isCloseFriend
            ? _value.isCloseFriend
            : isCloseFriend // ignore: cast_nullable_to_non_nullable
                  as bool,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendConnectionImpl implements _FriendConnection {
  const _$FriendConnectionImpl({
    required this.id,
    required this.userId,
    required this.friendId,
    required this.friend,
    required this.status,
    required this.createdAt,
    this.acceptedAt,
    this.mutualConnectionCount,
    this.isBlocked = false,
    this.isMuted = false,
    this.isCloseFriend = false,
    final Map<String, dynamic>? metadata,
  }) : _metadata = metadata;

  factory _$FriendConnectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendConnectionImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String friendId;
  @override
  final User friend;
  @override
  final FriendshipStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime? acceptedAt;
  @override
  final String? mutualConnectionCount;
  @override
  @JsonKey()
  final bool isBlocked;
  @override
  @JsonKey()
  final bool isMuted;
  @override
  @JsonKey()
  final bool isCloseFriend;
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
  String toString() {
    return 'FriendConnection(id: $id, userId: $userId, friendId: $friendId, friend: $friend, status: $status, createdAt: $createdAt, acceptedAt: $acceptedAt, mutualConnectionCount: $mutualConnectionCount, isBlocked: $isBlocked, isMuted: $isMuted, isCloseFriend: $isCloseFriend, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendConnectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.friendId, friendId) ||
                other.friendId == friendId) &&
            (identical(other.friend, friend) || other.friend == friend) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.acceptedAt, acceptedAt) ||
                other.acceptedAt == acceptedAt) &&
            (identical(other.mutualConnectionCount, mutualConnectionCount) ||
                other.mutualConnectionCount == mutualConnectionCount) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.isMuted, isMuted) || other.isMuted == isMuted) &&
            (identical(other.isCloseFriend, isCloseFriend) ||
                other.isCloseFriend == isCloseFriend) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    friendId,
    friend,
    status,
    createdAt,
    acceptedAt,
    mutualConnectionCount,
    isBlocked,
    isMuted,
    isCloseFriend,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of FriendConnection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendConnectionImplCopyWith<_$FriendConnectionImpl> get copyWith =>
      __$$FriendConnectionImplCopyWithImpl<_$FriendConnectionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendConnectionImplToJson(this);
  }
}

abstract class _FriendConnection implements FriendConnection {
  const factory _FriendConnection({
    required final String id,
    required final String userId,
    required final String friendId,
    required final User friend,
    required final FriendshipStatus status,
    required final DateTime createdAt,
    final DateTime? acceptedAt,
    final String? mutualConnectionCount,
    final bool isBlocked,
    final bool isMuted,
    final bool isCloseFriend,
    final Map<String, dynamic>? metadata,
  }) = _$FriendConnectionImpl;

  factory _FriendConnection.fromJson(Map<String, dynamic> json) =
      _$FriendConnectionImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get friendId;
  @override
  User get friend;
  @override
  FriendshipStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime? get acceptedAt;
  @override
  String? get mutualConnectionCount;
  @override
  bool get isBlocked;
  @override
  bool get isMuted;
  @override
  bool get isCloseFriend;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of FriendConnection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FriendConnectionImplCopyWith<_$FriendConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FriendRequest _$FriendRequestFromJson(Map<String, dynamic> json) {
  return _FriendRequest.fromJson(json);
}

/// @nodoc
mixin _$FriendRequest {
  String get id => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  User get sender => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;
  User get receiver => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  FriendRequestStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get respondedAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this FriendRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FriendRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FriendRequestCopyWith<FriendRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendRequestCopyWith<$Res> {
  factory $FriendRequestCopyWith(
    FriendRequest value,
    $Res Function(FriendRequest) then,
  ) = _$FriendRequestCopyWithImpl<$Res, FriendRequest>;
  @useResult
  $Res call({
    String id,
    String senderId,
    User sender,
    String receiverId,
    User receiver,
    String? message,
    FriendRequestStatus status,
    DateTime createdAt,
    DateTime? respondedAt,
    Map<String, dynamic>? metadata,
  });

  $UserCopyWith<$Res> get sender;
  $UserCopyWith<$Res> get receiver;
}

/// @nodoc
class _$FriendRequestCopyWithImpl<$Res, $Val extends FriendRequest>
    implements $FriendRequestCopyWith<$Res> {
  _$FriendRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FriendRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? sender = null,
    Object? receiverId = null,
    Object? receiver = null,
    Object? message = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? respondedAt = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            senderId: null == senderId
                ? _value.senderId
                : senderId // ignore: cast_nullable_to_non_nullable
                      as String,
            sender: null == sender
                ? _value.sender
                : sender // ignore: cast_nullable_to_non_nullable
                      as User,
            receiverId: null == receiverId
                ? _value.receiverId
                : receiverId // ignore: cast_nullable_to_non_nullable
                      as String,
            receiver: null == receiver
                ? _value.receiver
                : receiver // ignore: cast_nullable_to_non_nullable
                      as User,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as FriendRequestStatus,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            respondedAt: freezed == respondedAt
                ? _value.respondedAt
                : respondedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }

  /// Create a copy of FriendRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get sender {
    return $UserCopyWith<$Res>(_value.sender, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }

  /// Create a copy of FriendRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get receiver {
    return $UserCopyWith<$Res>(_value.receiver, (value) {
      return _then(_value.copyWith(receiver: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FriendRequestImplCopyWith<$Res>
    implements $FriendRequestCopyWith<$Res> {
  factory _$$FriendRequestImplCopyWith(
    _$FriendRequestImpl value,
    $Res Function(_$FriendRequestImpl) then,
  ) = __$$FriendRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String senderId,
    User sender,
    String receiverId,
    User receiver,
    String? message,
    FriendRequestStatus status,
    DateTime createdAt,
    DateTime? respondedAt,
    Map<String, dynamic>? metadata,
  });

  @override
  $UserCopyWith<$Res> get sender;
  @override
  $UserCopyWith<$Res> get receiver;
}

/// @nodoc
class __$$FriendRequestImplCopyWithImpl<$Res>
    extends _$FriendRequestCopyWithImpl<$Res, _$FriendRequestImpl>
    implements _$$FriendRequestImplCopyWith<$Res> {
  __$$FriendRequestImplCopyWithImpl(
    _$FriendRequestImpl _value,
    $Res Function(_$FriendRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FriendRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? sender = null,
    Object? receiverId = null,
    Object? receiver = null,
    Object? message = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? respondedAt = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _$FriendRequestImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        sender: null == sender
            ? _value.sender
            : sender // ignore: cast_nullable_to_non_nullable
                  as User,
        receiverId: null == receiverId
            ? _value.receiverId
            : receiverId // ignore: cast_nullable_to_non_nullable
                  as String,
        receiver: null == receiver
            ? _value.receiver
            : receiver // ignore: cast_nullable_to_non_nullable
                  as User,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as FriendRequestStatus,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        respondedAt: freezed == respondedAt
            ? _value.respondedAt
            : respondedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendRequestImpl implements _FriendRequest {
  const _$FriendRequestImpl({
    required this.id,
    required this.senderId,
    required this.sender,
    required this.receiverId,
    required this.receiver,
    this.message,
    required this.status,
    required this.createdAt,
    this.respondedAt,
    final Map<String, dynamic>? metadata,
  }) : _metadata = metadata;

  factory _$FriendRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendRequestImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final User sender;
  @override
  final String receiverId;
  @override
  final User receiver;
  @override
  final String? message;
  @override
  final FriendRequestStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime? respondedAt;
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
  String toString() {
    return 'FriendRequest(id: $id, senderId: $senderId, sender: $sender, receiverId: $receiverId, receiver: $receiver, message: $message, status: $status, createdAt: $createdAt, respondedAt: $respondedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.receiver, receiver) ||
                other.receiver == receiver) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    senderId,
    sender,
    receiverId,
    receiver,
    message,
    status,
    createdAt,
    respondedAt,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of FriendRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendRequestImplCopyWith<_$FriendRequestImpl> get copyWith =>
      __$$FriendRequestImplCopyWithImpl<_$FriendRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendRequestImplToJson(this);
  }
}

abstract class _FriendRequest implements FriendRequest {
  const factory _FriendRequest({
    required final String id,
    required final String senderId,
    required final User sender,
    required final String receiverId,
    required final User receiver,
    final String? message,
    required final FriendRequestStatus status,
    required final DateTime createdAt,
    final DateTime? respondedAt,
    final Map<String, dynamic>? metadata,
  }) = _$FriendRequestImpl;

  factory _FriendRequest.fromJson(Map<String, dynamic> json) =
      _$FriendRequestImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  User get sender;
  @override
  String get receiverId;
  @override
  User get receiver;
  @override
  String? get message;
  @override
  FriendRequestStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime? get respondedAt;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of FriendRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FriendRequestImplCopyWith<_$FriendRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SendFriendRequestModel _$SendFriendRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _SendFriendRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SendFriendRequestModel {
  String get userId => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this SendFriendRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendFriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendFriendRequestModelCopyWith<SendFriendRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendFriendRequestModelCopyWith<$Res> {
  factory $SendFriendRequestModelCopyWith(
    SendFriendRequestModel value,
    $Res Function(SendFriendRequestModel) then,
  ) = _$SendFriendRequestModelCopyWithImpl<$Res, SendFriendRequestModel>;
  @useResult
  $Res call({String userId, String? message});
}

/// @nodoc
class _$SendFriendRequestModelCopyWithImpl<
  $Res,
  $Val extends SendFriendRequestModel
>
    implements $SendFriendRequestModelCopyWith<$Res> {
  _$SendFriendRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendFriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? message = freezed}) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SendFriendRequestModelImplCopyWith<$Res>
    implements $SendFriendRequestModelCopyWith<$Res> {
  factory _$$SendFriendRequestModelImplCopyWith(
    _$SendFriendRequestModelImpl value,
    $Res Function(_$SendFriendRequestModelImpl) then,
  ) = __$$SendFriendRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String? message});
}

/// @nodoc
class __$$SendFriendRequestModelImplCopyWithImpl<$Res>
    extends
        _$SendFriendRequestModelCopyWithImpl<$Res, _$SendFriendRequestModelImpl>
    implements _$$SendFriendRequestModelImplCopyWith<$Res> {
  __$$SendFriendRequestModelImplCopyWithImpl(
    _$SendFriendRequestModelImpl _value,
    $Res Function(_$SendFriendRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SendFriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? message = freezed}) {
    return _then(
      _$SendFriendRequestModelImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SendFriendRequestModelImpl implements _SendFriendRequestModel {
  const _$SendFriendRequestModelImpl({required this.userId, this.message});

  factory _$SendFriendRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendFriendRequestModelImplFromJson(json);

  @override
  final String userId;
  @override
  final String? message;

  @override
  String toString() {
    return 'SendFriendRequestModel(userId: $userId, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendFriendRequestModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, message);

  /// Create a copy of SendFriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendFriendRequestModelImplCopyWith<_$SendFriendRequestModelImpl>
  get copyWith =>
      __$$SendFriendRequestModelImplCopyWithImpl<_$SendFriendRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SendFriendRequestModelImplToJson(this);
  }
}

abstract class _SendFriendRequestModel implements SendFriendRequestModel {
  const factory _SendFriendRequestModel({
    required final String userId,
    final String? message,
  }) = _$SendFriendRequestModelImpl;

  factory _SendFriendRequestModel.fromJson(Map<String, dynamic> json) =
      _$SendFriendRequestModelImpl.fromJson;

  @override
  String get userId;
  @override
  String? get message;

  /// Create a copy of SendFriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendFriendRequestModelImplCopyWith<_$SendFriendRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UserSuggestion _$UserSuggestionFromJson(Map<String, dynamic> json) {
  return _UserSuggestion.fromJson(json);
}

/// @nodoc
mixin _$UserSuggestion {
  User get user => throw _privateConstructorUsedError;
  SuggestionReason get reason => throw _privateConstructorUsedError;
  List<User> get mutualFriends => throw _privateConstructorUsedError;
  int get mutualFriendsCount => throw _privateConstructorUsedError;
  double get relevanceScore => throw _privateConstructorUsedError;

  /// Serializes this UserSuggestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSuggestionCopyWith<UserSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSuggestionCopyWith<$Res> {
  factory $UserSuggestionCopyWith(
    UserSuggestion value,
    $Res Function(UserSuggestion) then,
  ) = _$UserSuggestionCopyWithImpl<$Res, UserSuggestion>;
  @useResult
  $Res call({
    User user,
    SuggestionReason reason,
    List<User> mutualFriends,
    int mutualFriendsCount,
    double relevanceScore,
  });

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserSuggestionCopyWithImpl<$Res, $Val extends UserSuggestion>
    implements $UserSuggestionCopyWith<$Res> {
  _$UserSuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? reason = null,
    Object? mutualFriends = null,
    Object? mutualFriendsCount = null,
    Object? relevanceScore = null,
  }) {
    return _then(
      _value.copyWith(
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as User,
            reason: null == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as SuggestionReason,
            mutualFriends: null == mutualFriends
                ? _value.mutualFriends
                : mutualFriends // ignore: cast_nullable_to_non_nullable
                      as List<User>,
            mutualFriendsCount: null == mutualFriendsCount
                ? _value.mutualFriendsCount
                : mutualFriendsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            relevanceScore: null == relevanceScore
                ? _value.relevanceScore
                : relevanceScore // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }

  /// Create a copy of UserSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserSuggestionImplCopyWith<$Res>
    implements $UserSuggestionCopyWith<$Res> {
  factory _$$UserSuggestionImplCopyWith(
    _$UserSuggestionImpl value,
    $Res Function(_$UserSuggestionImpl) then,
  ) = __$$UserSuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    User user,
    SuggestionReason reason,
    List<User> mutualFriends,
    int mutualFriendsCount,
    double relevanceScore,
  });

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserSuggestionImplCopyWithImpl<$Res>
    extends _$UserSuggestionCopyWithImpl<$Res, _$UserSuggestionImpl>
    implements _$$UserSuggestionImplCopyWith<$Res> {
  __$$UserSuggestionImplCopyWithImpl(
    _$UserSuggestionImpl _value,
    $Res Function(_$UserSuggestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? reason = null,
    Object? mutualFriends = null,
    Object? mutualFriendsCount = null,
    Object? relevanceScore = null,
  }) {
    return _then(
      _$UserSuggestionImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as User,
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as SuggestionReason,
        mutualFriends: null == mutualFriends
            ? _value._mutualFriends
            : mutualFriends // ignore: cast_nullable_to_non_nullable
                  as List<User>,
        mutualFriendsCount: null == mutualFriendsCount
            ? _value.mutualFriendsCount
            : mutualFriendsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        relevanceScore: null == relevanceScore
            ? _value.relevanceScore
            : relevanceScore // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSuggestionImpl implements _UserSuggestion {
  const _$UserSuggestionImpl({
    required this.user,
    required this.reason,
    final List<User> mutualFriends = const [],
    this.mutualFriendsCount = 0,
    this.relevanceScore = 0.0,
  }) : _mutualFriends = mutualFriends;

  factory _$UserSuggestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSuggestionImplFromJson(json);

  @override
  final User user;
  @override
  final SuggestionReason reason;
  final List<User> _mutualFriends;
  @override
  @JsonKey()
  List<User> get mutualFriends {
    if (_mutualFriends is EqualUnmodifiableListView) return _mutualFriends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mutualFriends);
  }

  @override
  @JsonKey()
  final int mutualFriendsCount;
  @override
  @JsonKey()
  final double relevanceScore;

  @override
  String toString() {
    return 'UserSuggestion(user: $user, reason: $reason, mutualFriends: $mutualFriends, mutualFriendsCount: $mutualFriendsCount, relevanceScore: $relevanceScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSuggestionImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            const DeepCollectionEquality().equals(
              other._mutualFriends,
              _mutualFriends,
            ) &&
            (identical(other.mutualFriendsCount, mutualFriendsCount) ||
                other.mutualFriendsCount == mutualFriendsCount) &&
            (identical(other.relevanceScore, relevanceScore) ||
                other.relevanceScore == relevanceScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    user,
    reason,
    const DeepCollectionEquality().hash(_mutualFriends),
    mutualFriendsCount,
    relevanceScore,
  );

  /// Create a copy of UserSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSuggestionImplCopyWith<_$UserSuggestionImpl> get copyWith =>
      __$$UserSuggestionImplCopyWithImpl<_$UserSuggestionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSuggestionImplToJson(this);
  }
}

abstract class _UserSuggestion implements UserSuggestion {
  const factory _UserSuggestion({
    required final User user,
    required final SuggestionReason reason,
    final List<User> mutualFriends,
    final int mutualFriendsCount,
    final double relevanceScore,
  }) = _$UserSuggestionImpl;

  factory _UserSuggestion.fromJson(Map<String, dynamic> json) =
      _$UserSuggestionImpl.fromJson;

  @override
  User get user;
  @override
  SuggestionReason get reason;
  @override
  List<User> get mutualFriends;
  @override
  int get mutualFriendsCount;
  @override
  double get relevanceScore;

  /// Create a copy of UserSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSuggestionImplCopyWith<_$UserSuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NetworkStats _$NetworkStatsFromJson(Map<String, dynamic> json) {
  return _NetworkStats.fromJson(json);
}

/// @nodoc
mixin _$NetworkStats {
  int get friendsCount => throw _privateConstructorUsedError;
  int get pendingRequestsCount => throw _privateConstructorUsedError;
  int get sentRequestsCount => throw _privateConstructorUsedError;
  int get mutualConnectionsCount => throw _privateConstructorUsedError;
  int get blockedUsersCount => throw _privateConstructorUsedError;
  List<User> get recentConnections => throw _privateConstructorUsedError;
  List<UserSuggestion> get suggestions => throw _privateConstructorUsedError;

  /// Serializes this NetworkStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NetworkStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NetworkStatsCopyWith<NetworkStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkStatsCopyWith<$Res> {
  factory $NetworkStatsCopyWith(
    NetworkStats value,
    $Res Function(NetworkStats) then,
  ) = _$NetworkStatsCopyWithImpl<$Res, NetworkStats>;
  @useResult
  $Res call({
    int friendsCount,
    int pendingRequestsCount,
    int sentRequestsCount,
    int mutualConnectionsCount,
    int blockedUsersCount,
    List<User> recentConnections,
    List<UserSuggestion> suggestions,
  });
}

/// @nodoc
class _$NetworkStatsCopyWithImpl<$Res, $Val extends NetworkStats>
    implements $NetworkStatsCopyWith<$Res> {
  _$NetworkStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendsCount = null,
    Object? pendingRequestsCount = null,
    Object? sentRequestsCount = null,
    Object? mutualConnectionsCount = null,
    Object? blockedUsersCount = null,
    Object? recentConnections = null,
    Object? suggestions = null,
  }) {
    return _then(
      _value.copyWith(
            friendsCount: null == friendsCount
                ? _value.friendsCount
                : friendsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            pendingRequestsCount: null == pendingRequestsCount
                ? _value.pendingRequestsCount
                : pendingRequestsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            sentRequestsCount: null == sentRequestsCount
                ? _value.sentRequestsCount
                : sentRequestsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            mutualConnectionsCount: null == mutualConnectionsCount
                ? _value.mutualConnectionsCount
                : mutualConnectionsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            blockedUsersCount: null == blockedUsersCount
                ? _value.blockedUsersCount
                : blockedUsersCount // ignore: cast_nullable_to_non_nullable
                      as int,
            recentConnections: null == recentConnections
                ? _value.recentConnections
                : recentConnections // ignore: cast_nullable_to_non_nullable
                      as List<User>,
            suggestions: null == suggestions
                ? _value.suggestions
                : suggestions // ignore: cast_nullable_to_non_nullable
                      as List<UserSuggestion>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NetworkStatsImplCopyWith<$Res>
    implements $NetworkStatsCopyWith<$Res> {
  factory _$$NetworkStatsImplCopyWith(
    _$NetworkStatsImpl value,
    $Res Function(_$NetworkStatsImpl) then,
  ) = __$$NetworkStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int friendsCount,
    int pendingRequestsCount,
    int sentRequestsCount,
    int mutualConnectionsCount,
    int blockedUsersCount,
    List<User> recentConnections,
    List<UserSuggestion> suggestions,
  });
}

/// @nodoc
class __$$NetworkStatsImplCopyWithImpl<$Res>
    extends _$NetworkStatsCopyWithImpl<$Res, _$NetworkStatsImpl>
    implements _$$NetworkStatsImplCopyWith<$Res> {
  __$$NetworkStatsImplCopyWithImpl(
    _$NetworkStatsImpl _value,
    $Res Function(_$NetworkStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NetworkStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendsCount = null,
    Object? pendingRequestsCount = null,
    Object? sentRequestsCount = null,
    Object? mutualConnectionsCount = null,
    Object? blockedUsersCount = null,
    Object? recentConnections = null,
    Object? suggestions = null,
  }) {
    return _then(
      _$NetworkStatsImpl(
        friendsCount: null == friendsCount
            ? _value.friendsCount
            : friendsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        pendingRequestsCount: null == pendingRequestsCount
            ? _value.pendingRequestsCount
            : pendingRequestsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        sentRequestsCount: null == sentRequestsCount
            ? _value.sentRequestsCount
            : sentRequestsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        mutualConnectionsCount: null == mutualConnectionsCount
            ? _value.mutualConnectionsCount
            : mutualConnectionsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        blockedUsersCount: null == blockedUsersCount
            ? _value.blockedUsersCount
            : blockedUsersCount // ignore: cast_nullable_to_non_nullable
                  as int,
        recentConnections: null == recentConnections
            ? _value._recentConnections
            : recentConnections // ignore: cast_nullable_to_non_nullable
                  as List<User>,
        suggestions: null == suggestions
            ? _value._suggestions
            : suggestions // ignore: cast_nullable_to_non_nullable
                  as List<UserSuggestion>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkStatsImpl implements _NetworkStats {
  const _$NetworkStatsImpl({
    required this.friendsCount,
    required this.pendingRequestsCount,
    required this.sentRequestsCount,
    required this.mutualConnectionsCount,
    required this.blockedUsersCount,
    final List<User> recentConnections = const [],
    final List<UserSuggestion> suggestions = const [],
  }) : _recentConnections = recentConnections,
       _suggestions = suggestions;

  factory _$NetworkStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkStatsImplFromJson(json);

  @override
  final int friendsCount;
  @override
  final int pendingRequestsCount;
  @override
  final int sentRequestsCount;
  @override
  final int mutualConnectionsCount;
  @override
  final int blockedUsersCount;
  final List<User> _recentConnections;
  @override
  @JsonKey()
  List<User> get recentConnections {
    if (_recentConnections is EqualUnmodifiableListView)
      return _recentConnections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentConnections);
  }

  final List<UserSuggestion> _suggestions;
  @override
  @JsonKey()
  List<UserSuggestion> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  String toString() {
    return 'NetworkStats(friendsCount: $friendsCount, pendingRequestsCount: $pendingRequestsCount, sentRequestsCount: $sentRequestsCount, mutualConnectionsCount: $mutualConnectionsCount, blockedUsersCount: $blockedUsersCount, recentConnections: $recentConnections, suggestions: $suggestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkStatsImpl &&
            (identical(other.friendsCount, friendsCount) ||
                other.friendsCount == friendsCount) &&
            (identical(other.pendingRequestsCount, pendingRequestsCount) ||
                other.pendingRequestsCount == pendingRequestsCount) &&
            (identical(other.sentRequestsCount, sentRequestsCount) ||
                other.sentRequestsCount == sentRequestsCount) &&
            (identical(other.mutualConnectionsCount, mutualConnectionsCount) ||
                other.mutualConnectionsCount == mutualConnectionsCount) &&
            (identical(other.blockedUsersCount, blockedUsersCount) ||
                other.blockedUsersCount == blockedUsersCount) &&
            const DeepCollectionEquality().equals(
              other._recentConnections,
              _recentConnections,
            ) &&
            const DeepCollectionEquality().equals(
              other._suggestions,
              _suggestions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    friendsCount,
    pendingRequestsCount,
    sentRequestsCount,
    mutualConnectionsCount,
    blockedUsersCount,
    const DeepCollectionEquality().hash(_recentConnections),
    const DeepCollectionEquality().hash(_suggestions),
  );

  /// Create a copy of NetworkStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkStatsImplCopyWith<_$NetworkStatsImpl> get copyWith =>
      __$$NetworkStatsImplCopyWithImpl<_$NetworkStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkStatsImplToJson(this);
  }
}

abstract class _NetworkStats implements NetworkStats {
  const factory _NetworkStats({
    required final int friendsCount,
    required final int pendingRequestsCount,
    required final int sentRequestsCount,
    required final int mutualConnectionsCount,
    required final int blockedUsersCount,
    final List<User> recentConnections,
    final List<UserSuggestion> suggestions,
  }) = _$NetworkStatsImpl;

  factory _NetworkStats.fromJson(Map<String, dynamic> json) =
      _$NetworkStatsImpl.fromJson;

  @override
  int get friendsCount;
  @override
  int get pendingRequestsCount;
  @override
  int get sentRequestsCount;
  @override
  int get mutualConnectionsCount;
  @override
  int get blockedUsersCount;
  @override
  List<User> get recentConnections;
  @override
  List<UserSuggestion> get suggestions;

  /// Create a copy of NetworkStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkStatsImplCopyWith<_$NetworkStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
