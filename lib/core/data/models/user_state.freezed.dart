// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserState _$UserStateFromJson(Map<String, dynamic> json) {
  return _UserState.fromJson(json);
}

/// @nodoc
mixin _$UserState {
  AuthenticationStatus get authStatus => throw _privateConstructorUsedError;
  UserProfile? get currentUser => throw _privateConstructorUsedError;
  PersonalizationSettings? get personalization =>
      throw _privateConstructorUsedError;
  SyncStatus? get syncStatus => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  DateTime? get lastSyncedAt => throw _privateConstructorUsedError;

  /// Serializes this UserState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call({
    AuthenticationStatus authStatus,
    UserProfile? currentUser,
    PersonalizationSettings? personalization,
    SyncStatus? syncStatus,
    Map<String, dynamic> metadata,
    DateTime? lastSyncedAt,
  });

  $AuthenticationStatusCopyWith<$Res> get authStatus;
  $UserProfileCopyWith<$Res>? get currentUser;
  $PersonalizationSettingsCopyWith<$Res>? get personalization;
  $SyncStatusCopyWith<$Res>? get syncStatus;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authStatus = null,
    Object? currentUser = freezed,
    Object? personalization = freezed,
    Object? syncStatus = freezed,
    Object? metadata = null,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            authStatus: null == authStatus
                ? _value.authStatus
                : authStatus // ignore: cast_nullable_to_non_nullable
                      as AuthenticationStatus,
            currentUser: freezed == currentUser
                ? _value.currentUser
                : currentUser // ignore: cast_nullable_to_non_nullable
                      as UserProfile?,
            personalization: freezed == personalization
                ? _value.personalization
                : personalization // ignore: cast_nullable_to_non_nullable
                      as PersonalizationSettings?,
            syncStatus: freezed == syncStatus
                ? _value.syncStatus
                : syncStatus // ignore: cast_nullable_to_non_nullable
                      as SyncStatus?,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            lastSyncedAt: freezed == lastSyncedAt
                ? _value.lastSyncedAt
                : lastSyncedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthenticationStatusCopyWith<$Res> get authStatus {
    return $AuthenticationStatusCopyWith<$Res>(_value.authStatus, (value) {
      return _then(_value.copyWith(authStatus: value) as $Val);
    });
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get currentUser {
    if (_value.currentUser == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.currentUser!, (value) {
      return _then(_value.copyWith(currentUser: value) as $Val);
    });
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonalizationSettingsCopyWith<$Res>? get personalization {
    if (_value.personalization == null) {
      return null;
    }

    return $PersonalizationSettingsCopyWith<$Res>(_value.personalization!, (
      value,
    ) {
      return _then(_value.copyWith(personalization: value) as $Val);
    });
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SyncStatusCopyWith<$Res>? get syncStatus {
    if (_value.syncStatus == null) {
      return null;
    }

    return $SyncStatusCopyWith<$Res>(_value.syncStatus!, (value) {
      return _then(_value.copyWith(syncStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
    _$UserStateImpl value,
    $Res Function(_$UserStateImpl) then,
  ) = __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AuthenticationStatus authStatus,
    UserProfile? currentUser,
    PersonalizationSettings? personalization,
    SyncStatus? syncStatus,
    Map<String, dynamic> metadata,
    DateTime? lastSyncedAt,
  });

  @override
  $AuthenticationStatusCopyWith<$Res> get authStatus;
  @override
  $UserProfileCopyWith<$Res>? get currentUser;
  @override
  $PersonalizationSettingsCopyWith<$Res>? get personalization;
  @override
  $SyncStatusCopyWith<$Res>? get syncStatus;
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
    _$UserStateImpl _value,
    $Res Function(_$UserStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authStatus = null,
    Object? currentUser = freezed,
    Object? personalization = freezed,
    Object? syncStatus = freezed,
    Object? metadata = null,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(
      _$UserStateImpl(
        authStatus: null == authStatus
            ? _value.authStatus
            : authStatus // ignore: cast_nullable_to_non_nullable
                  as AuthenticationStatus,
        currentUser: freezed == currentUser
            ? _value.currentUser
            : currentUser // ignore: cast_nullable_to_non_nullable
                  as UserProfile?,
        personalization: freezed == personalization
            ? _value.personalization
            : personalization // ignore: cast_nullable_to_non_nullable
                  as PersonalizationSettings?,
        syncStatus: freezed == syncStatus
            ? _value.syncStatus
            : syncStatus // ignore: cast_nullable_to_non_nullable
                  as SyncStatus?,
        metadata: null == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        lastSyncedAt: freezed == lastSyncedAt
            ? _value.lastSyncedAt
            : lastSyncedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStateImpl implements _UserState {
  const _$UserStateImpl({
    required this.authStatus,
    this.currentUser,
    this.personalization,
    this.syncStatus,
    final Map<String, dynamic> metadata = const {},
    this.lastSyncedAt,
  }) : _metadata = metadata;

  factory _$UserStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStateImplFromJson(json);

  @override
  final AuthenticationStatus authStatus;
  @override
  final UserProfile? currentUser;
  @override
  final PersonalizationSettings? personalization;
  @override
  final SyncStatus? syncStatus;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final DateTime? lastSyncedAt;

  @override
  String toString() {
    return 'UserState(authStatus: $authStatus, currentUser: $currentUser, personalization: $personalization, syncStatus: $syncStatus, metadata: $metadata, lastSyncedAt: $lastSyncedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.authStatus, authStatus) ||
                other.authStatus == authStatus) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.personalization, personalization) ||
                other.personalization == personalization) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    authStatus,
    currentUser,
    personalization,
    syncStatus,
    const DeepCollectionEquality().hash(_metadata),
    lastSyncedAt,
  );

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStateImplToJson(this);
  }
}

abstract class _UserState implements UserState {
  const factory _UserState({
    required final AuthenticationStatus authStatus,
    final UserProfile? currentUser,
    final PersonalizationSettings? personalization,
    final SyncStatus? syncStatus,
    final Map<String, dynamic> metadata,
    final DateTime? lastSyncedAt,
  }) = _$UserStateImpl;

  factory _UserState.fromJson(Map<String, dynamic> json) =
      _$UserStateImpl.fromJson;

  @override
  AuthenticationStatus get authStatus;
  @override
  UserProfile? get currentUser;
  @override
  PersonalizationSettings? get personalization;
  @override
  SyncStatus? get syncStatus;
  @override
  Map<String, dynamic> get metadata;
  @override
  DateTime? get lastSyncedAt;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthenticationStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(
      String userId,
      String token,
      String? refreshToken,
      DateTime? expiresAt,
    )
    authenticated,
    required TResult Function(String? reason) unauthenticated,
    required TResult Function() authenticating,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(
      String userId,
      String token,
      String? refreshToken,
      DateTime? expiresAt,
    )?
    authenticated,
    TResult? Function(String? reason)? unauthenticated,
    TResult? Function()? authenticating,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(
      String userId,
      String token,
      String? refreshToken,
      DateTime? expiresAt,
    )?
    authenticated,
    TResult Function(String? reason)? unauthenticated,
    TResult Function()? authenticating,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Authenticating value) authenticating,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Authenticating value)? authenticating,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Authenticating value)? authenticating,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStatusCopyWith<$Res> {
  factory $AuthenticationStatusCopyWith(
    AuthenticationStatus value,
    $Res Function(AuthenticationStatus) then,
  ) = _$AuthenticationStatusCopyWithImpl<$Res, AuthenticationStatus>;
}

/// @nodoc
class _$AuthenticationStatusCopyWithImpl<
  $Res,
  $Val extends AuthenticationStatus
>
    implements $AuthenticationStatusCopyWith<$Res> {
  _$AuthenticationStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UnknownImplCopyWith<$Res> {
  factory _$$UnknownImplCopyWith(
    _$UnknownImpl value,
    $Res Function(_$UnknownImpl) then,
  ) = __$$UnknownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownImplCopyWithImpl<$Res>
    extends _$AuthenticationStatusCopyWithImpl<$Res, _$UnknownImpl>
    implements _$$UnknownImplCopyWith<$Res> {
  __$$UnknownImplCopyWithImpl(
    _$UnknownImpl _value,
    $Res Function(_$UnknownImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthenticationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnknownImpl implements _Unknown {
  const _$UnknownImpl();

  @override
  String toString() {
    return 'AuthenticationStatus.unknown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnknownImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(
      String userId,
      String token,
      String? refreshToken,
      DateTime? expiresAt,
    )
    authenticated,
    required TResult Function(String? reason) unauthenticated,
    required TResult Function() authenticating,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(
      String userId,
      String token,
      String? refreshToken,
      DateTime? expiresAt,
    )?
    authenticated,
    TResult? Function(String? reason)? unauthenticated,
    TResult? Function()? authenticating,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(
      String userId,
      String token,
      String? refreshToken,
      DateTime? expiresAt,
    )?
    authenticated,
    TResult Function(String? reason)? unauthenticated,
    TResult Function()? authenticating,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Authenticating value) authenticating,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Authenticating value)? authenticating,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Authenticating value)? authenticating,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements AuthenticationStatus {
  const factory _Unknown() = _$UnknownImpl;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
    _$AuthenticatedImpl value,
    $Res Function(_$AuthenticatedImpl) then,
  ) = __$$AuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String userId,
    String token,
    String? refreshToken,
    DateTime? expiresAt,
  });
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthenticationStatusCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
    _$AuthenticatedImpl _value,
    $Res Function(_$AuthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthenticationStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? token = null,
    Object? refreshToken = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _$AuthenticatedImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        refreshToken: freezed == refreshToken
            ? _value.refreshToken
            : refreshToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        expiresAt: freezed == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$AuthenticatedImpl implements _Authenticated {
  const _$AuthenticatedImpl({
    required this.userId,
    required this.token,
    this.refreshToken,
    this.expiresAt,
  });

  @override
  final String userId;
  @override
  final String token;
  @override
  final String? refreshToken;
  @override
  final DateTime? expiresAt;

  @override
  String toString() {
    return 'AuthenticationStatus.authenticated(userId: $userId, token: $token, refreshToken: $refreshToken, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, token, refreshToken, expiresAt);

  /// Create a copy of AuthenticationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      __$$AuthenticatedImplCopyWithImpl<_$AuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(
      String userId,
      String token,
      String? refreshToken,
      DateTime? expiresAt,
    )
    authenticated,
    required TResult Function(String? reason) unauthenticated,
    required TResult Function() authenticating,
  }) {
    return authenticated(userId, token, refreshToken, expiresAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(
      String userId,
      String token,
      String? refreshToken,
      DateTime? expiresAt,
    )?
    authenticated,
    TResult? Function(String? reason)? unauthenticated,
    TResult? Function()? authenticating,
  }) {
    return authenticated?.call(userId, token, refreshToken, expiresAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(
      String userId,
      String token,
      String? refreshToken,
      DateTime? expiresAt,
    )?
    authenticated,
    TResult Function(String? reason)? unauthenticated,
    TResult Function()? authenticating,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(userId, token, refreshToken, expiresAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Authenticating value) authenticating,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Authenticating value)? authenticating,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Authenticating value)? authenticating,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AuthenticationStatus {
  const factory _Authenticated({
    required final String userId,
    required final String token,
    final String? refreshToken,
    final DateTime? expiresAt,
  }) = _$AuthenticatedImpl;

  String get userId;
  String get token;
  String? get refreshToken;
  DateTime? get expiresAt;

  /// Create a copy of AuthenticationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(
    _$UnauthenticatedImpl value,
    $Res Function(_$UnauthenticatedImpl) then,
  ) = __$$UnauthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? reason});
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthenticationStatusCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
    _$UnauthenticatedImpl _value,
    $Res Function(_$UnauthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthenticationStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = freezed}) {
    return _then(
      _$UnauthenticatedImpl(
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$UnauthenticatedImpl implements _Unauthenticated {
  const _$UnauthenticatedImpl({this.reason});

  @override
  final String? reason;

  @override
  String toString() {
    return 'AuthenticationStatus.unauthenticated(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthenticatedImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of AuthenticationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthenticatedImplCopyWith<_$UnauthenticatedImpl> get copyWith =>
      __$$UnauthenticatedImplCopyWithImpl<_$UnauthenticatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(
      String userId,
      String token,
      String? refreshToken,
      DateTime? expiresAt,
    )
    authenticated,
    required TResult Function(String? reason) unauthenticated,
    required TResult Function() authenticating,
  }) {
    return unauthenticated(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(
      String userId,
      String token,
      String? refreshToken,
      DateTime? expiresAt,
    )?
    authenticated,
    TResult? Function(String? reason)? unauthenticated,
    TResult? Function()? authenticating,
  }) {
    return unauthenticated?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(
      String userId,
      String token,
      String? refreshToken,
      DateTime? expiresAt,
    )?
    authenticated,
    TResult Function(String? reason)? unauthenticated,
    TResult Function()? authenticating,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Authenticating value) authenticating,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Authenticating value)? authenticating,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Authenticating value)? authenticating,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements AuthenticationStatus {
  const factory _Unauthenticated({final String? reason}) =
      _$UnauthenticatedImpl;

  String? get reason;

  /// Create a copy of AuthenticationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthenticatedImplCopyWith<_$UnauthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticatingImplCopyWith<$Res> {
  factory _$$AuthenticatingImplCopyWith(
    _$AuthenticatingImpl value,
    $Res Function(_$AuthenticatingImpl) then,
  ) = __$$AuthenticatingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticatingImplCopyWithImpl<$Res>
    extends _$AuthenticationStatusCopyWithImpl<$Res, _$AuthenticatingImpl>
    implements _$$AuthenticatingImplCopyWith<$Res> {
  __$$AuthenticatingImplCopyWithImpl(
    _$AuthenticatingImpl _value,
    $Res Function(_$AuthenticatingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthenticationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthenticatingImpl implements _Authenticating {
  const _$AuthenticatingImpl();

  @override
  String toString() {
    return 'AuthenticationStatus.authenticating()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthenticatingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(
      String userId,
      String token,
      String? refreshToken,
      DateTime? expiresAt,
    )
    authenticated,
    required TResult Function(String? reason) unauthenticated,
    required TResult Function() authenticating,
  }) {
    return authenticating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(
      String userId,
      String token,
      String? refreshToken,
      DateTime? expiresAt,
    )?
    authenticated,
    TResult? Function(String? reason)? unauthenticated,
    TResult? Function()? authenticating,
  }) {
    return authenticating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(
      String userId,
      String token,
      String? refreshToken,
      DateTime? expiresAt,
    )?
    authenticated,
    TResult Function(String? reason)? unauthenticated,
    TResult Function()? authenticating,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Authenticating value) authenticating,
  }) {
    return authenticating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Authenticating value)? authenticating,
  }) {
    return authenticating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Authenticating value)? authenticating,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating(this);
    }
    return orElse();
  }
}

abstract class _Authenticating implements AuthenticationStatus {
  const factory _Authenticating() = _$AuthenticatingImpl;
}

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;
  UserPreferences? get preferences => throw _privateConstructorUsedError;
  UserStats? get stats => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
    UserProfile value,
    $Res Function(UserProfile) then,
  ) = _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call({
    String id,
    String username,
    String email,
    String? displayName,
    String? avatar,
    String? bio,
    String? phoneNumber,
    bool isVerified,
    bool isPremium,
    UserPreferences? preferences,
    UserStats? stats,
    Map<String, dynamic> metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  $UserPreferencesCopyWith<$Res>? get preferences;
  $UserStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? avatar = freezed,
    Object? bio = freezed,
    Object? phoneNumber = freezed,
    Object? isVerified = null,
    Object? isPremium = null,
    Object? preferences = freezed,
    Object? stats = freezed,
    Object? metadata = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: freezed == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            bio: freezed == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                      as String?,
            phoneNumber: freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            isVerified: null == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
            isPremium: null == isPremium
                ? _value.isPremium
                : isPremium // ignore: cast_nullable_to_non_nullable
                      as bool,
            preferences: freezed == preferences
                ? _value.preferences
                : preferences // ignore: cast_nullable_to_non_nullable
                      as UserPreferences?,
            stats: freezed == stats
                ? _value.stats
                : stats // ignore: cast_nullable_to_non_nullable
                      as UserStats?,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesCopyWith<$Res>? get preferences {
    if (_value.preferences == null) {
      return null;
    }

    return $UserPreferencesCopyWith<$Res>(_value.preferences!, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStatsCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $UserStatsCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
    _$UserProfileImpl value,
    $Res Function(_$UserProfileImpl) then,
  ) = __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String username,
    String email,
    String? displayName,
    String? avatar,
    String? bio,
    String? phoneNumber,
    bool isVerified,
    bool isPremium,
    UserPreferences? preferences,
    UserStats? stats,
    Map<String, dynamic> metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  @override
  $UserPreferencesCopyWith<$Res>? get preferences;
  @override
  $UserStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
    _$UserProfileImpl _value,
    $Res Function(_$UserProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? avatar = freezed,
    Object? bio = freezed,
    Object? phoneNumber = freezed,
    Object? isVerified = null,
    Object? isPremium = null,
    Object? preferences = freezed,
    Object? stats = freezed,
    Object? metadata = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$UserProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: freezed == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        bio: freezed == bio
            ? _value.bio
            : bio // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        isVerified: null == isVerified
            ? _value.isVerified
            : isVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        isPremium: null == isPremium
            ? _value.isPremium
            : isPremium // ignore: cast_nullable_to_non_nullable
                  as bool,
        preferences: freezed == preferences
            ? _value.preferences
            : preferences // ignore: cast_nullable_to_non_nullable
                  as UserPreferences?,
        stats: freezed == stats
            ? _value.stats
            : stats // ignore: cast_nullable_to_non_nullable
                  as UserStats?,
        metadata: null == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl({
    required this.id,
    required this.username,
    required this.email,
    this.displayName,
    this.avatar,
    this.bio,
    this.phoneNumber,
    this.isVerified = false,
    this.isPremium = false,
    this.preferences,
    this.stats,
    final Map<String, dynamic> metadata = const {},
    this.createdAt,
    this.updatedAt,
  }) : _metadata = metadata;

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String email;
  @override
  final String? displayName;
  @override
  final String? avatar;
  @override
  final String? bio;
  @override
  final String? phoneNumber;
  @override
  @JsonKey()
  final bool isVerified;
  @override
  @JsonKey()
  final bool isPremium;
  @override
  final UserPreferences? preferences;
  @override
  final UserStats? stats;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserProfile(id: $id, username: $username, email: $email, displayName: $displayName, avatar: $avatar, bio: $bio, phoneNumber: $phoneNumber, isVerified: $isVerified, isPremium: $isPremium, preferences: $preferences, stats: $stats, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
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
    username,
    email,
    displayName,
    avatar,
    bio,
    phoneNumber,
    isVerified,
    isPremium,
    preferences,
    stats,
    const DeepCollectionEquality().hash(_metadata),
    createdAt,
    updatedAt,
  );

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(this);
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile({
    required final String id,
    required final String username,
    required final String email,
    final String? displayName,
    final String? avatar,
    final String? bio,
    final String? phoneNumber,
    final bool isVerified,
    final bool isPremium,
    final UserPreferences? preferences,
    final UserStats? stats,
    final Map<String, dynamic> metadata,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get email;
  @override
  String? get displayName;
  @override
  String? get avatar;
  @override
  String? get bio;
  @override
  String? get phoneNumber;
  @override
  bool get isVerified;
  @override
  bool get isPremium;
  @override
  UserPreferences? get preferences;
  @override
  UserStats? get stats;
  @override
  Map<String, dynamic> get metadata;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserPreferences {
  String get theme => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  bool get notificationsEnabled => throw _privateConstructorUsedError;
  bool get soundEnabled => throw _privateConstructorUsedError;
  bool get vibrationEnabled => throw _privateConstructorUsedError;
  String get defaultPostVisibility => throw _privateConstructorUsedError;
  bool get autoPlayVideos => throw _privateConstructorUsedError;
  bool get reducedMotion => throw _privateConstructorUsedError;
  PrivacySettings? get privacy => throw _privateConstructorUsedError;
  Map<String, dynamic> get custom => throw _privateConstructorUsedError;

  /// Serializes this UserPreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
    UserPreferences value,
    $Res Function(UserPreferences) then,
  ) = _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call({
    String theme,
    String language,
    bool notificationsEnabled,
    bool soundEnabled,
    bool vibrationEnabled,
    String defaultPostVisibility,
    bool autoPlayVideos,
    bool reducedMotion,
    PrivacySettings? privacy,
    Map<String, dynamic> custom,
  });

  $PrivacySettingsCopyWith<$Res>? get privacy;
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? language = null,
    Object? notificationsEnabled = null,
    Object? soundEnabled = null,
    Object? vibrationEnabled = null,
    Object? defaultPostVisibility = null,
    Object? autoPlayVideos = null,
    Object? reducedMotion = null,
    Object? privacy = freezed,
    Object? custom = null,
  }) {
    return _then(
      _value.copyWith(
            theme: null == theme
                ? _value.theme
                : theme // ignore: cast_nullable_to_non_nullable
                      as String,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            notificationsEnabled: null == notificationsEnabled
                ? _value.notificationsEnabled
                : notificationsEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            soundEnabled: null == soundEnabled
                ? _value.soundEnabled
                : soundEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            vibrationEnabled: null == vibrationEnabled
                ? _value.vibrationEnabled
                : vibrationEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            defaultPostVisibility: null == defaultPostVisibility
                ? _value.defaultPostVisibility
                : defaultPostVisibility // ignore: cast_nullable_to_non_nullable
                      as String,
            autoPlayVideos: null == autoPlayVideos
                ? _value.autoPlayVideos
                : autoPlayVideos // ignore: cast_nullable_to_non_nullable
                      as bool,
            reducedMotion: null == reducedMotion
                ? _value.reducedMotion
                : reducedMotion // ignore: cast_nullable_to_non_nullable
                      as bool,
            privacy: freezed == privacy
                ? _value.privacy
                : privacy // ignore: cast_nullable_to_non_nullable
                      as PrivacySettings?,
            custom: null == custom
                ? _value.custom
                : custom // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrivacySettingsCopyWith<$Res>? get privacy {
    if (_value.privacy == null) {
      return null;
    }

    return $PrivacySettingsCopyWith<$Res>(_value.privacy!, (value) {
      return _then(_value.copyWith(privacy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserPreferencesImplCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$UserPreferencesImplCopyWith(
    _$UserPreferencesImpl value,
    $Res Function(_$UserPreferencesImpl) then,
  ) = __$$UserPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String theme,
    String language,
    bool notificationsEnabled,
    bool soundEnabled,
    bool vibrationEnabled,
    String defaultPostVisibility,
    bool autoPlayVideos,
    bool reducedMotion,
    PrivacySettings? privacy,
    Map<String, dynamic> custom,
  });

  @override
  $PrivacySettingsCopyWith<$Res>? get privacy;
}

/// @nodoc
class __$$UserPreferencesImplCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$UserPreferencesImpl>
    implements _$$UserPreferencesImplCopyWith<$Res> {
  __$$UserPreferencesImplCopyWithImpl(
    _$UserPreferencesImpl _value,
    $Res Function(_$UserPreferencesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? language = null,
    Object? notificationsEnabled = null,
    Object? soundEnabled = null,
    Object? vibrationEnabled = null,
    Object? defaultPostVisibility = null,
    Object? autoPlayVideos = null,
    Object? reducedMotion = null,
    Object? privacy = freezed,
    Object? custom = null,
  }) {
    return _then(
      _$UserPreferencesImpl(
        theme: null == theme
            ? _value.theme
            : theme // ignore: cast_nullable_to_non_nullable
                  as String,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        notificationsEnabled: null == notificationsEnabled
            ? _value.notificationsEnabled
            : notificationsEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        soundEnabled: null == soundEnabled
            ? _value.soundEnabled
            : soundEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        vibrationEnabled: null == vibrationEnabled
            ? _value.vibrationEnabled
            : vibrationEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        defaultPostVisibility: null == defaultPostVisibility
            ? _value.defaultPostVisibility
            : defaultPostVisibility // ignore: cast_nullable_to_non_nullable
                  as String,
        autoPlayVideos: null == autoPlayVideos
            ? _value.autoPlayVideos
            : autoPlayVideos // ignore: cast_nullable_to_non_nullable
                  as bool,
        reducedMotion: null == reducedMotion
            ? _value.reducedMotion
            : reducedMotion // ignore: cast_nullable_to_non_nullable
                  as bool,
        privacy: freezed == privacy
            ? _value.privacy
            : privacy // ignore: cast_nullable_to_non_nullable
                  as PrivacySettings?,
        custom: null == custom
            ? _value._custom
            : custom // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesImpl implements _UserPreferences {
  const _$UserPreferencesImpl({
    this.theme = 'system',
    this.language = 'en',
    this.notificationsEnabled = true,
    this.soundEnabled = true,
    this.vibrationEnabled = true,
    this.defaultPostVisibility = 'public',
    this.autoPlayVideos = true,
    this.reducedMotion = false,
    this.privacy,
    final Map<String, dynamic> custom = const {},
  }) : _custom = custom;

  factory _$UserPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesImplFromJson(json);

  @override
  @JsonKey()
  final String theme;
  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey()
  final bool notificationsEnabled;
  @override
  @JsonKey()
  final bool soundEnabled;
  @override
  @JsonKey()
  final bool vibrationEnabled;
  @override
  @JsonKey()
  final String defaultPostVisibility;
  @override
  @JsonKey()
  final bool autoPlayVideos;
  @override
  @JsonKey()
  final bool reducedMotion;
  @override
  final PrivacySettings? privacy;
  final Map<String, dynamic> _custom;
  @override
  @JsonKey()
  Map<String, dynamic> get custom {
    if (_custom is EqualUnmodifiableMapView) return _custom;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_custom);
  }

  @override
  String toString() {
    return 'UserPreferences(theme: $theme, language: $language, notificationsEnabled: $notificationsEnabled, soundEnabled: $soundEnabled, vibrationEnabled: $vibrationEnabled, defaultPostVisibility: $defaultPostVisibility, autoPlayVideos: $autoPlayVideos, reducedMotion: $reducedMotion, privacy: $privacy, custom: $custom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesImpl &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(other.soundEnabled, soundEnabled) ||
                other.soundEnabled == soundEnabled) &&
            (identical(other.vibrationEnabled, vibrationEnabled) ||
                other.vibrationEnabled == vibrationEnabled) &&
            (identical(other.defaultPostVisibility, defaultPostVisibility) ||
                other.defaultPostVisibility == defaultPostVisibility) &&
            (identical(other.autoPlayVideos, autoPlayVideos) ||
                other.autoPlayVideos == autoPlayVideos) &&
            (identical(other.reducedMotion, reducedMotion) ||
                other.reducedMotion == reducedMotion) &&
            (identical(other.privacy, privacy) || other.privacy == privacy) &&
            const DeepCollectionEquality().equals(other._custom, _custom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    theme,
    language,
    notificationsEnabled,
    soundEnabled,
    vibrationEnabled,
    defaultPostVisibility,
    autoPlayVideos,
    reducedMotion,
    privacy,
    const DeepCollectionEquality().hash(_custom),
  );

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      __$$UserPreferencesImplCopyWithImpl<_$UserPreferencesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesImplToJson(this);
  }
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences({
    final String theme,
    final String language,
    final bool notificationsEnabled,
    final bool soundEnabled,
    final bool vibrationEnabled,
    final String defaultPostVisibility,
    final bool autoPlayVideos,
    final bool reducedMotion,
    final PrivacySettings? privacy,
    final Map<String, dynamic> custom,
  }) = _$UserPreferencesImpl;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesImpl.fromJson;

  @override
  String get theme;
  @override
  String get language;
  @override
  bool get notificationsEnabled;
  @override
  bool get soundEnabled;
  @override
  bool get vibrationEnabled;
  @override
  String get defaultPostVisibility;
  @override
  bool get autoPlayVideos;
  @override
  bool get reducedMotion;
  @override
  PrivacySettings? get privacy;
  @override
  Map<String, dynamic> get custom;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrivacySettings _$PrivacySettingsFromJson(Map<String, dynamic> json) {
  return _PrivacySettings.fromJson(json);
}

/// @nodoc
mixin _$PrivacySettings {
  bool get allowDirectMessages => throw _privateConstructorUsedError;
  bool get allowFriendRequests => throw _privateConstructorUsedError;
  String get profileVisibility =>
      throw _privateConstructorUsedError; // public, friends, private
  String get whoCanTag =>
      throw _privateConstructorUsedError; // everyone, friends, no_one
  bool get hideOnlineStatus => throw _privateConstructorUsedError;
  bool get hideLastSeen => throw _privateConstructorUsedError;
  List<String> get blockedUsers => throw _privateConstructorUsedError;
  List<String> get mutedUsers => throw _privateConstructorUsedError;

  /// Serializes this PrivacySettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivacySettingsCopyWith<PrivacySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacySettingsCopyWith<$Res> {
  factory $PrivacySettingsCopyWith(
    PrivacySettings value,
    $Res Function(PrivacySettings) then,
  ) = _$PrivacySettingsCopyWithImpl<$Res, PrivacySettings>;
  @useResult
  $Res call({
    bool allowDirectMessages,
    bool allowFriendRequests,
    String profileVisibility,
    String whoCanTag,
    bool hideOnlineStatus,
    bool hideLastSeen,
    List<String> blockedUsers,
    List<String> mutedUsers,
  });
}

/// @nodoc
class _$PrivacySettingsCopyWithImpl<$Res, $Val extends PrivacySettings>
    implements $PrivacySettingsCopyWith<$Res> {
  _$PrivacySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowDirectMessages = null,
    Object? allowFriendRequests = null,
    Object? profileVisibility = null,
    Object? whoCanTag = null,
    Object? hideOnlineStatus = null,
    Object? hideLastSeen = null,
    Object? blockedUsers = null,
    Object? mutedUsers = null,
  }) {
    return _then(
      _value.copyWith(
            allowDirectMessages: null == allowDirectMessages
                ? _value.allowDirectMessages
                : allowDirectMessages // ignore: cast_nullable_to_non_nullable
                      as bool,
            allowFriendRequests: null == allowFriendRequests
                ? _value.allowFriendRequests
                : allowFriendRequests // ignore: cast_nullable_to_non_nullable
                      as bool,
            profileVisibility: null == profileVisibility
                ? _value.profileVisibility
                : profileVisibility // ignore: cast_nullable_to_non_nullable
                      as String,
            whoCanTag: null == whoCanTag
                ? _value.whoCanTag
                : whoCanTag // ignore: cast_nullable_to_non_nullable
                      as String,
            hideOnlineStatus: null == hideOnlineStatus
                ? _value.hideOnlineStatus
                : hideOnlineStatus // ignore: cast_nullable_to_non_nullable
                      as bool,
            hideLastSeen: null == hideLastSeen
                ? _value.hideLastSeen
                : hideLastSeen // ignore: cast_nullable_to_non_nullable
                      as bool,
            blockedUsers: null == blockedUsers
                ? _value.blockedUsers
                : blockedUsers // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            mutedUsers: null == mutedUsers
                ? _value.mutedUsers
                : mutedUsers // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrivacySettingsImplCopyWith<$Res>
    implements $PrivacySettingsCopyWith<$Res> {
  factory _$$PrivacySettingsImplCopyWith(
    _$PrivacySettingsImpl value,
    $Res Function(_$PrivacySettingsImpl) then,
  ) = __$$PrivacySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool allowDirectMessages,
    bool allowFriendRequests,
    String profileVisibility,
    String whoCanTag,
    bool hideOnlineStatus,
    bool hideLastSeen,
    List<String> blockedUsers,
    List<String> mutedUsers,
  });
}

/// @nodoc
class __$$PrivacySettingsImplCopyWithImpl<$Res>
    extends _$PrivacySettingsCopyWithImpl<$Res, _$PrivacySettingsImpl>
    implements _$$PrivacySettingsImplCopyWith<$Res> {
  __$$PrivacySettingsImplCopyWithImpl(
    _$PrivacySettingsImpl _value,
    $Res Function(_$PrivacySettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowDirectMessages = null,
    Object? allowFriendRequests = null,
    Object? profileVisibility = null,
    Object? whoCanTag = null,
    Object? hideOnlineStatus = null,
    Object? hideLastSeen = null,
    Object? blockedUsers = null,
    Object? mutedUsers = null,
  }) {
    return _then(
      _$PrivacySettingsImpl(
        allowDirectMessages: null == allowDirectMessages
            ? _value.allowDirectMessages
            : allowDirectMessages // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowFriendRequests: null == allowFriendRequests
            ? _value.allowFriendRequests
            : allowFriendRequests // ignore: cast_nullable_to_non_nullable
                  as bool,
        profileVisibility: null == profileVisibility
            ? _value.profileVisibility
            : profileVisibility // ignore: cast_nullable_to_non_nullable
                  as String,
        whoCanTag: null == whoCanTag
            ? _value.whoCanTag
            : whoCanTag // ignore: cast_nullable_to_non_nullable
                  as String,
        hideOnlineStatus: null == hideOnlineStatus
            ? _value.hideOnlineStatus
            : hideOnlineStatus // ignore: cast_nullable_to_non_nullable
                  as bool,
        hideLastSeen: null == hideLastSeen
            ? _value.hideLastSeen
            : hideLastSeen // ignore: cast_nullable_to_non_nullable
                  as bool,
        blockedUsers: null == blockedUsers
            ? _value._blockedUsers
            : blockedUsers // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        mutedUsers: null == mutedUsers
            ? _value._mutedUsers
            : mutedUsers // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacySettingsImpl implements _PrivacySettings {
  const _$PrivacySettingsImpl({
    this.allowDirectMessages = true,
    this.allowFriendRequests = true,
    this.profileVisibility = 'friends',
    this.whoCanTag = 'everyone',
    this.hideOnlineStatus = false,
    this.hideLastSeen = false,
    final List<String> blockedUsers = const [],
    final List<String> mutedUsers = const [],
  }) : _blockedUsers = blockedUsers,
       _mutedUsers = mutedUsers;

  factory _$PrivacySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacySettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool allowDirectMessages;
  @override
  @JsonKey()
  final bool allowFriendRequests;
  @override
  @JsonKey()
  final String profileVisibility;
  // public, friends, private
  @override
  @JsonKey()
  final String whoCanTag;
  // everyone, friends, no_one
  @override
  @JsonKey()
  final bool hideOnlineStatus;
  @override
  @JsonKey()
  final bool hideLastSeen;
  final List<String> _blockedUsers;
  @override
  @JsonKey()
  List<String> get blockedUsers {
    if (_blockedUsers is EqualUnmodifiableListView) return _blockedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blockedUsers);
  }

  final List<String> _mutedUsers;
  @override
  @JsonKey()
  List<String> get mutedUsers {
    if (_mutedUsers is EqualUnmodifiableListView) return _mutedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mutedUsers);
  }

  @override
  String toString() {
    return 'PrivacySettings(allowDirectMessages: $allowDirectMessages, allowFriendRequests: $allowFriendRequests, profileVisibility: $profileVisibility, whoCanTag: $whoCanTag, hideOnlineStatus: $hideOnlineStatus, hideLastSeen: $hideLastSeen, blockedUsers: $blockedUsers, mutedUsers: $mutedUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacySettingsImpl &&
            (identical(other.allowDirectMessages, allowDirectMessages) ||
                other.allowDirectMessages == allowDirectMessages) &&
            (identical(other.allowFriendRequests, allowFriendRequests) ||
                other.allowFriendRequests == allowFriendRequests) &&
            (identical(other.profileVisibility, profileVisibility) ||
                other.profileVisibility == profileVisibility) &&
            (identical(other.whoCanTag, whoCanTag) ||
                other.whoCanTag == whoCanTag) &&
            (identical(other.hideOnlineStatus, hideOnlineStatus) ||
                other.hideOnlineStatus == hideOnlineStatus) &&
            (identical(other.hideLastSeen, hideLastSeen) ||
                other.hideLastSeen == hideLastSeen) &&
            const DeepCollectionEquality().equals(
              other._blockedUsers,
              _blockedUsers,
            ) &&
            const DeepCollectionEquality().equals(
              other._mutedUsers,
              _mutedUsers,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    allowDirectMessages,
    allowFriendRequests,
    profileVisibility,
    whoCanTag,
    hideOnlineStatus,
    hideLastSeen,
    const DeepCollectionEquality().hash(_blockedUsers),
    const DeepCollectionEquality().hash(_mutedUsers),
  );

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacySettingsImplCopyWith<_$PrivacySettingsImpl> get copyWith =>
      __$$PrivacySettingsImplCopyWithImpl<_$PrivacySettingsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacySettingsImplToJson(this);
  }
}

abstract class _PrivacySettings implements PrivacySettings {
  const factory _PrivacySettings({
    final bool allowDirectMessages,
    final bool allowFriendRequests,
    final String profileVisibility,
    final String whoCanTag,
    final bool hideOnlineStatus,
    final bool hideLastSeen,
    final List<String> blockedUsers,
    final List<String> mutedUsers,
  }) = _$PrivacySettingsImpl;

  factory _PrivacySettings.fromJson(Map<String, dynamic> json) =
      _$PrivacySettingsImpl.fromJson;

  @override
  bool get allowDirectMessages;
  @override
  bool get allowFriendRequests;
  @override
  String get profileVisibility; // public, friends, private
  @override
  String get whoCanTag; // everyone, friends, no_one
  @override
  bool get hideOnlineStatus;
  @override
  bool get hideLastSeen;
  @override
  List<String> get blockedUsers;
  @override
  List<String> get mutedUsers;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivacySettingsImplCopyWith<_$PrivacySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserStats _$UserStatsFromJson(Map<String, dynamic> json) {
  return _UserStats.fromJson(json);
}

/// @nodoc
mixin _$UserStats {
  int get postsCount => throw _privateConstructorUsedError;
  int get followersCount => throw _privateConstructorUsedError;
  int get followingCount => throw _privateConstructorUsedError;
  int get friendsCount => throw _privateConstructorUsedError;
  int get likesReceived => throw _privateConstructorUsedError;
  int get commentsReceived => throw _privateConstructorUsedError;
  int get sharesCount => throw _privateConstructorUsedError;
  int get achievementsUnlocked => throw _privateConstructorUsedError;
  int get streakDays => throw _privateConstructorUsedError;
  DateTime? get memberSince => throw _privateConstructorUsedError;
  Map<String, int> get activityByDay => throw _privateConstructorUsedError;

  /// Serializes this UserStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatsCopyWith<UserStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatsCopyWith<$Res> {
  factory $UserStatsCopyWith(UserStats value, $Res Function(UserStats) then) =
      _$UserStatsCopyWithImpl<$Res, UserStats>;
  @useResult
  $Res call({
    int postsCount,
    int followersCount,
    int followingCount,
    int friendsCount,
    int likesReceived,
    int commentsReceived,
    int sharesCount,
    int achievementsUnlocked,
    int streakDays,
    DateTime? memberSince,
    Map<String, int> activityByDay,
  });
}

/// @nodoc
class _$UserStatsCopyWithImpl<$Res, $Val extends UserStats>
    implements $UserStatsCopyWith<$Res> {
  _$UserStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postsCount = null,
    Object? followersCount = null,
    Object? followingCount = null,
    Object? friendsCount = null,
    Object? likesReceived = null,
    Object? commentsReceived = null,
    Object? sharesCount = null,
    Object? achievementsUnlocked = null,
    Object? streakDays = null,
    Object? memberSince = freezed,
    Object? activityByDay = null,
  }) {
    return _then(
      _value.copyWith(
            postsCount: null == postsCount
                ? _value.postsCount
                : postsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            followersCount: null == followersCount
                ? _value.followersCount
                : followersCount // ignore: cast_nullable_to_non_nullable
                      as int,
            followingCount: null == followingCount
                ? _value.followingCount
                : followingCount // ignore: cast_nullable_to_non_nullable
                      as int,
            friendsCount: null == friendsCount
                ? _value.friendsCount
                : friendsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            likesReceived: null == likesReceived
                ? _value.likesReceived
                : likesReceived // ignore: cast_nullable_to_non_nullable
                      as int,
            commentsReceived: null == commentsReceived
                ? _value.commentsReceived
                : commentsReceived // ignore: cast_nullable_to_non_nullable
                      as int,
            sharesCount: null == sharesCount
                ? _value.sharesCount
                : sharesCount // ignore: cast_nullable_to_non_nullable
                      as int,
            achievementsUnlocked: null == achievementsUnlocked
                ? _value.achievementsUnlocked
                : achievementsUnlocked // ignore: cast_nullable_to_non_nullable
                      as int,
            streakDays: null == streakDays
                ? _value.streakDays
                : streakDays // ignore: cast_nullable_to_non_nullable
                      as int,
            memberSince: freezed == memberSince
                ? _value.memberSince
                : memberSince // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            activityByDay: null == activityByDay
                ? _value.activityByDay
                : activityByDay // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserStatsImplCopyWith<$Res>
    implements $UserStatsCopyWith<$Res> {
  factory _$$UserStatsImplCopyWith(
    _$UserStatsImpl value,
    $Res Function(_$UserStatsImpl) then,
  ) = __$$UserStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int postsCount,
    int followersCount,
    int followingCount,
    int friendsCount,
    int likesReceived,
    int commentsReceived,
    int sharesCount,
    int achievementsUnlocked,
    int streakDays,
    DateTime? memberSince,
    Map<String, int> activityByDay,
  });
}

/// @nodoc
class __$$UserStatsImplCopyWithImpl<$Res>
    extends _$UserStatsCopyWithImpl<$Res, _$UserStatsImpl>
    implements _$$UserStatsImplCopyWith<$Res> {
  __$$UserStatsImplCopyWithImpl(
    _$UserStatsImpl _value,
    $Res Function(_$UserStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postsCount = null,
    Object? followersCount = null,
    Object? followingCount = null,
    Object? friendsCount = null,
    Object? likesReceived = null,
    Object? commentsReceived = null,
    Object? sharesCount = null,
    Object? achievementsUnlocked = null,
    Object? streakDays = null,
    Object? memberSince = freezed,
    Object? activityByDay = null,
  }) {
    return _then(
      _$UserStatsImpl(
        postsCount: null == postsCount
            ? _value.postsCount
            : postsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        followersCount: null == followersCount
            ? _value.followersCount
            : followersCount // ignore: cast_nullable_to_non_nullable
                  as int,
        followingCount: null == followingCount
            ? _value.followingCount
            : followingCount // ignore: cast_nullable_to_non_nullable
                  as int,
        friendsCount: null == friendsCount
            ? _value.friendsCount
            : friendsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        likesReceived: null == likesReceived
            ? _value.likesReceived
            : likesReceived // ignore: cast_nullable_to_non_nullable
                  as int,
        commentsReceived: null == commentsReceived
            ? _value.commentsReceived
            : commentsReceived // ignore: cast_nullable_to_non_nullable
                  as int,
        sharesCount: null == sharesCount
            ? _value.sharesCount
            : sharesCount // ignore: cast_nullable_to_non_nullable
                  as int,
        achievementsUnlocked: null == achievementsUnlocked
            ? _value.achievementsUnlocked
            : achievementsUnlocked // ignore: cast_nullable_to_non_nullable
                  as int,
        streakDays: null == streakDays
            ? _value.streakDays
            : streakDays // ignore: cast_nullable_to_non_nullable
                  as int,
        memberSince: freezed == memberSince
            ? _value.memberSince
            : memberSince // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        activityByDay: null == activityByDay
            ? _value._activityByDay
            : activityByDay // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatsImpl implements _UserStats {
  const _$UserStatsImpl({
    this.postsCount = 0,
    this.followersCount = 0,
    this.followingCount = 0,
    this.friendsCount = 0,
    this.likesReceived = 0,
    this.commentsReceived = 0,
    this.sharesCount = 0,
    this.achievementsUnlocked = 0,
    this.streakDays = 0,
    this.memberSince,
    final Map<String, int> activityByDay = const {},
  }) : _activityByDay = activityByDay;

  factory _$UserStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatsImplFromJson(json);

  @override
  @JsonKey()
  final int postsCount;
  @override
  @JsonKey()
  final int followersCount;
  @override
  @JsonKey()
  final int followingCount;
  @override
  @JsonKey()
  final int friendsCount;
  @override
  @JsonKey()
  final int likesReceived;
  @override
  @JsonKey()
  final int commentsReceived;
  @override
  @JsonKey()
  final int sharesCount;
  @override
  @JsonKey()
  final int achievementsUnlocked;
  @override
  @JsonKey()
  final int streakDays;
  @override
  final DateTime? memberSince;
  final Map<String, int> _activityByDay;
  @override
  @JsonKey()
  Map<String, int> get activityByDay {
    if (_activityByDay is EqualUnmodifiableMapView) return _activityByDay;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_activityByDay);
  }

  @override
  String toString() {
    return 'UserStats(postsCount: $postsCount, followersCount: $followersCount, followingCount: $followingCount, friendsCount: $friendsCount, likesReceived: $likesReceived, commentsReceived: $commentsReceived, sharesCount: $sharesCount, achievementsUnlocked: $achievementsUnlocked, streakDays: $streakDays, memberSince: $memberSince, activityByDay: $activityByDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatsImpl &&
            (identical(other.postsCount, postsCount) ||
                other.postsCount == postsCount) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.friendsCount, friendsCount) ||
                other.friendsCount == friendsCount) &&
            (identical(other.likesReceived, likesReceived) ||
                other.likesReceived == likesReceived) &&
            (identical(other.commentsReceived, commentsReceived) ||
                other.commentsReceived == commentsReceived) &&
            (identical(other.sharesCount, sharesCount) ||
                other.sharesCount == sharesCount) &&
            (identical(other.achievementsUnlocked, achievementsUnlocked) ||
                other.achievementsUnlocked == achievementsUnlocked) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays) &&
            (identical(other.memberSince, memberSince) ||
                other.memberSince == memberSince) &&
            const DeepCollectionEquality().equals(
              other._activityByDay,
              _activityByDay,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    postsCount,
    followersCount,
    followingCount,
    friendsCount,
    likesReceived,
    commentsReceived,
    sharesCount,
    achievementsUnlocked,
    streakDays,
    memberSince,
    const DeepCollectionEquality().hash(_activityByDay),
  );

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatsImplCopyWith<_$UserStatsImpl> get copyWith =>
      __$$UserStatsImplCopyWithImpl<_$UserStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatsImplToJson(this);
  }
}

abstract class _UserStats implements UserStats {
  const factory _UserStats({
    final int postsCount,
    final int followersCount,
    final int followingCount,
    final int friendsCount,
    final int likesReceived,
    final int commentsReceived,
    final int sharesCount,
    final int achievementsUnlocked,
    final int streakDays,
    final DateTime? memberSince,
    final Map<String, int> activityByDay,
  }) = _$UserStatsImpl;

  factory _UserStats.fromJson(Map<String, dynamic> json) =
      _$UserStatsImpl.fromJson;

  @override
  int get postsCount;
  @override
  int get followersCount;
  @override
  int get followingCount;
  @override
  int get friendsCount;
  @override
  int get likesReceived;
  @override
  int get commentsReceived;
  @override
  int get sharesCount;
  @override
  int get achievementsUnlocked;
  @override
  int get streakDays;
  @override
  DateTime? get memberSince;
  @override
  Map<String, int> get activityByDay;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatsImplCopyWith<_$UserStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonalizationSettings _$PersonalizationSettingsFromJson(
  Map<String, dynamic> json,
) {
  return _PersonalizationSettings.fromJson(json);
}

/// @nodoc
mixin _$PersonalizationSettings {
  String get userId => throw _privateConstructorUsedError;
  List<String> get interests => throw _privateConstructorUsedError;
  List<String> get followedTopics => throw _privateConstructorUsedError;
  Map<String, double> get contentPreferences =>
      throw _privateConstructorUsedError; // content_type -> weight
  List<String> get mutedWords => throw _privateConstructorUsedError;
  List<String> get mutedTopics => throw _privateConstructorUsedError;
  RecommendationSettings? get recommendations =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get mlFeatures => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this PersonalizationSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonalizationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalizationSettingsCopyWith<PersonalizationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalizationSettingsCopyWith<$Res> {
  factory $PersonalizationSettingsCopyWith(
    PersonalizationSettings value,
    $Res Function(PersonalizationSettings) then,
  ) = _$PersonalizationSettingsCopyWithImpl<$Res, PersonalizationSettings>;
  @useResult
  $Res call({
    String userId,
    List<String> interests,
    List<String> followedTopics,
    Map<String, double> contentPreferences,
    List<String> mutedWords,
    List<String> mutedTopics,
    RecommendationSettings? recommendations,
    Map<String, dynamic> mlFeatures,
    DateTime? lastUpdated,
  });

  $RecommendationSettingsCopyWith<$Res>? get recommendations;
}

/// @nodoc
class _$PersonalizationSettingsCopyWithImpl<
  $Res,
  $Val extends PersonalizationSettings
>
    implements $PersonalizationSettingsCopyWith<$Res> {
  _$PersonalizationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonalizationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? interests = null,
    Object? followedTopics = null,
    Object? contentPreferences = null,
    Object? mutedWords = null,
    Object? mutedTopics = null,
    Object? recommendations = freezed,
    Object? mlFeatures = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            interests: null == interests
                ? _value.interests
                : interests // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            followedTopics: null == followedTopics
                ? _value.followedTopics
                : followedTopics // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            contentPreferences: null == contentPreferences
                ? _value.contentPreferences
                : contentPreferences // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
            mutedWords: null == mutedWords
                ? _value.mutedWords
                : mutedWords // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            mutedTopics: null == mutedTopics
                ? _value.mutedTopics
                : mutedTopics // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            recommendations: freezed == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as RecommendationSettings?,
            mlFeatures: null == mlFeatures
                ? _value.mlFeatures
                : mlFeatures // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            lastUpdated: freezed == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of PersonalizationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecommendationSettingsCopyWith<$Res>? get recommendations {
    if (_value.recommendations == null) {
      return null;
    }

    return $RecommendationSettingsCopyWith<$Res>(_value.recommendations!, (
      value,
    ) {
      return _then(_value.copyWith(recommendations: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PersonalizationSettingsImplCopyWith<$Res>
    implements $PersonalizationSettingsCopyWith<$Res> {
  factory _$$PersonalizationSettingsImplCopyWith(
    _$PersonalizationSettingsImpl value,
    $Res Function(_$PersonalizationSettingsImpl) then,
  ) = __$$PersonalizationSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    List<String> interests,
    List<String> followedTopics,
    Map<String, double> contentPreferences,
    List<String> mutedWords,
    List<String> mutedTopics,
    RecommendationSettings? recommendations,
    Map<String, dynamic> mlFeatures,
    DateTime? lastUpdated,
  });

  @override
  $RecommendationSettingsCopyWith<$Res>? get recommendations;
}

/// @nodoc
class __$$PersonalizationSettingsImplCopyWithImpl<$Res>
    extends
        _$PersonalizationSettingsCopyWithImpl<
          $Res,
          _$PersonalizationSettingsImpl
        >
    implements _$$PersonalizationSettingsImplCopyWith<$Res> {
  __$$PersonalizationSettingsImplCopyWithImpl(
    _$PersonalizationSettingsImpl _value,
    $Res Function(_$PersonalizationSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PersonalizationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? interests = null,
    Object? followedTopics = null,
    Object? contentPreferences = null,
    Object? mutedWords = null,
    Object? mutedTopics = null,
    Object? recommendations = freezed,
    Object? mlFeatures = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(
      _$PersonalizationSettingsImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        interests: null == interests
            ? _value._interests
            : interests // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        followedTopics: null == followedTopics
            ? _value._followedTopics
            : followedTopics // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        contentPreferences: null == contentPreferences
            ? _value._contentPreferences
            : contentPreferences // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        mutedWords: null == mutedWords
            ? _value._mutedWords
            : mutedWords // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        mutedTopics: null == mutedTopics
            ? _value._mutedTopics
            : mutedTopics // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        recommendations: freezed == recommendations
            ? _value.recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as RecommendationSettings?,
        mlFeatures: null == mlFeatures
            ? _value._mlFeatures
            : mlFeatures // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        lastUpdated: freezed == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalizationSettingsImpl implements _PersonalizationSettings {
  const _$PersonalizationSettingsImpl({
    required this.userId,
    final List<String> interests = const [],
    final List<String> followedTopics = const [],
    final Map<String, double> contentPreferences = const {},
    final List<String> mutedWords = const [],
    final List<String> mutedTopics = const [],
    this.recommendations,
    final Map<String, dynamic> mlFeatures = const {},
    this.lastUpdated,
  }) : _interests = interests,
       _followedTopics = followedTopics,
       _contentPreferences = contentPreferences,
       _mutedWords = mutedWords,
       _mutedTopics = mutedTopics,
       _mlFeatures = mlFeatures;

  factory _$PersonalizationSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalizationSettingsImplFromJson(json);

  @override
  final String userId;
  final List<String> _interests;
  @override
  @JsonKey()
  List<String> get interests {
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interests);
  }

  final List<String> _followedTopics;
  @override
  @JsonKey()
  List<String> get followedTopics {
    if (_followedTopics is EqualUnmodifiableListView) return _followedTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followedTopics);
  }

  final Map<String, double> _contentPreferences;
  @override
  @JsonKey()
  Map<String, double> get contentPreferences {
    if (_contentPreferences is EqualUnmodifiableMapView)
      return _contentPreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_contentPreferences);
  }

  // content_type -> weight
  final List<String> _mutedWords;
  // content_type -> weight
  @override
  @JsonKey()
  List<String> get mutedWords {
    if (_mutedWords is EqualUnmodifiableListView) return _mutedWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mutedWords);
  }

  final List<String> _mutedTopics;
  @override
  @JsonKey()
  List<String> get mutedTopics {
    if (_mutedTopics is EqualUnmodifiableListView) return _mutedTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mutedTopics);
  }

  @override
  final RecommendationSettings? recommendations;
  final Map<String, dynamic> _mlFeatures;
  @override
  @JsonKey()
  Map<String, dynamic> get mlFeatures {
    if (_mlFeatures is EqualUnmodifiableMapView) return _mlFeatures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mlFeatures);
  }

  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'PersonalizationSettings(userId: $userId, interests: $interests, followedTopics: $followedTopics, contentPreferences: $contentPreferences, mutedWords: $mutedWords, mutedTopics: $mutedTopics, recommendations: $recommendations, mlFeatures: $mlFeatures, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalizationSettingsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(
              other._interests,
              _interests,
            ) &&
            const DeepCollectionEquality().equals(
              other._followedTopics,
              _followedTopics,
            ) &&
            const DeepCollectionEquality().equals(
              other._contentPreferences,
              _contentPreferences,
            ) &&
            const DeepCollectionEquality().equals(
              other._mutedWords,
              _mutedWords,
            ) &&
            const DeepCollectionEquality().equals(
              other._mutedTopics,
              _mutedTopics,
            ) &&
            (identical(other.recommendations, recommendations) ||
                other.recommendations == recommendations) &&
            const DeepCollectionEquality().equals(
              other._mlFeatures,
              _mlFeatures,
            ) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    const DeepCollectionEquality().hash(_interests),
    const DeepCollectionEquality().hash(_followedTopics),
    const DeepCollectionEquality().hash(_contentPreferences),
    const DeepCollectionEquality().hash(_mutedWords),
    const DeepCollectionEquality().hash(_mutedTopics),
    recommendations,
    const DeepCollectionEquality().hash(_mlFeatures),
    lastUpdated,
  );

  /// Create a copy of PersonalizationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalizationSettingsImplCopyWith<_$PersonalizationSettingsImpl>
  get copyWith =>
      __$$PersonalizationSettingsImplCopyWithImpl<
        _$PersonalizationSettingsImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalizationSettingsImplToJson(this);
  }
}

abstract class _PersonalizationSettings implements PersonalizationSettings {
  const factory _PersonalizationSettings({
    required final String userId,
    final List<String> interests,
    final List<String> followedTopics,
    final Map<String, double> contentPreferences,
    final List<String> mutedWords,
    final List<String> mutedTopics,
    final RecommendationSettings? recommendations,
    final Map<String, dynamic> mlFeatures,
    final DateTime? lastUpdated,
  }) = _$PersonalizationSettingsImpl;

  factory _PersonalizationSettings.fromJson(Map<String, dynamic> json) =
      _$PersonalizationSettingsImpl.fromJson;

  @override
  String get userId;
  @override
  List<String> get interests;
  @override
  List<String> get followedTopics;
  @override
  Map<String, double> get contentPreferences; // content_type -> weight
  @override
  List<String> get mutedWords;
  @override
  List<String> get mutedTopics;
  @override
  RecommendationSettings? get recommendations;
  @override
  Map<String, dynamic> get mlFeatures;
  @override
  DateTime? get lastUpdated;

  /// Create a copy of PersonalizationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalizationSettingsImplCopyWith<_$PersonalizationSettingsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RecommendationSettings _$RecommendationSettingsFromJson(
  Map<String, dynamic> json,
) {
  return _RecommendationSettings.fromJson(json);
}

/// @nodoc
mixin _$RecommendationSettings {
  bool get enableRecommendations => throw _privateConstructorUsedError;
  String get algorithm =>
      throw _privateConstructorUsedError; // balanced, explore, exploit
  double get diversityFactor => throw _privateConstructorUsedError;
  double get relevanceThreshold => throw _privateConstructorUsedError;
  List<String> get excludeCategories => throw _privateConstructorUsedError;
  int get batchSize => throw _privateConstructorUsedError;

  /// Serializes this RecommendationSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecommendationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendationSettingsCopyWith<RecommendationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationSettingsCopyWith<$Res> {
  factory $RecommendationSettingsCopyWith(
    RecommendationSettings value,
    $Res Function(RecommendationSettings) then,
  ) = _$RecommendationSettingsCopyWithImpl<$Res, RecommendationSettings>;
  @useResult
  $Res call({
    bool enableRecommendations,
    String algorithm,
    double diversityFactor,
    double relevanceThreshold,
    List<String> excludeCategories,
    int batchSize,
  });
}

/// @nodoc
class _$RecommendationSettingsCopyWithImpl<
  $Res,
  $Val extends RecommendationSettings
>
    implements $RecommendationSettingsCopyWith<$Res> {
  _$RecommendationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableRecommendations = null,
    Object? algorithm = null,
    Object? diversityFactor = null,
    Object? relevanceThreshold = null,
    Object? excludeCategories = null,
    Object? batchSize = null,
  }) {
    return _then(
      _value.copyWith(
            enableRecommendations: null == enableRecommendations
                ? _value.enableRecommendations
                : enableRecommendations // ignore: cast_nullable_to_non_nullable
                      as bool,
            algorithm: null == algorithm
                ? _value.algorithm
                : algorithm // ignore: cast_nullable_to_non_nullable
                      as String,
            diversityFactor: null == diversityFactor
                ? _value.diversityFactor
                : diversityFactor // ignore: cast_nullable_to_non_nullable
                      as double,
            relevanceThreshold: null == relevanceThreshold
                ? _value.relevanceThreshold
                : relevanceThreshold // ignore: cast_nullable_to_non_nullable
                      as double,
            excludeCategories: null == excludeCategories
                ? _value.excludeCategories
                : excludeCategories // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            batchSize: null == batchSize
                ? _value.batchSize
                : batchSize // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecommendationSettingsImplCopyWith<$Res>
    implements $RecommendationSettingsCopyWith<$Res> {
  factory _$$RecommendationSettingsImplCopyWith(
    _$RecommendationSettingsImpl value,
    $Res Function(_$RecommendationSettingsImpl) then,
  ) = __$$RecommendationSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enableRecommendations,
    String algorithm,
    double diversityFactor,
    double relevanceThreshold,
    List<String> excludeCategories,
    int batchSize,
  });
}

/// @nodoc
class __$$RecommendationSettingsImplCopyWithImpl<$Res>
    extends
        _$RecommendationSettingsCopyWithImpl<$Res, _$RecommendationSettingsImpl>
    implements _$$RecommendationSettingsImplCopyWith<$Res> {
  __$$RecommendationSettingsImplCopyWithImpl(
    _$RecommendationSettingsImpl _value,
    $Res Function(_$RecommendationSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecommendationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableRecommendations = null,
    Object? algorithm = null,
    Object? diversityFactor = null,
    Object? relevanceThreshold = null,
    Object? excludeCategories = null,
    Object? batchSize = null,
  }) {
    return _then(
      _$RecommendationSettingsImpl(
        enableRecommendations: null == enableRecommendations
            ? _value.enableRecommendations
            : enableRecommendations // ignore: cast_nullable_to_non_nullable
                  as bool,
        algorithm: null == algorithm
            ? _value.algorithm
            : algorithm // ignore: cast_nullable_to_non_nullable
                  as String,
        diversityFactor: null == diversityFactor
            ? _value.diversityFactor
            : diversityFactor // ignore: cast_nullable_to_non_nullable
                  as double,
        relevanceThreshold: null == relevanceThreshold
            ? _value.relevanceThreshold
            : relevanceThreshold // ignore: cast_nullable_to_non_nullable
                  as double,
        excludeCategories: null == excludeCategories
            ? _value._excludeCategories
            : excludeCategories // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        batchSize: null == batchSize
            ? _value.batchSize
            : batchSize // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendationSettingsImpl implements _RecommendationSettings {
  const _$RecommendationSettingsImpl({
    this.enableRecommendations = true,
    this.algorithm = 'balanced',
    this.diversityFactor = 0.5,
    this.relevanceThreshold = 0.7,
    final List<String> excludeCategories = const [],
    this.batchSize = 20,
  }) : _excludeCategories = excludeCategories;

  factory _$RecommendationSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendationSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool enableRecommendations;
  @override
  @JsonKey()
  final String algorithm;
  // balanced, explore, exploit
  @override
  @JsonKey()
  final double diversityFactor;
  @override
  @JsonKey()
  final double relevanceThreshold;
  final List<String> _excludeCategories;
  @override
  @JsonKey()
  List<String> get excludeCategories {
    if (_excludeCategories is EqualUnmodifiableListView)
      return _excludeCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludeCategories);
  }

  @override
  @JsonKey()
  final int batchSize;

  @override
  String toString() {
    return 'RecommendationSettings(enableRecommendations: $enableRecommendations, algorithm: $algorithm, diversityFactor: $diversityFactor, relevanceThreshold: $relevanceThreshold, excludeCategories: $excludeCategories, batchSize: $batchSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendationSettingsImpl &&
            (identical(other.enableRecommendations, enableRecommendations) ||
                other.enableRecommendations == enableRecommendations) &&
            (identical(other.algorithm, algorithm) ||
                other.algorithm == algorithm) &&
            (identical(other.diversityFactor, diversityFactor) ||
                other.diversityFactor == diversityFactor) &&
            (identical(other.relevanceThreshold, relevanceThreshold) ||
                other.relevanceThreshold == relevanceThreshold) &&
            const DeepCollectionEquality().equals(
              other._excludeCategories,
              _excludeCategories,
            ) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    enableRecommendations,
    algorithm,
    diversityFactor,
    relevanceThreshold,
    const DeepCollectionEquality().hash(_excludeCategories),
    batchSize,
  );

  /// Create a copy of RecommendationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendationSettingsImplCopyWith<_$RecommendationSettingsImpl>
  get copyWith =>
      __$$RecommendationSettingsImplCopyWithImpl<_$RecommendationSettingsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendationSettingsImplToJson(this);
  }
}

abstract class _RecommendationSettings implements RecommendationSettings {
  const factory _RecommendationSettings({
    final bool enableRecommendations,
    final String algorithm,
    final double diversityFactor,
    final double relevanceThreshold,
    final List<String> excludeCategories,
    final int batchSize,
  }) = _$RecommendationSettingsImpl;

  factory _RecommendationSettings.fromJson(Map<String, dynamic> json) =
      _$RecommendationSettingsImpl.fromJson;

  @override
  bool get enableRecommendations;
  @override
  String get algorithm; // balanced, explore, exploit
  @override
  double get diversityFactor;
  @override
  double get relevanceThreshold;
  @override
  List<String> get excludeCategories;
  @override
  int get batchSize;

  /// Create a copy of RecommendationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendationSettingsImplCopyWith<_$RecommendationSettingsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SyncStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double progress, String? message) syncing,
    required TResult Function(DateTime syncedAt) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(int pendingOperations) offline,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress, String? message)? syncing,
    TResult? Function(DateTime syncedAt)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(int pendingOperations)? offline,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress, String? message)? syncing,
    TResult Function(DateTime syncedAt)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(int pendingOperations)? offline,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Offline value) offline,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Offline value)? offline,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Offline value)? offline,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncStatusCopyWith<$Res> {
  factory $SyncStatusCopyWith(
    SyncStatus value,
    $Res Function(SyncStatus) then,
  ) = _$SyncStatusCopyWithImpl<$Res, SyncStatus>;
}

/// @nodoc
class _$SyncStatusCopyWithImpl<$Res, $Val extends SyncStatus>
    implements $SyncStatusCopyWith<$Res> {
  _$SyncStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
    _$IdleImpl value,
    $Res Function(_$IdleImpl) then,
  ) = __$$IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$SyncStatusCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
    : super(_value, _then);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IdleImpl implements _Idle {
  const _$IdleImpl();

  @override
  String toString() {
    return 'SyncStatus.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double progress, String? message) syncing,
    required TResult Function(DateTime syncedAt) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(int pendingOperations) offline,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress, String? message)? syncing,
    TResult? Function(DateTime syncedAt)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(int pendingOperations)? offline,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress, String? message)? syncing,
    TResult Function(DateTime syncedAt)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(int pendingOperations)? offline,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Offline value) offline,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Offline value)? offline,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Offline value)? offline,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements SyncStatus {
  const factory _Idle() = _$IdleImpl;
}

/// @nodoc
abstract class _$$SyncingImplCopyWith<$Res> {
  factory _$$SyncingImplCopyWith(
    _$SyncingImpl value,
    $Res Function(_$SyncingImpl) then,
  ) = __$$SyncingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double progress, String? message});
}

/// @nodoc
class __$$SyncingImplCopyWithImpl<$Res>
    extends _$SyncStatusCopyWithImpl<$Res, _$SyncingImpl>
    implements _$$SyncingImplCopyWith<$Res> {
  __$$SyncingImplCopyWithImpl(
    _$SyncingImpl _value,
    $Res Function(_$SyncingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? progress = null, Object? message = freezed}) {
    return _then(
      _$SyncingImpl(
        progress: null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as double,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SyncingImpl implements _Syncing {
  const _$SyncingImpl({required this.progress, this.message});

  @override
  final double progress;
  @override
  final String? message;

  @override
  String toString() {
    return 'SyncStatus.syncing(progress: $progress, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncingImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress, message);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncingImplCopyWith<_$SyncingImpl> get copyWith =>
      __$$SyncingImplCopyWithImpl<_$SyncingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double progress, String? message) syncing,
    required TResult Function(DateTime syncedAt) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(int pendingOperations) offline,
  }) {
    return syncing(progress, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress, String? message)? syncing,
    TResult? Function(DateTime syncedAt)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(int pendingOperations)? offline,
  }) {
    return syncing?.call(progress, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress, String? message)? syncing,
    TResult Function(DateTime syncedAt)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(int pendingOperations)? offline,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing(progress, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Offline value) offline,
  }) {
    return syncing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Offline value)? offline,
  }) {
    return syncing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Offline value)? offline,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing(this);
    }
    return orElse();
  }
}

abstract class _Syncing implements SyncStatus {
  const factory _Syncing({
    required final double progress,
    final String? message,
  }) = _$SyncingImpl;

  double get progress;
  String? get message;

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncingImplCopyWith<_$SyncingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime syncedAt});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$SyncStatusCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? syncedAt = null}) {
    return _then(
      _$SuccessImpl(
        syncedAt: null == syncedAt
            ? _value.syncedAt
            : syncedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.syncedAt});

  @override
  final DateTime syncedAt;

  @override
  String toString() {
    return 'SyncStatus.success(syncedAt: $syncedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.syncedAt, syncedAt) ||
                other.syncedAt == syncedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, syncedAt);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double progress, String? message) syncing,
    required TResult Function(DateTime syncedAt) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(int pendingOperations) offline,
  }) {
    return success(syncedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress, String? message)? syncing,
    TResult? Function(DateTime syncedAt)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(int pendingOperations)? offline,
  }) {
    return success?.call(syncedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress, String? message)? syncing,
    TResult Function(DateTime syncedAt)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(int pendingOperations)? offline,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(syncedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Offline value) offline,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Offline value)? offline,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Offline value)? offline,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements SyncStatus {
  const factory _Success({required final DateTime syncedAt}) = _$SuccessImpl;

  DateTime get syncedAt;

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, Object? error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SyncStatusCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? error = freezed}) {
    return _then(
      _$ErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        error: freezed == error ? _value.error : error,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message, this.error});

  @override
  final String message;
  @override
  final Object? error;

  @override
  String toString() {
    return 'SyncStatus.error(message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(error),
  );

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double progress, String? message) syncing,
    required TResult Function(DateTime syncedAt) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(int pendingOperations) offline,
  }) {
    return error(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress, String? message)? syncing,
    TResult? Function(DateTime syncedAt)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(int pendingOperations)? offline,
  }) {
    return error?.call(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress, String? message)? syncing,
    TResult Function(DateTime syncedAt)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(int pendingOperations)? offline,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Offline value) offline,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Offline value)? offline,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Offline value)? offline,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SyncStatus {
  const factory _Error({required final String message, final Object? error}) =
      _$ErrorImpl;

  String get message;
  Object? get error;

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OfflineImplCopyWith<$Res> {
  factory _$$OfflineImplCopyWith(
    _$OfflineImpl value,
    $Res Function(_$OfflineImpl) then,
  ) = __$$OfflineImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int pendingOperations});
}

/// @nodoc
class __$$OfflineImplCopyWithImpl<$Res>
    extends _$SyncStatusCopyWithImpl<$Res, _$OfflineImpl>
    implements _$$OfflineImplCopyWith<$Res> {
  __$$OfflineImplCopyWithImpl(
    _$OfflineImpl _value,
    $Res Function(_$OfflineImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pendingOperations = null}) {
    return _then(
      _$OfflineImpl(
        pendingOperations: null == pendingOperations
            ? _value.pendingOperations
            : pendingOperations // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$OfflineImpl implements _Offline {
  const _$OfflineImpl({required this.pendingOperations});

  @override
  final int pendingOperations;

  @override
  String toString() {
    return 'SyncStatus.offline(pendingOperations: $pendingOperations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflineImpl &&
            (identical(other.pendingOperations, pendingOperations) ||
                other.pendingOperations == pendingOperations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pendingOperations);

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfflineImplCopyWith<_$OfflineImpl> get copyWith =>
      __$$OfflineImplCopyWithImpl<_$OfflineImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double progress, String? message) syncing,
    required TResult Function(DateTime syncedAt) success,
    required TResult Function(String message, Object? error) error,
    required TResult Function(int pendingOperations) offline,
  }) {
    return offline(pendingOperations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress, String? message)? syncing,
    TResult? Function(DateTime syncedAt)? success,
    TResult? Function(String message, Object? error)? error,
    TResult? Function(int pendingOperations)? offline,
  }) {
    return offline?.call(pendingOperations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress, String? message)? syncing,
    TResult Function(DateTime syncedAt)? success,
    TResult Function(String message, Object? error)? error,
    TResult Function(int pendingOperations)? offline,
    required TResult orElse(),
  }) {
    if (offline != null) {
      return offline(pendingOperations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Offline value) offline,
  }) {
    return offline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Offline value)? offline,
  }) {
    return offline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Offline value)? offline,
    required TResult orElse(),
  }) {
    if (offline != null) {
      return offline(this);
    }
    return orElse();
  }
}

abstract class _Offline implements SyncStatus {
  const factory _Offline({required final int pendingOperations}) =
      _$OfflineImpl;

  int get pendingOperations;

  /// Create a copy of SyncStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfflineImplCopyWith<_$OfflineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

/// @nodoc
mixin _$AppState {
  UserState get userState => throw _privateConstructorUsedError;
  ChatState get chatState => throw _privateConstructorUsedError;
  SocialState get socialState => throw _privateConstructorUsedError;
  NetworkState get networkState => throw _privateConstructorUsedError;
  UIState get uiState => throw _privateConstructorUsedError;
  Map<String, dynamic> get featureFlags => throw _privateConstructorUsedError;
  DateTime? get lastActiveAt => throw _privateConstructorUsedError;

  /// Serializes this AppState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call({
    UserState userState,
    ChatState chatState,
    SocialState socialState,
    NetworkState networkState,
    UIState uiState,
    Map<String, dynamic> featureFlags,
    DateTime? lastActiveAt,
  });

  $UserStateCopyWith<$Res> get userState;
  $ChatStateCopyWith<$Res> get chatState;
  $SocialStateCopyWith<$Res> get socialState;
  $NetworkStateCopyWith<$Res> get networkState;
  $UIStateCopyWith<$Res> get uiState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userState = null,
    Object? chatState = null,
    Object? socialState = null,
    Object? networkState = null,
    Object? uiState = null,
    Object? featureFlags = null,
    Object? lastActiveAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            userState: null == userState
                ? _value.userState
                : userState // ignore: cast_nullable_to_non_nullable
                      as UserState,
            chatState: null == chatState
                ? _value.chatState
                : chatState // ignore: cast_nullable_to_non_nullable
                      as ChatState,
            socialState: null == socialState
                ? _value.socialState
                : socialState // ignore: cast_nullable_to_non_nullable
                      as SocialState,
            networkState: null == networkState
                ? _value.networkState
                : networkState // ignore: cast_nullable_to_non_nullable
                      as NetworkState,
            uiState: null == uiState
                ? _value.uiState
                : uiState // ignore: cast_nullable_to_non_nullable
                      as UIState,
            featureFlags: null == featureFlags
                ? _value.featureFlags
                : featureFlags // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            lastActiveAt: freezed == lastActiveAt
                ? _value.lastActiveAt
                : lastActiveAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStateCopyWith<$Res> get userState {
    return $UserStateCopyWith<$Res>(_value.userState, (value) {
      return _then(_value.copyWith(userState: value) as $Val);
    });
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatStateCopyWith<$Res> get chatState {
    return $ChatStateCopyWith<$Res>(_value.chatState, (value) {
      return _then(_value.copyWith(chatState: value) as $Val);
    });
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SocialStateCopyWith<$Res> get socialState {
    return $SocialStateCopyWith<$Res>(_value.socialState, (value) {
      return _then(_value.copyWith(socialState: value) as $Val);
    });
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NetworkStateCopyWith<$Res> get networkState {
    return $NetworkStateCopyWith<$Res>(_value.networkState, (value) {
      return _then(_value.copyWith(networkState: value) as $Val);
    });
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UIStateCopyWith<$Res> get uiState {
    return $UIStateCopyWith<$Res>(_value.uiState, (value) {
      return _then(_value.copyWith(uiState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
    _$AppStateImpl value,
    $Res Function(_$AppStateImpl) then,
  ) = __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserState userState,
    ChatState chatState,
    SocialState socialState,
    NetworkState networkState,
    UIState uiState,
    Map<String, dynamic> featureFlags,
    DateTime? lastActiveAt,
  });

  @override
  $UserStateCopyWith<$Res> get userState;
  @override
  $ChatStateCopyWith<$Res> get chatState;
  @override
  $SocialStateCopyWith<$Res> get socialState;
  @override
  $NetworkStateCopyWith<$Res> get networkState;
  @override
  $UIStateCopyWith<$Res> get uiState;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
    _$AppStateImpl _value,
    $Res Function(_$AppStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userState = null,
    Object? chatState = null,
    Object? socialState = null,
    Object? networkState = null,
    Object? uiState = null,
    Object? featureFlags = null,
    Object? lastActiveAt = freezed,
  }) {
    return _then(
      _$AppStateImpl(
        userState: null == userState
            ? _value.userState
            : userState // ignore: cast_nullable_to_non_nullable
                  as UserState,
        chatState: null == chatState
            ? _value.chatState
            : chatState // ignore: cast_nullable_to_non_nullable
                  as ChatState,
        socialState: null == socialState
            ? _value.socialState
            : socialState // ignore: cast_nullable_to_non_nullable
                  as SocialState,
        networkState: null == networkState
            ? _value.networkState
            : networkState // ignore: cast_nullable_to_non_nullable
                  as NetworkState,
        uiState: null == uiState
            ? _value.uiState
            : uiState // ignore: cast_nullable_to_non_nullable
                  as UIState,
        featureFlags: null == featureFlags
            ? _value._featureFlags
            : featureFlags // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        lastActiveAt: freezed == lastActiveAt
            ? _value.lastActiveAt
            : lastActiveAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppStateImpl implements _AppState {
  const _$AppStateImpl({
    required this.userState,
    required this.chatState,
    required this.socialState,
    required this.networkState,
    required this.uiState,
    final Map<String, dynamic> featureFlags = const {},
    this.lastActiveAt,
  }) : _featureFlags = featureFlags;

  factory _$AppStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppStateImplFromJson(json);

  @override
  final UserState userState;
  @override
  final ChatState chatState;
  @override
  final SocialState socialState;
  @override
  final NetworkState networkState;
  @override
  final UIState uiState;
  final Map<String, dynamic> _featureFlags;
  @override
  @JsonKey()
  Map<String, dynamic> get featureFlags {
    if (_featureFlags is EqualUnmodifiableMapView) return _featureFlags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_featureFlags);
  }

  @override
  final DateTime? lastActiveAt;

  @override
  String toString() {
    return 'AppState(userState: $userState, chatState: $chatState, socialState: $socialState, networkState: $networkState, uiState: $uiState, featureFlags: $featureFlags, lastActiveAt: $lastActiveAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.userState, userState) ||
                other.userState == userState) &&
            (identical(other.chatState, chatState) ||
                other.chatState == chatState) &&
            (identical(other.socialState, socialState) ||
                other.socialState == socialState) &&
            (identical(other.networkState, networkState) ||
                other.networkState == networkState) &&
            (identical(other.uiState, uiState) || other.uiState == uiState) &&
            const DeepCollectionEquality().equals(
              other._featureFlags,
              _featureFlags,
            ) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userState,
    chatState,
    socialState,
    networkState,
    uiState,
    const DeepCollectionEquality().hash(_featureFlags),
    lastActiveAt,
  );

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppStateImplToJson(this);
  }
}

abstract class _AppState implements AppState {
  const factory _AppState({
    required final UserState userState,
    required final ChatState chatState,
    required final SocialState socialState,
    required final NetworkState networkState,
    required final UIState uiState,
    final Map<String, dynamic> featureFlags,
    final DateTime? lastActiveAt,
  }) = _$AppStateImpl;

  factory _AppState.fromJson(Map<String, dynamic> json) =
      _$AppStateImpl.fromJson;

  @override
  UserState get userState;
  @override
  ChatState get chatState;
  @override
  SocialState get socialState;
  @override
  NetworkState get networkState;
  @override
  UIState get uiState;
  @override
  Map<String, dynamic> get featureFlags;
  @override
  DateTime? get lastActiveAt;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatState _$ChatStateFromJson(Map<String, dynamic> json) {
  return _ChatState.fromJson(json);
}

/// @nodoc
mixin _$ChatState {
  List<ChatRoom> get rooms => throw _privateConstructorUsedError;
  Map<String, List<ChatMessage>> get messages =>
      throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;
  String? get activeRoomId => throw _privateConstructorUsedError;
  Map<String, TypingIndicator> get typingIndicators =>
      throw _privateConstructorUsedError;

  /// Serializes this ChatState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call({
    List<ChatRoom> rooms,
    Map<String, List<ChatMessage>> messages,
    int unreadCount,
    String? activeRoomId,
    Map<String, TypingIndicator> typingIndicators,
  });
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
    Object? messages = null,
    Object? unreadCount = null,
    Object? activeRoomId = freezed,
    Object? typingIndicators = null,
  }) {
    return _then(
      _value.copyWith(
            rooms: null == rooms
                ? _value.rooms
                : rooms // ignore: cast_nullable_to_non_nullable
                      as List<ChatRoom>,
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as Map<String, List<ChatMessage>>,
            unreadCount: null == unreadCount
                ? _value.unreadCount
                : unreadCount // ignore: cast_nullable_to_non_nullable
                      as int,
            activeRoomId: freezed == activeRoomId
                ? _value.activeRoomId
                : activeRoomId // ignore: cast_nullable_to_non_nullable
                      as String?,
            typingIndicators: null == typingIndicators
                ? _value.typingIndicators
                : typingIndicators // ignore: cast_nullable_to_non_nullable
                      as Map<String, TypingIndicator>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
    _$ChatStateImpl value,
    $Res Function(_$ChatStateImpl) then,
  ) = __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<ChatRoom> rooms,
    Map<String, List<ChatMessage>> messages,
    int unreadCount,
    String? activeRoomId,
    Map<String, TypingIndicator> typingIndicators,
  });
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
    _$ChatStateImpl _value,
    $Res Function(_$ChatStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
    Object? messages = null,
    Object? unreadCount = null,
    Object? activeRoomId = freezed,
    Object? typingIndicators = null,
  }) {
    return _then(
      _$ChatStateImpl(
        rooms: null == rooms
            ? _value._rooms
            : rooms // ignore: cast_nullable_to_non_nullable
                  as List<ChatRoom>,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as Map<String, List<ChatMessage>>,
        unreadCount: null == unreadCount
            ? _value.unreadCount
            : unreadCount // ignore: cast_nullable_to_non_nullable
                  as int,
        activeRoomId: freezed == activeRoomId
            ? _value.activeRoomId
            : activeRoomId // ignore: cast_nullable_to_non_nullable
                  as String?,
        typingIndicators: null == typingIndicators
            ? _value._typingIndicators
            : typingIndicators // ignore: cast_nullable_to_non_nullable
                  as Map<String, TypingIndicator>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatStateImpl implements _ChatState {
  const _$ChatStateImpl({
    final List<ChatRoom> rooms = const [],
    final Map<String, List<ChatMessage>> messages = const {},
    this.unreadCount = 0,
    this.activeRoomId,
    final Map<String, TypingIndicator> typingIndicators = const {},
  }) : _rooms = rooms,
       _messages = messages,
       _typingIndicators = typingIndicators;

  factory _$ChatStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatStateImplFromJson(json);

  final List<ChatRoom> _rooms;
  @override
  @JsonKey()
  List<ChatRoom> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  final Map<String, List<ChatMessage>> _messages;
  @override
  @JsonKey()
  Map<String, List<ChatMessage>> get messages {
    if (_messages is EqualUnmodifiableMapView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_messages);
  }

  @override
  @JsonKey()
  final int unreadCount;
  @override
  final String? activeRoomId;
  final Map<String, TypingIndicator> _typingIndicators;
  @override
  @JsonKey()
  Map<String, TypingIndicator> get typingIndicators {
    if (_typingIndicators is EqualUnmodifiableMapView) return _typingIndicators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_typingIndicators);
  }

  @override
  String toString() {
    return 'ChatState(rooms: $rooms, messages: $messages, unreadCount: $unreadCount, activeRoomId: $activeRoomId, typingIndicators: $typingIndicators)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            const DeepCollectionEquality().equals(other._rooms, _rooms) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.activeRoomId, activeRoomId) ||
                other.activeRoomId == activeRoomId) &&
            const DeepCollectionEquality().equals(
              other._typingIndicators,
              _typingIndicators,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_rooms),
    const DeepCollectionEquality().hash(_messages),
    unreadCount,
    activeRoomId,
    const DeepCollectionEquality().hash(_typingIndicators),
  );

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatStateImplToJson(this);
  }
}

abstract class _ChatState implements ChatState {
  const factory _ChatState({
    final List<ChatRoom> rooms,
    final Map<String, List<ChatMessage>> messages,
    final int unreadCount,
    final String? activeRoomId,
    final Map<String, TypingIndicator> typingIndicators,
  }) = _$ChatStateImpl;

  factory _ChatState.fromJson(Map<String, dynamic> json) =
      _$ChatStateImpl.fromJson;

  @override
  List<ChatRoom> get rooms;
  @override
  Map<String, List<ChatMessage>> get messages;
  @override
  int get unreadCount;
  @override
  String? get activeRoomId;
  @override
  Map<String, TypingIndicator> get typingIndicators;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SocialState _$SocialStateFromJson(Map<String, dynamic> json) {
  return _SocialState.fromJson(json);
}

/// @nodoc
mixin _$SocialState {
  List<Post> get feedPosts => throw _privateConstructorUsedError;
  List<Post> get userPosts => throw _privateConstructorUsedError;
  Map<String, bool> get likedPosts => throw _privateConstructorUsedError;
  Map<String, bool> get savedPosts => throw _privateConstructorUsedError;
  FeedFilter? get activeFilter => throw _privateConstructorUsedError;
  bool get isRefreshing => throw _privateConstructorUsedError;
  String? get nextPageToken => throw _privateConstructorUsedError;

  /// Serializes this SocialState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialStateCopyWith<SocialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialStateCopyWith<$Res> {
  factory $SocialStateCopyWith(
    SocialState value,
    $Res Function(SocialState) then,
  ) = _$SocialStateCopyWithImpl<$Res, SocialState>;
  @useResult
  $Res call({
    List<Post> feedPosts,
    List<Post> userPosts,
    Map<String, bool> likedPosts,
    Map<String, bool> savedPosts,
    FeedFilter? activeFilter,
    bool isRefreshing,
    String? nextPageToken,
  });

  $FeedFilterCopyWith<$Res>? get activeFilter;
}

/// @nodoc
class _$SocialStateCopyWithImpl<$Res, $Val extends SocialState>
    implements $SocialStateCopyWith<$Res> {
  _$SocialStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedPosts = null,
    Object? userPosts = null,
    Object? likedPosts = null,
    Object? savedPosts = null,
    Object? activeFilter = freezed,
    Object? isRefreshing = null,
    Object? nextPageToken = freezed,
  }) {
    return _then(
      _value.copyWith(
            feedPosts: null == feedPosts
                ? _value.feedPosts
                : feedPosts // ignore: cast_nullable_to_non_nullable
                      as List<Post>,
            userPosts: null == userPosts
                ? _value.userPosts
                : userPosts // ignore: cast_nullable_to_non_nullable
                      as List<Post>,
            likedPosts: null == likedPosts
                ? _value.likedPosts
                : likedPosts // ignore: cast_nullable_to_non_nullable
                      as Map<String, bool>,
            savedPosts: null == savedPosts
                ? _value.savedPosts
                : savedPosts // ignore: cast_nullable_to_non_nullable
                      as Map<String, bool>,
            activeFilter: freezed == activeFilter
                ? _value.activeFilter
                : activeFilter // ignore: cast_nullable_to_non_nullable
                      as FeedFilter?,
            isRefreshing: null == isRefreshing
                ? _value.isRefreshing
                : isRefreshing // ignore: cast_nullable_to_non_nullable
                      as bool,
            nextPageToken: freezed == nextPageToken
                ? _value.nextPageToken
                : nextPageToken // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeedFilterCopyWith<$Res>? get activeFilter {
    if (_value.activeFilter == null) {
      return null;
    }

    return $FeedFilterCopyWith<$Res>(_value.activeFilter!, (value) {
      return _then(_value.copyWith(activeFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SocialStateImplCopyWith<$Res>
    implements $SocialStateCopyWith<$Res> {
  factory _$$SocialStateImplCopyWith(
    _$SocialStateImpl value,
    $Res Function(_$SocialStateImpl) then,
  ) = __$$SocialStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Post> feedPosts,
    List<Post> userPosts,
    Map<String, bool> likedPosts,
    Map<String, bool> savedPosts,
    FeedFilter? activeFilter,
    bool isRefreshing,
    String? nextPageToken,
  });

  @override
  $FeedFilterCopyWith<$Res>? get activeFilter;
}

/// @nodoc
class __$$SocialStateImplCopyWithImpl<$Res>
    extends _$SocialStateCopyWithImpl<$Res, _$SocialStateImpl>
    implements _$$SocialStateImplCopyWith<$Res> {
  __$$SocialStateImplCopyWithImpl(
    _$SocialStateImpl _value,
    $Res Function(_$SocialStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedPosts = null,
    Object? userPosts = null,
    Object? likedPosts = null,
    Object? savedPosts = null,
    Object? activeFilter = freezed,
    Object? isRefreshing = null,
    Object? nextPageToken = freezed,
  }) {
    return _then(
      _$SocialStateImpl(
        feedPosts: null == feedPosts
            ? _value._feedPosts
            : feedPosts // ignore: cast_nullable_to_non_nullable
                  as List<Post>,
        userPosts: null == userPosts
            ? _value._userPosts
            : userPosts // ignore: cast_nullable_to_non_nullable
                  as List<Post>,
        likedPosts: null == likedPosts
            ? _value._likedPosts
            : likedPosts // ignore: cast_nullable_to_non_nullable
                  as Map<String, bool>,
        savedPosts: null == savedPosts
            ? _value._savedPosts
            : savedPosts // ignore: cast_nullable_to_non_nullable
                  as Map<String, bool>,
        activeFilter: freezed == activeFilter
            ? _value.activeFilter
            : activeFilter // ignore: cast_nullable_to_non_nullable
                  as FeedFilter?,
        isRefreshing: null == isRefreshing
            ? _value.isRefreshing
            : isRefreshing // ignore: cast_nullable_to_non_nullable
                  as bool,
        nextPageToken: freezed == nextPageToken
            ? _value.nextPageToken
            : nextPageToken // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialStateImpl implements _SocialState {
  const _$SocialStateImpl({
    final List<Post> feedPosts = const [],
    final List<Post> userPosts = const [],
    final Map<String, bool> likedPosts = const {},
    final Map<String, bool> savedPosts = const {},
    this.activeFilter,
    this.isRefreshing = false,
    this.nextPageToken,
  }) : _feedPosts = feedPosts,
       _userPosts = userPosts,
       _likedPosts = likedPosts,
       _savedPosts = savedPosts;

  factory _$SocialStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialStateImplFromJson(json);

  final List<Post> _feedPosts;
  @override
  @JsonKey()
  List<Post> get feedPosts {
    if (_feedPosts is EqualUnmodifiableListView) return _feedPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feedPosts);
  }

  final List<Post> _userPosts;
  @override
  @JsonKey()
  List<Post> get userPosts {
    if (_userPosts is EqualUnmodifiableListView) return _userPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userPosts);
  }

  final Map<String, bool> _likedPosts;
  @override
  @JsonKey()
  Map<String, bool> get likedPosts {
    if (_likedPosts is EqualUnmodifiableMapView) return _likedPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_likedPosts);
  }

  final Map<String, bool> _savedPosts;
  @override
  @JsonKey()
  Map<String, bool> get savedPosts {
    if (_savedPosts is EqualUnmodifiableMapView) return _savedPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_savedPosts);
  }

  @override
  final FeedFilter? activeFilter;
  @override
  @JsonKey()
  final bool isRefreshing;
  @override
  final String? nextPageToken;

  @override
  String toString() {
    return 'SocialState(feedPosts: $feedPosts, userPosts: $userPosts, likedPosts: $likedPosts, savedPosts: $savedPosts, activeFilter: $activeFilter, isRefreshing: $isRefreshing, nextPageToken: $nextPageToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialStateImpl &&
            const DeepCollectionEquality().equals(
              other._feedPosts,
              _feedPosts,
            ) &&
            const DeepCollectionEquality().equals(
              other._userPosts,
              _userPosts,
            ) &&
            const DeepCollectionEquality().equals(
              other._likedPosts,
              _likedPosts,
            ) &&
            const DeepCollectionEquality().equals(
              other._savedPosts,
              _savedPosts,
            ) &&
            (identical(other.activeFilter, activeFilter) ||
                other.activeFilter == activeFilter) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.nextPageToken, nextPageToken) ||
                other.nextPageToken == nextPageToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_feedPosts),
    const DeepCollectionEquality().hash(_userPosts),
    const DeepCollectionEquality().hash(_likedPosts),
    const DeepCollectionEquality().hash(_savedPosts),
    activeFilter,
    isRefreshing,
    nextPageToken,
  );

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialStateImplCopyWith<_$SocialStateImpl> get copyWith =>
      __$$SocialStateImplCopyWithImpl<_$SocialStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialStateImplToJson(this);
  }
}

abstract class _SocialState implements SocialState {
  const factory _SocialState({
    final List<Post> feedPosts,
    final List<Post> userPosts,
    final Map<String, bool> likedPosts,
    final Map<String, bool> savedPosts,
    final FeedFilter? activeFilter,
    final bool isRefreshing,
    final String? nextPageToken,
  }) = _$SocialStateImpl;

  factory _SocialState.fromJson(Map<String, dynamic> json) =
      _$SocialStateImpl.fromJson;

  @override
  List<Post> get feedPosts;
  @override
  List<Post> get userPosts;
  @override
  Map<String, bool> get likedPosts;
  @override
  Map<String, bool> get savedPosts;
  @override
  FeedFilter? get activeFilter;
  @override
  bool get isRefreshing;
  @override
  String? get nextPageToken;

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialStateImplCopyWith<_$SocialStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NetworkState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connected,
    required TResult Function() disconnected,
    required TResult Function() connecting,
    required TResult Function(int latencyMs) slow,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connected,
    TResult? Function()? disconnected,
    TResult? Function()? connecting,
    TResult? Function(int latencyMs)? slow,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connected,
    TResult Function()? disconnected,
    TResult Function()? connecting,
    TResult Function(int latencyMs)? slow,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Slow value) slow,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Slow value)? slow,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Slow value)? slow,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkStateCopyWith<$Res> {
  factory $NetworkStateCopyWith(
    NetworkState value,
    $Res Function(NetworkState) then,
  ) = _$NetworkStateCopyWithImpl<$Res, NetworkState>;
}

/// @nodoc
class _$NetworkStateCopyWithImpl<$Res, $Val extends NetworkState>
    implements $NetworkStateCopyWith<$Res> {
  _$NetworkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConnectedImplCopyWith<$Res> {
  factory _$$ConnectedImplCopyWith(
    _$ConnectedImpl value,
    $Res Function(_$ConnectedImpl) then,
  ) = __$$ConnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectedImplCopyWithImpl<$Res>
    extends _$NetworkStateCopyWithImpl<$Res, _$ConnectedImpl>
    implements _$$ConnectedImplCopyWith<$Res> {
  __$$ConnectedImplCopyWithImpl(
    _$ConnectedImpl _value,
    $Res Function(_$ConnectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NetworkState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectedImpl implements _Connected {
  const _$ConnectedImpl();

  @override
  String toString() {
    return 'NetworkState.connected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connected,
    required TResult Function() disconnected,
    required TResult Function() connecting,
    required TResult Function(int latencyMs) slow,
  }) {
    return connected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connected,
    TResult? Function()? disconnected,
    TResult? Function()? connecting,
    TResult? Function(int latencyMs)? slow,
  }) {
    return connected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connected,
    TResult Function()? disconnected,
    TResult Function()? connecting,
    TResult Function(int latencyMs)? slow,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Slow value) slow,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Slow value)? slow,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Slow value)? slow,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _Connected implements NetworkState {
  const factory _Connected() = _$ConnectedImpl;
}

/// @nodoc
abstract class _$$DisconnectedImplCopyWith<$Res> {
  factory _$$DisconnectedImplCopyWith(
    _$DisconnectedImpl value,
    $Res Function(_$DisconnectedImpl) then,
  ) = __$$DisconnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisconnectedImplCopyWithImpl<$Res>
    extends _$NetworkStateCopyWithImpl<$Res, _$DisconnectedImpl>
    implements _$$DisconnectedImplCopyWith<$Res> {
  __$$DisconnectedImplCopyWithImpl(
    _$DisconnectedImpl _value,
    $Res Function(_$DisconnectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NetworkState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DisconnectedImpl implements _Disconnected {
  const _$DisconnectedImpl();

  @override
  String toString() {
    return 'NetworkState.disconnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisconnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connected,
    required TResult Function() disconnected,
    required TResult Function() connecting,
    required TResult Function(int latencyMs) slow,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connected,
    TResult? Function()? disconnected,
    TResult? Function()? connecting,
    TResult? Function(int latencyMs)? slow,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connected,
    TResult Function()? disconnected,
    TResult Function()? connecting,
    TResult Function(int latencyMs)? slow,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Slow value) slow,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Slow value)? slow,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Slow value)? slow,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class _Disconnected implements NetworkState {
  const factory _Disconnected() = _$DisconnectedImpl;
}

/// @nodoc
abstract class _$$ConnectingImplCopyWith<$Res> {
  factory _$$ConnectingImplCopyWith(
    _$ConnectingImpl value,
    $Res Function(_$ConnectingImpl) then,
  ) = __$$ConnectingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectingImplCopyWithImpl<$Res>
    extends _$NetworkStateCopyWithImpl<$Res, _$ConnectingImpl>
    implements _$$ConnectingImplCopyWith<$Res> {
  __$$ConnectingImplCopyWithImpl(
    _$ConnectingImpl _value,
    $Res Function(_$ConnectingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NetworkState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectingImpl implements _Connecting {
  const _$ConnectingImpl();

  @override
  String toString() {
    return 'NetworkState.connecting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connected,
    required TResult Function() disconnected,
    required TResult Function() connecting,
    required TResult Function(int latencyMs) slow,
  }) {
    return connecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connected,
    TResult? Function()? disconnected,
    TResult? Function()? connecting,
    TResult? Function(int latencyMs)? slow,
  }) {
    return connecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connected,
    TResult Function()? disconnected,
    TResult Function()? connecting,
    TResult Function(int latencyMs)? slow,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Slow value) slow,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Slow value)? slow,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Slow value)? slow,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class _Connecting implements NetworkState {
  const factory _Connecting() = _$ConnectingImpl;
}

/// @nodoc
abstract class _$$SlowImplCopyWith<$Res> {
  factory _$$SlowImplCopyWith(
    _$SlowImpl value,
    $Res Function(_$SlowImpl) then,
  ) = __$$SlowImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int latencyMs});
}

/// @nodoc
class __$$SlowImplCopyWithImpl<$Res>
    extends _$NetworkStateCopyWithImpl<$Res, _$SlowImpl>
    implements _$$SlowImplCopyWith<$Res> {
  __$$SlowImplCopyWithImpl(_$SlowImpl _value, $Res Function(_$SlowImpl) _then)
    : super(_value, _then);

  /// Create a copy of NetworkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? latencyMs = null}) {
    return _then(
      _$SlowImpl(
        latencyMs: null == latencyMs
            ? _value.latencyMs
            : latencyMs // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$SlowImpl implements _Slow {
  const _$SlowImpl({required this.latencyMs});

  @override
  final int latencyMs;

  @override
  String toString() {
    return 'NetworkState.slow(latencyMs: $latencyMs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SlowImpl &&
            (identical(other.latencyMs, latencyMs) ||
                other.latencyMs == latencyMs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latencyMs);

  /// Create a copy of NetworkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SlowImplCopyWith<_$SlowImpl> get copyWith =>
      __$$SlowImplCopyWithImpl<_$SlowImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connected,
    required TResult Function() disconnected,
    required TResult Function() connecting,
    required TResult Function(int latencyMs) slow,
  }) {
    return slow(latencyMs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? connected,
    TResult? Function()? disconnected,
    TResult? Function()? connecting,
    TResult? Function(int latencyMs)? slow,
  }) {
    return slow?.call(latencyMs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connected,
    TResult Function()? disconnected,
    TResult Function()? connecting,
    TResult Function(int latencyMs)? slow,
    required TResult orElse(),
  }) {
    if (slow != null) {
      return slow(latencyMs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Slow value) slow,
  }) {
    return slow(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Slow value)? slow,
  }) {
    return slow?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Slow value)? slow,
    required TResult orElse(),
  }) {
    if (slow != null) {
      return slow(this);
    }
    return orElse();
  }
}

abstract class _Slow implements NetworkState {
  const factory _Slow({required final int latencyMs}) = _$SlowImpl;

  int get latencyMs;

  /// Create a copy of NetworkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SlowImplCopyWith<_$SlowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UIState _$UIStateFromJson(Map<String, dynamic> json) {
  return _UIState.fromJson(json);
}

/// @nodoc
mixin _$UIState {
  int get bottomNavIndex => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get activeDialog => throw _privateConstructorUsedError;
  List<Toast> get toasts => throw _privateConstructorUsedError;
  Map<String, bool> get expandedSections => throw _privateConstructorUsedError;
  ScrollPosition? get lastScrollPosition => throw _privateConstructorUsedError;

  /// Serializes this UIState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UIState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UIStateCopyWith<UIState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UIStateCopyWith<$Res> {
  factory $UIStateCopyWith(UIState value, $Res Function(UIState) then) =
      _$UIStateCopyWithImpl<$Res, UIState>;
  @useResult
  $Res call({
    int bottomNavIndex,
    bool isLoading,
    String? activeDialog,
    List<Toast> toasts,
    Map<String, bool> expandedSections,
    ScrollPosition? lastScrollPosition,
  });

  $ScrollPositionCopyWith<$Res>? get lastScrollPosition;
}

/// @nodoc
class _$UIStateCopyWithImpl<$Res, $Val extends UIState>
    implements $UIStateCopyWith<$Res> {
  _$UIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UIState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bottomNavIndex = null,
    Object? isLoading = null,
    Object? activeDialog = freezed,
    Object? toasts = null,
    Object? expandedSections = null,
    Object? lastScrollPosition = freezed,
  }) {
    return _then(
      _value.copyWith(
            bottomNavIndex: null == bottomNavIndex
                ? _value.bottomNavIndex
                : bottomNavIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            activeDialog: freezed == activeDialog
                ? _value.activeDialog
                : activeDialog // ignore: cast_nullable_to_non_nullable
                      as String?,
            toasts: null == toasts
                ? _value.toasts
                : toasts // ignore: cast_nullable_to_non_nullable
                      as List<Toast>,
            expandedSections: null == expandedSections
                ? _value.expandedSections
                : expandedSections // ignore: cast_nullable_to_non_nullable
                      as Map<String, bool>,
            lastScrollPosition: freezed == lastScrollPosition
                ? _value.lastScrollPosition
                : lastScrollPosition // ignore: cast_nullable_to_non_nullable
                      as ScrollPosition?,
          )
          as $Val,
    );
  }

  /// Create a copy of UIState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScrollPositionCopyWith<$Res>? get lastScrollPosition {
    if (_value.lastScrollPosition == null) {
      return null;
    }

    return $ScrollPositionCopyWith<$Res>(_value.lastScrollPosition!, (value) {
      return _then(_value.copyWith(lastScrollPosition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UIStateImplCopyWith<$Res> implements $UIStateCopyWith<$Res> {
  factory _$$UIStateImplCopyWith(
    _$UIStateImpl value,
    $Res Function(_$UIStateImpl) then,
  ) = __$$UIStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int bottomNavIndex,
    bool isLoading,
    String? activeDialog,
    List<Toast> toasts,
    Map<String, bool> expandedSections,
    ScrollPosition? lastScrollPosition,
  });

  @override
  $ScrollPositionCopyWith<$Res>? get lastScrollPosition;
}

/// @nodoc
class __$$UIStateImplCopyWithImpl<$Res>
    extends _$UIStateCopyWithImpl<$Res, _$UIStateImpl>
    implements _$$UIStateImplCopyWith<$Res> {
  __$$UIStateImplCopyWithImpl(
    _$UIStateImpl _value,
    $Res Function(_$UIStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UIState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bottomNavIndex = null,
    Object? isLoading = null,
    Object? activeDialog = freezed,
    Object? toasts = null,
    Object? expandedSections = null,
    Object? lastScrollPosition = freezed,
  }) {
    return _then(
      _$UIStateImpl(
        bottomNavIndex: null == bottomNavIndex
            ? _value.bottomNavIndex
            : bottomNavIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        activeDialog: freezed == activeDialog
            ? _value.activeDialog
            : activeDialog // ignore: cast_nullable_to_non_nullable
                  as String?,
        toasts: null == toasts
            ? _value._toasts
            : toasts // ignore: cast_nullable_to_non_nullable
                  as List<Toast>,
        expandedSections: null == expandedSections
            ? _value._expandedSections
            : expandedSections // ignore: cast_nullable_to_non_nullable
                  as Map<String, bool>,
        lastScrollPosition: freezed == lastScrollPosition
            ? _value.lastScrollPosition
            : lastScrollPosition // ignore: cast_nullable_to_non_nullable
                  as ScrollPosition?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UIStateImpl implements _UIState {
  const _$UIStateImpl({
    this.bottomNavIndex = 0,
    this.isLoading = false,
    this.activeDialog,
    final List<Toast> toasts = const [],
    final Map<String, bool> expandedSections = const {},
    this.lastScrollPosition,
  }) : _toasts = toasts,
       _expandedSections = expandedSections;

  factory _$UIStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$UIStateImplFromJson(json);

  @override
  @JsonKey()
  final int bottomNavIndex;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? activeDialog;
  final List<Toast> _toasts;
  @override
  @JsonKey()
  List<Toast> get toasts {
    if (_toasts is EqualUnmodifiableListView) return _toasts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toasts);
  }

  final Map<String, bool> _expandedSections;
  @override
  @JsonKey()
  Map<String, bool> get expandedSections {
    if (_expandedSections is EqualUnmodifiableMapView) return _expandedSections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_expandedSections);
  }

  @override
  final ScrollPosition? lastScrollPosition;

  @override
  String toString() {
    return 'UIState(bottomNavIndex: $bottomNavIndex, isLoading: $isLoading, activeDialog: $activeDialog, toasts: $toasts, expandedSections: $expandedSections, lastScrollPosition: $lastScrollPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UIStateImpl &&
            (identical(other.bottomNavIndex, bottomNavIndex) ||
                other.bottomNavIndex == bottomNavIndex) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.activeDialog, activeDialog) ||
                other.activeDialog == activeDialog) &&
            const DeepCollectionEquality().equals(other._toasts, _toasts) &&
            const DeepCollectionEquality().equals(
              other._expandedSections,
              _expandedSections,
            ) &&
            (identical(other.lastScrollPosition, lastScrollPosition) ||
                other.lastScrollPosition == lastScrollPosition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    bottomNavIndex,
    isLoading,
    activeDialog,
    const DeepCollectionEquality().hash(_toasts),
    const DeepCollectionEquality().hash(_expandedSections),
    lastScrollPosition,
  );

  /// Create a copy of UIState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UIStateImplCopyWith<_$UIStateImpl> get copyWith =>
      __$$UIStateImplCopyWithImpl<_$UIStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UIStateImplToJson(this);
  }
}

abstract class _UIState implements UIState {
  const factory _UIState({
    final int bottomNavIndex,
    final bool isLoading,
    final String? activeDialog,
    final List<Toast> toasts,
    final Map<String, bool> expandedSections,
    final ScrollPosition? lastScrollPosition,
  }) = _$UIStateImpl;

  factory _UIState.fromJson(Map<String, dynamic> json) = _$UIStateImpl.fromJson;

  @override
  int get bottomNavIndex;
  @override
  bool get isLoading;
  @override
  String? get activeDialog;
  @override
  List<Toast> get toasts;
  @override
  Map<String, bool> get expandedSections;
  @override
  ScrollPosition? get lastScrollPosition;

  /// Create a copy of UIState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UIStateImplCopyWith<_$UIStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) {
  return _ChatRoom.fromJson(json);
}

/// @nodoc
mixin _$ChatRoom {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  List<String> get participants => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  DateTime? get lastMessageAt => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;
  bool get isPinned => throw _privateConstructorUsedError;
  bool get isMuted => throw _privateConstructorUsedError;

  /// Serializes this ChatRoom to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRoomCopyWith<ChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomCopyWith<$Res> {
  factory $ChatRoomCopyWith(ChatRoom value, $Res Function(ChatRoom) then) =
      _$ChatRoomCopyWithImpl<$Res, ChatRoom>;
  @useResult
  $Res call({
    String id,
    String name,
    String? avatar,
    List<String> participants,
    String? lastMessage,
    DateTime? lastMessageAt,
    int unreadCount,
    bool isPinned,
    bool isMuted,
  });
}

/// @nodoc
class _$ChatRoomCopyWithImpl<$Res, $Val extends ChatRoom>
    implements $ChatRoomCopyWith<$Res> {
  _$ChatRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = freezed,
    Object? participants = null,
    Object? lastMessage = freezed,
    Object? lastMessageAt = freezed,
    Object? unreadCount = null,
    Object? isPinned = null,
    Object? isMuted = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            participants: null == participants
                ? _value.participants
                : participants // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            lastMessage: freezed == lastMessage
                ? _value.lastMessage
                : lastMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastMessageAt: freezed == lastMessageAt
                ? _value.lastMessageAt
                : lastMessageAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            unreadCount: null == unreadCount
                ? _value.unreadCount
                : unreadCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isPinned: null == isPinned
                ? _value.isPinned
                : isPinned // ignore: cast_nullable_to_non_nullable
                      as bool,
            isMuted: null == isMuted
                ? _value.isMuted
                : isMuted // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatRoomImplCopyWith<$Res>
    implements $ChatRoomCopyWith<$Res> {
  factory _$$ChatRoomImplCopyWith(
    _$ChatRoomImpl value,
    $Res Function(_$ChatRoomImpl) then,
  ) = __$$ChatRoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? avatar,
    List<String> participants,
    String? lastMessage,
    DateTime? lastMessageAt,
    int unreadCount,
    bool isPinned,
    bool isMuted,
  });
}

/// @nodoc
class __$$ChatRoomImplCopyWithImpl<$Res>
    extends _$ChatRoomCopyWithImpl<$Res, _$ChatRoomImpl>
    implements _$$ChatRoomImplCopyWith<$Res> {
  __$$ChatRoomImplCopyWithImpl(
    _$ChatRoomImpl _value,
    $Res Function(_$ChatRoomImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = freezed,
    Object? participants = null,
    Object? lastMessage = freezed,
    Object? lastMessageAt = freezed,
    Object? unreadCount = null,
    Object? isPinned = null,
    Object? isMuted = null,
  }) {
    return _then(
      _$ChatRoomImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        participants: null == participants
            ? _value._participants
            : participants // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        lastMessage: freezed == lastMessage
            ? _value.lastMessage
            : lastMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastMessageAt: freezed == lastMessageAt
            ? _value.lastMessageAt
            : lastMessageAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        unreadCount: null == unreadCount
            ? _value.unreadCount
            : unreadCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isPinned: null == isPinned
            ? _value.isPinned
            : isPinned // ignore: cast_nullable_to_non_nullable
                  as bool,
        isMuted: null == isMuted
            ? _value.isMuted
            : isMuted // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomImpl implements _ChatRoom {
  const _$ChatRoomImpl({
    required this.id,
    required this.name,
    this.avatar,
    required final List<String> participants,
    this.lastMessage,
    this.lastMessageAt,
    this.unreadCount = 0,
    this.isPinned = false,
    this.isMuted = false,
  }) : _participants = participants;

  factory _$ChatRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? avatar;
  final List<String> _participants;
  @override
  List<String> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  final String? lastMessage;
  @override
  final DateTime? lastMessageAt;
  @override
  @JsonKey()
  final int unreadCount;
  @override
  @JsonKey()
  final bool isPinned;
  @override
  @JsonKey()
  final bool isMuted;

  @override
  String toString() {
    return 'ChatRoom(id: $id, name: $name, avatar: $avatar, participants: $participants, lastMessage: $lastMessage, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount, isPinned: $isPinned, isMuted: $isMuted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality().equals(
              other._participants,
              _participants,
            ) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageAt, lastMessageAt) ||
                other.lastMessageAt == lastMessageAt) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.isMuted, isMuted) || other.isMuted == isMuted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    avatar,
    const DeepCollectionEquality().hash(_participants),
    lastMessage,
    lastMessageAt,
    unreadCount,
    isPinned,
    isMuted,
  );

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomImplCopyWith<_$ChatRoomImpl> get copyWith =>
      __$$ChatRoomImplCopyWithImpl<_$ChatRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomImplToJson(this);
  }
}

abstract class _ChatRoom implements ChatRoom {
  const factory _ChatRoom({
    required final String id,
    required final String name,
    final String? avatar,
    required final List<String> participants,
    final String? lastMessage,
    final DateTime? lastMessageAt,
    final int unreadCount,
    final bool isPinned,
    final bool isMuted,
  }) = _$ChatRoomImpl;

  factory _ChatRoom.fromJson(Map<String, dynamic> json) =
      _$ChatRoomImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get avatar;
  @override
  List<String> get participants;
  @override
  String? get lastMessage;
  @override
  DateTime? get lastMessageAt;
  @override
  int get unreadCount;
  @override
  bool get isPinned;
  @override
  bool get isMuted;

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoomImplCopyWith<_$ChatRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatMessage {
  String get id => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime? get sentAt => throw _privateConstructorUsedError;
  DateTime? get readAt => throw _privateConstructorUsedError;
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  String? get replyToId => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
    ChatMessage value,
    $Res Function(ChatMessage) then,
  ) = _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call({
    String id,
    String roomId,
    String senderId,
    String content,
    String type,
    DateTime? sentAt,
    DateTime? readAt,
    DateTime? deliveredAt,
    String? replyToId,
    Map<String, dynamic> metadata,
  });
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomId = null,
    Object? senderId = null,
    Object? content = null,
    Object? type = null,
    Object? sentAt = freezed,
    Object? readAt = freezed,
    Object? deliveredAt = freezed,
    Object? replyToId = freezed,
    Object? metadata = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            roomId: null == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as String,
            senderId: null == senderId
                ? _value.senderId
                : senderId // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            sentAt: freezed == sentAt
                ? _value.sentAt
                : sentAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            readAt: freezed == readAt
                ? _value.readAt
                : readAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            deliveredAt: freezed == deliveredAt
                ? _value.deliveredAt
                : deliveredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            replyToId: freezed == replyToId
                ? _value.replyToId
                : replyToId // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatMessageImplCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$ChatMessageImplCopyWith(
    _$ChatMessageImpl value,
    $Res Function(_$ChatMessageImpl) then,
  ) = __$$ChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String roomId,
    String senderId,
    String content,
    String type,
    DateTime? sentAt,
    DateTime? readAt,
    DateTime? deliveredAt,
    String? replyToId,
    Map<String, dynamic> metadata,
  });
}

/// @nodoc
class __$$ChatMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$ChatMessageImpl>
    implements _$$ChatMessageImplCopyWith<$Res> {
  __$$ChatMessageImplCopyWithImpl(
    _$ChatMessageImpl _value,
    $Res Function(_$ChatMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomId = null,
    Object? senderId = null,
    Object? content = null,
    Object? type = null,
    Object? sentAt = freezed,
    Object? readAt = freezed,
    Object? deliveredAt = freezed,
    Object? replyToId = freezed,
    Object? metadata = null,
  }) {
    return _then(
      _$ChatMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        sentAt: freezed == sentAt
            ? _value.sentAt
            : sentAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        readAt: freezed == readAt
            ? _value.readAt
            : readAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        deliveredAt: freezed == deliveredAt
            ? _value.deliveredAt
            : deliveredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        replyToId: freezed == replyToId
            ? _value.replyToId
            : replyToId // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadata: null == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageImpl implements _ChatMessage {
  const _$ChatMessageImpl({
    required this.id,
    required this.roomId,
    required this.senderId,
    required this.content,
    this.type = 'text',
    this.sentAt,
    this.readAt,
    this.deliveredAt,
    this.replyToId,
    final Map<String, dynamic> metadata = const {},
  }) : _metadata = metadata;

  factory _$ChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String roomId;
  @override
  final String senderId;
  @override
  final String content;
  @override
  @JsonKey()
  final String type;
  @override
  final DateTime? sentAt;
  @override
  final DateTime? readAt;
  @override
  final DateTime? deliveredAt;
  @override
  final String? replyToId;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'ChatMessage(id: $id, roomId: $roomId, senderId: $senderId, content: $content, type: $type, sentAt: $sentAt, readAt: $readAt, deliveredAt: $deliveredAt, replyToId: $replyToId, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.replyToId, replyToId) ||
                other.replyToId == replyToId) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    roomId,
    senderId,
    content,
    type,
    sentAt,
    readAt,
    deliveredAt,
    replyToId,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      __$$ChatMessageImplCopyWithImpl<_$ChatMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageImplToJson(this);
  }
}

abstract class _ChatMessage implements ChatMessage {
  const factory _ChatMessage({
    required final String id,
    required final String roomId,
    required final String senderId,
    required final String content,
    final String type,
    final DateTime? sentAt,
    final DateTime? readAt,
    final DateTime? deliveredAt,
    final String? replyToId,
    final Map<String, dynamic> metadata,
  }) = _$ChatMessageImpl;

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$ChatMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get roomId;
  @override
  String get senderId;
  @override
  String get content;
  @override
  String get type;
  @override
  DateTime? get sentAt;
  @override
  DateTime? get readAt;
  @override
  DateTime? get deliveredAt;
  @override
  String? get replyToId;
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  String? get authorAvatar => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<String> get mediaUrls => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  int get shareCount => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call({
    String id,
    String authorId,
    String authorName,
    String? authorAvatar,
    String content,
    List<String> mediaUrls,
    String type,
    int likeCount,
    int commentCount,
    int shareCount,
    bool isLiked,
    bool isSaved,
    DateTime? createdAt,
    Map<String, dynamic> metadata,
  });
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? authorAvatar = freezed,
    Object? content = null,
    Object? mediaUrls = null,
    Object? type = null,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? shareCount = null,
    Object? isLiked = null,
    Object? isSaved = null,
    Object? createdAt = freezed,
    Object? metadata = null,
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
            mediaUrls: null == mediaUrls
                ? _value.mediaUrls
                : mediaUrls // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            likeCount: null == likeCount
                ? _value.likeCount
                : likeCount // ignore: cast_nullable_to_non_nullable
                      as int,
            commentCount: null == commentCount
                ? _value.commentCount
                : commentCount // ignore: cast_nullable_to_non_nullable
                      as int,
            shareCount: null == shareCount
                ? _value.shareCount
                : shareCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isLiked: null == isLiked
                ? _value.isLiked
                : isLiked // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSaved: null == isSaved
                ? _value.isSaved
                : isSaved // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
    _$PostImpl value,
    $Res Function(_$PostImpl) then,
  ) = __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String authorId,
    String authorName,
    String? authorAvatar,
    String content,
    List<String> mediaUrls,
    String type,
    int likeCount,
    int commentCount,
    int shareCount,
    bool isLiked,
    bool isSaved,
    DateTime? createdAt,
    Map<String, dynamic> metadata,
  });
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
    : super(_value, _then);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? authorAvatar = freezed,
    Object? content = null,
    Object? mediaUrls = null,
    Object? type = null,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? shareCount = null,
    Object? isLiked = null,
    Object? isSaved = null,
    Object? createdAt = freezed,
    Object? metadata = null,
  }) {
    return _then(
      _$PostImpl(
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
        mediaUrls: null == mediaUrls
            ? _value._mediaUrls
            : mediaUrls // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        likeCount: null == likeCount
            ? _value.likeCount
            : likeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        commentCount: null == commentCount
            ? _value.commentCount
            : commentCount // ignore: cast_nullable_to_non_nullable
                  as int,
        shareCount: null == shareCount
            ? _value.shareCount
            : shareCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isLiked: null == isLiked
            ? _value.isLiked
            : isLiked // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSaved: null == isSaved
            ? _value.isSaved
            : isSaved // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        metadata: null == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl({
    required this.id,
    required this.authorId,
    required this.authorName,
    this.authorAvatar,
    required this.content,
    final List<String> mediaUrls = const [],
    this.type = 'text',
    this.likeCount = 0,
    this.commentCount = 0,
    this.shareCount = 0,
    this.isLiked = false,
    this.isSaved = false,
    this.createdAt,
    final Map<String, dynamic> metadata = const {},
  }) : _mediaUrls = mediaUrls,
       _metadata = metadata;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

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
  final List<String> _mediaUrls;
  @override
  @JsonKey()
  List<String> get mediaUrls {
    if (_mediaUrls is EqualUnmodifiableListView) return _mediaUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaUrls);
  }

  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final int likeCount;
  @override
  @JsonKey()
  final int commentCount;
  @override
  @JsonKey()
  final int shareCount;
  @override
  @JsonKey()
  final bool isLiked;
  @override
  @JsonKey()
  final bool isSaved;
  @override
  final DateTime? createdAt;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'Post(id: $id, authorId: $authorId, authorName: $authorName, authorAvatar: $authorAvatar, content: $content, mediaUrls: $mediaUrls, type: $type, likeCount: $likeCount, commentCount: $commentCount, shareCount: $shareCount, isLiked: $isLiked, isSaved: $isSaved, createdAt: $createdAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.authorAvatar, authorAvatar) ||
                other.authorAvatar == authorAvatar) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(
              other._mediaUrls,
              _mediaUrls,
            ) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.shareCount, shareCount) ||
                other.shareCount == shareCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    authorId,
    authorName,
    authorAvatar,
    content,
    const DeepCollectionEquality().hash(_mediaUrls),
    type,
    likeCount,
    commentCount,
    shareCount,
    isLiked,
    isSaved,
    createdAt,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(this);
  }
}

abstract class _Post implements Post {
  const factory _Post({
    required final String id,
    required final String authorId,
    required final String authorName,
    final String? authorAvatar,
    required final String content,
    final List<String> mediaUrls,
    final String type,
    final int likeCount,
    final int commentCount,
    final int shareCount,
    final bool isLiked,
    final bool isSaved,
    final DateTime? createdAt,
    final Map<String, dynamic> metadata,
  }) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

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
  List<String> get mediaUrls;
  @override
  String get type;
  @override
  int get likeCount;
  @override
  int get commentCount;
  @override
  int get shareCount;
  @override
  bool get isLiked;
  @override
  bool get isSaved;
  @override
  DateTime? get createdAt;
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TypingIndicator _$TypingIndicatorFromJson(Map<String, dynamic> json) {
  return _TypingIndicator.fromJson(json);
}

/// @nodoc
mixin _$TypingIndicator {
  String get userId => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;

  /// Serializes this TypingIndicator to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypingIndicator
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypingIndicatorCopyWith<TypingIndicator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypingIndicatorCopyWith<$Res> {
  factory $TypingIndicatorCopyWith(
    TypingIndicator value,
    $Res Function(TypingIndicator) then,
  ) = _$TypingIndicatorCopyWithImpl<$Res, TypingIndicator>;
  @useResult
  $Res call({String userId, String roomId, DateTime startedAt});
}

/// @nodoc
class _$TypingIndicatorCopyWithImpl<$Res, $Val extends TypingIndicator>
    implements $TypingIndicatorCopyWith<$Res> {
  _$TypingIndicatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypingIndicator
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? roomId = null,
    Object? startedAt = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            roomId: null == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as String,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TypingIndicatorImplCopyWith<$Res>
    implements $TypingIndicatorCopyWith<$Res> {
  factory _$$TypingIndicatorImplCopyWith(
    _$TypingIndicatorImpl value,
    $Res Function(_$TypingIndicatorImpl) then,
  ) = __$$TypingIndicatorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String roomId, DateTime startedAt});
}

/// @nodoc
class __$$TypingIndicatorImplCopyWithImpl<$Res>
    extends _$TypingIndicatorCopyWithImpl<$Res, _$TypingIndicatorImpl>
    implements _$$TypingIndicatorImplCopyWith<$Res> {
  __$$TypingIndicatorImplCopyWithImpl(
    _$TypingIndicatorImpl _value,
    $Res Function(_$TypingIndicatorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TypingIndicator
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? roomId = null,
    Object? startedAt = null,
  }) {
    return _then(
      _$TypingIndicatorImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TypingIndicatorImpl implements _TypingIndicator {
  const _$TypingIndicatorImpl({
    required this.userId,
    required this.roomId,
    required this.startedAt,
  });

  factory _$TypingIndicatorImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypingIndicatorImplFromJson(json);

  @override
  final String userId;
  @override
  final String roomId;
  @override
  final DateTime startedAt;

  @override
  String toString() {
    return 'TypingIndicator(userId: $userId, roomId: $roomId, startedAt: $startedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypingIndicatorImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, roomId, startedAt);

  /// Create a copy of TypingIndicator
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypingIndicatorImplCopyWith<_$TypingIndicatorImpl> get copyWith =>
      __$$TypingIndicatorImplCopyWithImpl<_$TypingIndicatorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TypingIndicatorImplToJson(this);
  }
}

abstract class _TypingIndicator implements TypingIndicator {
  const factory _TypingIndicator({
    required final String userId,
    required final String roomId,
    required final DateTime startedAt,
  }) = _$TypingIndicatorImpl;

  factory _TypingIndicator.fromJson(Map<String, dynamic> json) =
      _$TypingIndicatorImpl.fromJson;

  @override
  String get userId;
  @override
  String get roomId;
  @override
  DateTime get startedAt;

  /// Create a copy of TypingIndicator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypingIndicatorImplCopyWith<_$TypingIndicatorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedFilter _$FeedFilterFromJson(Map<String, dynamic> json) {
  return _FeedFilter.fromJson(json);
}

/// @nodoc
mixin _$FeedFilter {
  String get type =>
      throw _privateConstructorUsedError; // all, following, trending
  String get sortBy =>
      throw _privateConstructorUsedError; // recent, popular, relevant
  List<String>? get tags => throw _privateConstructorUsedError;
  DateTimeRange? get dateRange => throw _privateConstructorUsedError;

  /// Serializes this FeedFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedFilterCopyWith<FeedFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedFilterCopyWith<$Res> {
  factory $FeedFilterCopyWith(
    FeedFilter value,
    $Res Function(FeedFilter) then,
  ) = _$FeedFilterCopyWithImpl<$Res, FeedFilter>;
  @useResult
  $Res call({
    String type,
    String sortBy,
    List<String>? tags,
    DateTimeRange? dateRange,
  });
}

/// @nodoc
class _$FeedFilterCopyWithImpl<$Res, $Val extends FeedFilter>
    implements $FeedFilterCopyWith<$Res> {
  _$FeedFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? sortBy = null,
    Object? tags = freezed,
    Object? dateRange = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            sortBy: null == sortBy
                ? _value.sortBy
                : sortBy // ignore: cast_nullable_to_non_nullable
                      as String,
            tags: freezed == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            dateRange: freezed == dateRange
                ? _value.dateRange
                : dateRange // ignore: cast_nullable_to_non_nullable
                      as DateTimeRange?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FeedFilterImplCopyWith<$Res>
    implements $FeedFilterCopyWith<$Res> {
  factory _$$FeedFilterImplCopyWith(
    _$FeedFilterImpl value,
    $Res Function(_$FeedFilterImpl) then,
  ) = __$$FeedFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String type,
    String sortBy,
    List<String>? tags,
    DateTimeRange? dateRange,
  });
}

/// @nodoc
class __$$FeedFilterImplCopyWithImpl<$Res>
    extends _$FeedFilterCopyWithImpl<$Res, _$FeedFilterImpl>
    implements _$$FeedFilterImplCopyWith<$Res> {
  __$$FeedFilterImplCopyWithImpl(
    _$FeedFilterImpl _value,
    $Res Function(_$FeedFilterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? sortBy = null,
    Object? tags = freezed,
    Object? dateRange = freezed,
  }) {
    return _then(
      _$FeedFilterImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        sortBy: null == sortBy
            ? _value.sortBy
            : sortBy // ignore: cast_nullable_to_non_nullable
                  as String,
        tags: freezed == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        dateRange: freezed == dateRange
            ? _value.dateRange
            : dateRange // ignore: cast_nullable_to_non_nullable
                  as DateTimeRange?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedFilterImpl implements _FeedFilter {
  const _$FeedFilterImpl({
    this.type = 'all',
    this.sortBy = 'recent',
    final List<String>? tags,
    this.dateRange,
  }) : _tags = tags;

  factory _$FeedFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedFilterImplFromJson(json);

  @override
  @JsonKey()
  final String type;
  // all, following, trending
  @override
  @JsonKey()
  final String sortBy;
  // recent, popular, relevant
  final List<String>? _tags;
  // recent, popular, relevant
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTimeRange? dateRange;

  @override
  String toString() {
    return 'FeedFilter(type: $type, sortBy: $sortBy, tags: $tags, dateRange: $dateRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedFilterImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    sortBy,
    const DeepCollectionEquality().hash(_tags),
    dateRange,
  );

  /// Create a copy of FeedFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedFilterImplCopyWith<_$FeedFilterImpl> get copyWith =>
      __$$FeedFilterImplCopyWithImpl<_$FeedFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedFilterImplToJson(this);
  }
}

abstract class _FeedFilter implements FeedFilter {
  const factory _FeedFilter({
    final String type,
    final String sortBy,
    final List<String>? tags,
    final DateTimeRange? dateRange,
  }) = _$FeedFilterImpl;

  factory _FeedFilter.fromJson(Map<String, dynamic> json) =
      _$FeedFilterImpl.fromJson;

  @override
  String get type; // all, following, trending
  @override
  String get sortBy; // recent, popular, relevant
  @override
  List<String>? get tags;
  @override
  DateTimeRange? get dateRange;

  /// Create a copy of FeedFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedFilterImplCopyWith<_$FeedFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Toast {
  String get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // info, success, warning, error
  int get durationMs => throw _privateConstructorUsedError;
  String? get actionLabel => throw _privateConstructorUsedError;
  Function? get onAction => throw _privateConstructorUsedError;

  /// Create a copy of Toast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ToastCopyWith<Toast> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToastCopyWith<$Res> {
  factory $ToastCopyWith(Toast value, $Res Function(Toast) then) =
      _$ToastCopyWithImpl<$Res, Toast>;
  @useResult
  $Res call({
    String id,
    String message,
    String type,
    int durationMs,
    String? actionLabel,
    Function? onAction,
  });
}

/// @nodoc
class _$ToastCopyWithImpl<$Res, $Val extends Toast>
    implements $ToastCopyWith<$Res> {
  _$ToastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Toast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? type = null,
    Object? durationMs = null,
    Object? actionLabel = freezed,
    Object? onAction = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            durationMs: null == durationMs
                ? _value.durationMs
                : durationMs // ignore: cast_nullable_to_non_nullable
                      as int,
            actionLabel: freezed == actionLabel
                ? _value.actionLabel
                : actionLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            onAction: freezed == onAction
                ? _value.onAction
                : onAction // ignore: cast_nullable_to_non_nullable
                      as Function?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ToastImplCopyWith<$Res> implements $ToastCopyWith<$Res> {
  factory _$$ToastImplCopyWith(
    _$ToastImpl value,
    $Res Function(_$ToastImpl) then,
  ) = __$$ToastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String message,
    String type,
    int durationMs,
    String? actionLabel,
    Function? onAction,
  });
}

/// @nodoc
class __$$ToastImplCopyWithImpl<$Res>
    extends _$ToastCopyWithImpl<$Res, _$ToastImpl>
    implements _$$ToastImplCopyWith<$Res> {
  __$$ToastImplCopyWithImpl(
    _$ToastImpl _value,
    $Res Function(_$ToastImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Toast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? type = null,
    Object? durationMs = null,
    Object? actionLabel = freezed,
    Object? onAction = freezed,
  }) {
    return _then(
      _$ToastImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        durationMs: null == durationMs
            ? _value.durationMs
            : durationMs // ignore: cast_nullable_to_non_nullable
                  as int,
        actionLabel: freezed == actionLabel
            ? _value.actionLabel
            : actionLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        onAction: freezed == onAction
            ? _value.onAction
            : onAction // ignore: cast_nullable_to_non_nullable
                  as Function?,
      ),
    );
  }
}

/// @nodoc

class _$ToastImpl implements _Toast {
  const _$ToastImpl({
    required this.id,
    required this.message,
    this.type = 'info',
    this.durationMs = 3000,
    this.actionLabel,
    this.onAction,
  });

  @override
  final String id;
  @override
  final String message;
  @override
  @JsonKey()
  final String type;
  // info, success, warning, error
  @override
  @JsonKey()
  final int durationMs;
  @override
  final String? actionLabel;
  @override
  final Function? onAction;

  @override
  String toString() {
    return 'Toast(id: $id, message: $message, type: $type, durationMs: $durationMs, actionLabel: $actionLabel, onAction: $onAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToastImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.durationMs, durationMs) ||
                other.durationMs == durationMs) &&
            (identical(other.actionLabel, actionLabel) ||
                other.actionLabel == actionLabel) &&
            (identical(other.onAction, onAction) ||
                other.onAction == onAction));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    message,
    type,
    durationMs,
    actionLabel,
    onAction,
  );

  /// Create a copy of Toast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToastImplCopyWith<_$ToastImpl> get copyWith =>
      __$$ToastImplCopyWithImpl<_$ToastImpl>(this, _$identity);
}

abstract class _Toast implements Toast {
  const factory _Toast({
    required final String id,
    required final String message,
    final String type,
    final int durationMs,
    final String? actionLabel,
    final Function? onAction,
  }) = _$ToastImpl;

  @override
  String get id;
  @override
  String get message;
  @override
  String get type; // info, success, warning, error
  @override
  int get durationMs;
  @override
  String? get actionLabel;
  @override
  Function? get onAction;

  /// Create a copy of Toast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToastImplCopyWith<_$ToastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScrollPosition _$ScrollPositionFromJson(Map<String, dynamic> json) {
  return _ScrollPosition.fromJson(json);
}

/// @nodoc
mixin _$ScrollPosition {
  String get screenId => throw _privateConstructorUsedError;
  double get offset => throw _privateConstructorUsedError;
  DateTime? get savedAt => throw _privateConstructorUsedError;

  /// Serializes this ScrollPosition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScrollPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScrollPositionCopyWith<ScrollPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScrollPositionCopyWith<$Res> {
  factory $ScrollPositionCopyWith(
    ScrollPosition value,
    $Res Function(ScrollPosition) then,
  ) = _$ScrollPositionCopyWithImpl<$Res, ScrollPosition>;
  @useResult
  $Res call({String screenId, double offset, DateTime? savedAt});
}

/// @nodoc
class _$ScrollPositionCopyWithImpl<$Res, $Val extends ScrollPosition>
    implements $ScrollPositionCopyWith<$Res> {
  _$ScrollPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScrollPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenId = null,
    Object? offset = null,
    Object? savedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            screenId: null == screenId
                ? _value.screenId
                : screenId // ignore: cast_nullable_to_non_nullable
                      as String,
            offset: null == offset
                ? _value.offset
                : offset // ignore: cast_nullable_to_non_nullable
                      as double,
            savedAt: freezed == savedAt
                ? _value.savedAt
                : savedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScrollPositionImplCopyWith<$Res>
    implements $ScrollPositionCopyWith<$Res> {
  factory _$$ScrollPositionImplCopyWith(
    _$ScrollPositionImpl value,
    $Res Function(_$ScrollPositionImpl) then,
  ) = __$$ScrollPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String screenId, double offset, DateTime? savedAt});
}

/// @nodoc
class __$$ScrollPositionImplCopyWithImpl<$Res>
    extends _$ScrollPositionCopyWithImpl<$Res, _$ScrollPositionImpl>
    implements _$$ScrollPositionImplCopyWith<$Res> {
  __$$ScrollPositionImplCopyWithImpl(
    _$ScrollPositionImpl _value,
    $Res Function(_$ScrollPositionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ScrollPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenId = null,
    Object? offset = null,
    Object? savedAt = freezed,
  }) {
    return _then(
      _$ScrollPositionImpl(
        screenId: null == screenId
            ? _value.screenId
            : screenId // ignore: cast_nullable_to_non_nullable
                  as String,
        offset: null == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as double,
        savedAt: freezed == savedAt
            ? _value.savedAt
            : savedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScrollPositionImpl implements _ScrollPosition {
  const _$ScrollPositionImpl({
    required this.screenId,
    required this.offset,
    this.savedAt,
  });

  factory _$ScrollPositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScrollPositionImplFromJson(json);

  @override
  final String screenId;
  @override
  final double offset;
  @override
  final DateTime? savedAt;

  @override
  String toString() {
    return 'ScrollPosition(screenId: $screenId, offset: $offset, savedAt: $savedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScrollPositionImpl &&
            (identical(other.screenId, screenId) ||
                other.screenId == screenId) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, screenId, offset, savedAt);

  /// Create a copy of ScrollPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScrollPositionImplCopyWith<_$ScrollPositionImpl> get copyWith =>
      __$$ScrollPositionImplCopyWithImpl<_$ScrollPositionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ScrollPositionImplToJson(this);
  }
}

abstract class _ScrollPosition implements ScrollPosition {
  const factory _ScrollPosition({
    required final String screenId,
    required final double offset,
    final DateTime? savedAt,
  }) = _$ScrollPositionImpl;

  factory _ScrollPosition.fromJson(Map<String, dynamic> json) =
      _$ScrollPositionImpl.fromJson;

  @override
  String get screenId;
  @override
  double get offset;
  @override
  DateTime? get savedAt;

  /// Create a copy of ScrollPosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScrollPositionImplCopyWith<_$ScrollPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
