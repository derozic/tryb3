// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AdminDashboardStats _$AdminDashboardStatsFromJson(Map<String, dynamic> json) {
  return _AdminDashboardStats.fromJson(json);
}

/// @nodoc
mixin _$AdminDashboardStats {
  int get totalUsers => throw _privateConstructorUsedError;
  int get pendingUsers => throw _privateConstructorUsedError;
  int get approvedUsers => throw _privateConstructorUsedError;
  int get rejectedUsers => throw _privateConstructorUsedError;
  int get suspendedUsers => throw _privateConstructorUsedError;
  int get totalPosts => throw _privateConstructorUsedError;
  int get totalNotifications => throw _privateConstructorUsedError;
  int get activeDevices => throw _privateConstructorUsedError;
  Map<String, int> get usersByDay => throw _privateConstructorUsedError;
  Map<String, int> get postsByDay => throw _privateConstructorUsedError;
  Map<String, int> get notificationsByType =>
      throw _privateConstructorUsedError;

  /// Serializes this AdminDashboardStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminDashboardStatsCopyWith<AdminDashboardStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminDashboardStatsCopyWith<$Res> {
  factory $AdminDashboardStatsCopyWith(
    AdminDashboardStats value,
    $Res Function(AdminDashboardStats) then,
  ) = _$AdminDashboardStatsCopyWithImpl<$Res, AdminDashboardStats>;
  @useResult
  $Res call({
    int totalUsers,
    int pendingUsers,
    int approvedUsers,
    int rejectedUsers,
    int suspendedUsers,
    int totalPosts,
    int totalNotifications,
    int activeDevices,
    Map<String, int> usersByDay,
    Map<String, int> postsByDay,
    Map<String, int> notificationsByType,
  });
}

/// @nodoc
class _$AdminDashboardStatsCopyWithImpl<$Res, $Val extends AdminDashboardStats>
    implements $AdminDashboardStatsCopyWith<$Res> {
  _$AdminDashboardStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalUsers = null,
    Object? pendingUsers = null,
    Object? approvedUsers = null,
    Object? rejectedUsers = null,
    Object? suspendedUsers = null,
    Object? totalPosts = null,
    Object? totalNotifications = null,
    Object? activeDevices = null,
    Object? usersByDay = null,
    Object? postsByDay = null,
    Object? notificationsByType = null,
  }) {
    return _then(
      _value.copyWith(
            totalUsers: null == totalUsers
                ? _value.totalUsers
                : totalUsers // ignore: cast_nullable_to_non_nullable
                      as int,
            pendingUsers: null == pendingUsers
                ? _value.pendingUsers
                : pendingUsers // ignore: cast_nullable_to_non_nullable
                      as int,
            approvedUsers: null == approvedUsers
                ? _value.approvedUsers
                : approvedUsers // ignore: cast_nullable_to_non_nullable
                      as int,
            rejectedUsers: null == rejectedUsers
                ? _value.rejectedUsers
                : rejectedUsers // ignore: cast_nullable_to_non_nullable
                      as int,
            suspendedUsers: null == suspendedUsers
                ? _value.suspendedUsers
                : suspendedUsers // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPosts: null == totalPosts
                ? _value.totalPosts
                : totalPosts // ignore: cast_nullable_to_non_nullable
                      as int,
            totalNotifications: null == totalNotifications
                ? _value.totalNotifications
                : totalNotifications // ignore: cast_nullable_to_non_nullable
                      as int,
            activeDevices: null == activeDevices
                ? _value.activeDevices
                : activeDevices // ignore: cast_nullable_to_non_nullable
                      as int,
            usersByDay: null == usersByDay
                ? _value.usersByDay
                : usersByDay // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
            postsByDay: null == postsByDay
                ? _value.postsByDay
                : postsByDay // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
            notificationsByType: null == notificationsByType
                ? _value.notificationsByType
                : notificationsByType // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AdminDashboardStatsImplCopyWith<$Res>
    implements $AdminDashboardStatsCopyWith<$Res> {
  factory _$$AdminDashboardStatsImplCopyWith(
    _$AdminDashboardStatsImpl value,
    $Res Function(_$AdminDashboardStatsImpl) then,
  ) = __$$AdminDashboardStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalUsers,
    int pendingUsers,
    int approvedUsers,
    int rejectedUsers,
    int suspendedUsers,
    int totalPosts,
    int totalNotifications,
    int activeDevices,
    Map<String, int> usersByDay,
    Map<String, int> postsByDay,
    Map<String, int> notificationsByType,
  });
}

/// @nodoc
class __$$AdminDashboardStatsImplCopyWithImpl<$Res>
    extends _$AdminDashboardStatsCopyWithImpl<$Res, _$AdminDashboardStatsImpl>
    implements _$$AdminDashboardStatsImplCopyWith<$Res> {
  __$$AdminDashboardStatsImplCopyWithImpl(
    _$AdminDashboardStatsImpl _value,
    $Res Function(_$AdminDashboardStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AdminDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalUsers = null,
    Object? pendingUsers = null,
    Object? approvedUsers = null,
    Object? rejectedUsers = null,
    Object? suspendedUsers = null,
    Object? totalPosts = null,
    Object? totalNotifications = null,
    Object? activeDevices = null,
    Object? usersByDay = null,
    Object? postsByDay = null,
    Object? notificationsByType = null,
  }) {
    return _then(
      _$AdminDashboardStatsImpl(
        totalUsers: null == totalUsers
            ? _value.totalUsers
            : totalUsers // ignore: cast_nullable_to_non_nullable
                  as int,
        pendingUsers: null == pendingUsers
            ? _value.pendingUsers
            : pendingUsers // ignore: cast_nullable_to_non_nullable
                  as int,
        approvedUsers: null == approvedUsers
            ? _value.approvedUsers
            : approvedUsers // ignore: cast_nullable_to_non_nullable
                  as int,
        rejectedUsers: null == rejectedUsers
            ? _value.rejectedUsers
            : rejectedUsers // ignore: cast_nullable_to_non_nullable
                  as int,
        suspendedUsers: null == suspendedUsers
            ? _value.suspendedUsers
            : suspendedUsers // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPosts: null == totalPosts
            ? _value.totalPosts
            : totalPosts // ignore: cast_nullable_to_non_nullable
                  as int,
        totalNotifications: null == totalNotifications
            ? _value.totalNotifications
            : totalNotifications // ignore: cast_nullable_to_non_nullable
                  as int,
        activeDevices: null == activeDevices
            ? _value.activeDevices
            : activeDevices // ignore: cast_nullable_to_non_nullable
                  as int,
        usersByDay: null == usersByDay
            ? _value._usersByDay
            : usersByDay // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
        postsByDay: null == postsByDay
            ? _value._postsByDay
            : postsByDay // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
        notificationsByType: null == notificationsByType
            ? _value._notificationsByType
            : notificationsByType // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminDashboardStatsImpl implements _AdminDashboardStats {
  const _$AdminDashboardStatsImpl({
    required this.totalUsers,
    required this.pendingUsers,
    required this.approvedUsers,
    required this.rejectedUsers,
    required this.suspendedUsers,
    required this.totalPosts,
    required this.totalNotifications,
    required this.activeDevices,
    required final Map<String, int> usersByDay,
    required final Map<String, int> postsByDay,
    required final Map<String, int> notificationsByType,
  }) : _usersByDay = usersByDay,
       _postsByDay = postsByDay,
       _notificationsByType = notificationsByType;

  factory _$AdminDashboardStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminDashboardStatsImplFromJson(json);

  @override
  final int totalUsers;
  @override
  final int pendingUsers;
  @override
  final int approvedUsers;
  @override
  final int rejectedUsers;
  @override
  final int suspendedUsers;
  @override
  final int totalPosts;
  @override
  final int totalNotifications;
  @override
  final int activeDevices;
  final Map<String, int> _usersByDay;
  @override
  Map<String, int> get usersByDay {
    if (_usersByDay is EqualUnmodifiableMapView) return _usersByDay;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_usersByDay);
  }

  final Map<String, int> _postsByDay;
  @override
  Map<String, int> get postsByDay {
    if (_postsByDay is EqualUnmodifiableMapView) return _postsByDay;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_postsByDay);
  }

  final Map<String, int> _notificationsByType;
  @override
  Map<String, int> get notificationsByType {
    if (_notificationsByType is EqualUnmodifiableMapView)
      return _notificationsByType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_notificationsByType);
  }

  @override
  String toString() {
    return 'AdminDashboardStats(totalUsers: $totalUsers, pendingUsers: $pendingUsers, approvedUsers: $approvedUsers, rejectedUsers: $rejectedUsers, suspendedUsers: $suspendedUsers, totalPosts: $totalPosts, totalNotifications: $totalNotifications, activeDevices: $activeDevices, usersByDay: $usersByDay, postsByDay: $postsByDay, notificationsByType: $notificationsByType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminDashboardStatsImpl &&
            (identical(other.totalUsers, totalUsers) ||
                other.totalUsers == totalUsers) &&
            (identical(other.pendingUsers, pendingUsers) ||
                other.pendingUsers == pendingUsers) &&
            (identical(other.approvedUsers, approvedUsers) ||
                other.approvedUsers == approvedUsers) &&
            (identical(other.rejectedUsers, rejectedUsers) ||
                other.rejectedUsers == rejectedUsers) &&
            (identical(other.suspendedUsers, suspendedUsers) ||
                other.suspendedUsers == suspendedUsers) &&
            (identical(other.totalPosts, totalPosts) ||
                other.totalPosts == totalPosts) &&
            (identical(other.totalNotifications, totalNotifications) ||
                other.totalNotifications == totalNotifications) &&
            (identical(other.activeDevices, activeDevices) ||
                other.activeDevices == activeDevices) &&
            const DeepCollectionEquality().equals(
              other._usersByDay,
              _usersByDay,
            ) &&
            const DeepCollectionEquality().equals(
              other._postsByDay,
              _postsByDay,
            ) &&
            const DeepCollectionEquality().equals(
              other._notificationsByType,
              _notificationsByType,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalUsers,
    pendingUsers,
    approvedUsers,
    rejectedUsers,
    suspendedUsers,
    totalPosts,
    totalNotifications,
    activeDevices,
    const DeepCollectionEquality().hash(_usersByDay),
    const DeepCollectionEquality().hash(_postsByDay),
    const DeepCollectionEquality().hash(_notificationsByType),
  );

  /// Create a copy of AdminDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminDashboardStatsImplCopyWith<_$AdminDashboardStatsImpl> get copyWith =>
      __$$AdminDashboardStatsImplCopyWithImpl<_$AdminDashboardStatsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminDashboardStatsImplToJson(this);
  }
}

abstract class _AdminDashboardStats implements AdminDashboardStats {
  const factory _AdminDashboardStats({
    required final int totalUsers,
    required final int pendingUsers,
    required final int approvedUsers,
    required final int rejectedUsers,
    required final int suspendedUsers,
    required final int totalPosts,
    required final int totalNotifications,
    required final int activeDevices,
    required final Map<String, int> usersByDay,
    required final Map<String, int> postsByDay,
    required final Map<String, int> notificationsByType,
  }) = _$AdminDashboardStatsImpl;

  factory _AdminDashboardStats.fromJson(Map<String, dynamic> json) =
      _$AdminDashboardStatsImpl.fromJson;

  @override
  int get totalUsers;
  @override
  int get pendingUsers;
  @override
  int get approvedUsers;
  @override
  int get rejectedUsers;
  @override
  int get suspendedUsers;
  @override
  int get totalPosts;
  @override
  int get totalNotifications;
  @override
  int get activeDevices;
  @override
  Map<String, int> get usersByDay;
  @override
  Map<String, int> get postsByDay;
  @override
  Map<String, int> get notificationsByType;

  /// Create a copy of AdminDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminDashboardStatsImplCopyWith<_$AdminDashboardStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserApprovalRequest _$UserApprovalRequestFromJson(Map<String, dynamic> json) {
  return _UserApprovalRequest.fromJson(json);
}

/// @nodoc
mixin _$UserApprovalRequest {
  UserModel get user => throw _privateConstructorUsedError;
  DateTime get requestedAt => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String? get adminNotes => throw _privateConstructorUsedError;

  /// Serializes this UserApprovalRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserApprovalRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserApprovalRequestCopyWith<UserApprovalRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserApprovalRequestCopyWith<$Res> {
  factory $UserApprovalRequestCopyWith(
    UserApprovalRequest value,
    $Res Function(UserApprovalRequest) then,
  ) = _$UserApprovalRequestCopyWithImpl<$Res, UserApprovalRequest>;
  @useResult
  $Res call({
    UserModel user,
    DateTime requestedAt,
    String? reason,
    String? adminNotes,
  });

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$UserApprovalRequestCopyWithImpl<$Res, $Val extends UserApprovalRequest>
    implements $UserApprovalRequestCopyWith<$Res> {
  _$UserApprovalRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserApprovalRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? requestedAt = null,
    Object? reason = freezed,
    Object? adminNotes = freezed,
  }) {
    return _then(
      _value.copyWith(
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserModel,
            requestedAt: null == requestedAt
                ? _value.requestedAt
                : requestedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
            adminNotes: freezed == adminNotes
                ? _value.adminNotes
                : adminNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of UserApprovalRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserApprovalRequestImplCopyWith<$Res>
    implements $UserApprovalRequestCopyWith<$Res> {
  factory _$$UserApprovalRequestImplCopyWith(
    _$UserApprovalRequestImpl value,
    $Res Function(_$UserApprovalRequestImpl) then,
  ) = __$$UserApprovalRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserModel user,
    DateTime requestedAt,
    String? reason,
    String? adminNotes,
  });

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserApprovalRequestImplCopyWithImpl<$Res>
    extends _$UserApprovalRequestCopyWithImpl<$Res, _$UserApprovalRequestImpl>
    implements _$$UserApprovalRequestImplCopyWith<$Res> {
  __$$UserApprovalRequestImplCopyWithImpl(
    _$UserApprovalRequestImpl _value,
    $Res Function(_$UserApprovalRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserApprovalRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? requestedAt = null,
    Object? reason = freezed,
    Object? adminNotes = freezed,
  }) {
    return _then(
      _$UserApprovalRequestImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserModel,
        requestedAt: null == requestedAt
            ? _value.requestedAt
            : requestedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
        adminNotes: freezed == adminNotes
            ? _value.adminNotes
            : adminNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserApprovalRequestImpl implements _UserApprovalRequest {
  const _$UserApprovalRequestImpl({
    required this.user,
    required this.requestedAt,
    this.reason,
    this.adminNotes,
  });

  factory _$UserApprovalRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserApprovalRequestImplFromJson(json);

  @override
  final UserModel user;
  @override
  final DateTime requestedAt;
  @override
  final String? reason;
  @override
  final String? adminNotes;

  @override
  String toString() {
    return 'UserApprovalRequest(user: $user, requestedAt: $requestedAt, reason: $reason, adminNotes: $adminNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserApprovalRequestImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.requestedAt, requestedAt) ||
                other.requestedAt == requestedAt) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.adminNotes, adminNotes) ||
                other.adminNotes == adminNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, user, requestedAt, reason, adminNotes);

  /// Create a copy of UserApprovalRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserApprovalRequestImplCopyWith<_$UserApprovalRequestImpl> get copyWith =>
      __$$UserApprovalRequestImplCopyWithImpl<_$UserApprovalRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserApprovalRequestImplToJson(this);
  }
}

abstract class _UserApprovalRequest implements UserApprovalRequest {
  const factory _UserApprovalRequest({
    required final UserModel user,
    required final DateTime requestedAt,
    final String? reason,
    final String? adminNotes,
  }) = _$UserApprovalRequestImpl;

  factory _UserApprovalRequest.fromJson(Map<String, dynamic> json) =
      _$UserApprovalRequestImpl.fromJson;

  @override
  UserModel get user;
  @override
  DateTime get requestedAt;
  @override
  String? get reason;
  @override
  String? get adminNotes;

  /// Create a copy of UserApprovalRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserApprovalRequestImplCopyWith<_$UserApprovalRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AdminAction _$AdminActionFromJson(Map<String, dynamic> json) {
  return _AdminAction.fromJson(json);
}

/// @nodoc
mixin _$AdminAction {
  String get id => throw _privateConstructorUsedError;
  String get adminId => throw _privateConstructorUsedError;
  String get adminUsername => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  String get targetType => throw _privateConstructorUsedError;
  String get targetId => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AdminAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminActionCopyWith<AdminAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminActionCopyWith<$Res> {
  factory $AdminActionCopyWith(
    AdminAction value,
    $Res Function(AdminAction) then,
  ) = _$AdminActionCopyWithImpl<$Res, AdminAction>;
  @useResult
  $Res call({
    String id,
    String adminId,
    String adminUsername,
    String action,
    String targetType,
    String targetId,
    String? reason,
    String? details,
    DateTime createdAt,
  });
}

/// @nodoc
class _$AdminActionCopyWithImpl<$Res, $Val extends AdminAction>
    implements $AdminActionCopyWith<$Res> {
  _$AdminActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? adminId = null,
    Object? adminUsername = null,
    Object? action = null,
    Object? targetType = null,
    Object? targetId = null,
    Object? reason = freezed,
    Object? details = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            adminId: null == adminId
                ? _value.adminId
                : adminId // ignore: cast_nullable_to_non_nullable
                      as String,
            adminUsername: null == adminUsername
                ? _value.adminUsername
                : adminUsername // ignore: cast_nullable_to_non_nullable
                      as String,
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as String,
            targetType: null == targetType
                ? _value.targetType
                : targetType // ignore: cast_nullable_to_non_nullable
                      as String,
            targetId: null == targetId
                ? _value.targetId
                : targetId // ignore: cast_nullable_to_non_nullable
                      as String,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
            details: freezed == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$AdminActionImplCopyWith<$Res>
    implements $AdminActionCopyWith<$Res> {
  factory _$$AdminActionImplCopyWith(
    _$AdminActionImpl value,
    $Res Function(_$AdminActionImpl) then,
  ) = __$$AdminActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String adminId,
    String adminUsername,
    String action,
    String targetType,
    String targetId,
    String? reason,
    String? details,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$AdminActionImplCopyWithImpl<$Res>
    extends _$AdminActionCopyWithImpl<$Res, _$AdminActionImpl>
    implements _$$AdminActionImplCopyWith<$Res> {
  __$$AdminActionImplCopyWithImpl(
    _$AdminActionImpl _value,
    $Res Function(_$AdminActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AdminAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? adminId = null,
    Object? adminUsername = null,
    Object? action = null,
    Object? targetType = null,
    Object? targetId = null,
    Object? reason = freezed,
    Object? details = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$AdminActionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        adminId: null == adminId
            ? _value.adminId
            : adminId // ignore: cast_nullable_to_non_nullable
                  as String,
        adminUsername: null == adminUsername
            ? _value.adminUsername
            : adminUsername // ignore: cast_nullable_to_non_nullable
                  as String,
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as String,
        targetType: null == targetType
            ? _value.targetType
            : targetType // ignore: cast_nullable_to_non_nullable
                  as String,
        targetId: null == targetId
            ? _value.targetId
            : targetId // ignore: cast_nullable_to_non_nullable
                  as String,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$AdminActionImpl implements _AdminAction {
  const _$AdminActionImpl({
    required this.id,
    required this.adminId,
    required this.adminUsername,
    required this.action,
    required this.targetType,
    required this.targetId,
    this.reason,
    this.details,
    required this.createdAt,
  });

  factory _$AdminActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminActionImplFromJson(json);

  @override
  final String id;
  @override
  final String adminId;
  @override
  final String adminUsername;
  @override
  final String action;
  @override
  final String targetType;
  @override
  final String targetId;
  @override
  final String? reason;
  @override
  final String? details;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'AdminAction(id: $id, adminId: $adminId, adminUsername: $adminUsername, action: $action, targetType: $targetType, targetId: $targetId, reason: $reason, details: $details, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminActionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.adminId, adminId) || other.adminId == adminId) &&
            (identical(other.adminUsername, adminUsername) ||
                other.adminUsername == adminUsername) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.targetType, targetType) ||
                other.targetType == targetType) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    adminId,
    adminUsername,
    action,
    targetType,
    targetId,
    reason,
    details,
    createdAt,
  );

  /// Create a copy of AdminAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminActionImplCopyWith<_$AdminActionImpl> get copyWith =>
      __$$AdminActionImplCopyWithImpl<_$AdminActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminActionImplToJson(this);
  }
}

abstract class _AdminAction implements AdminAction {
  const factory _AdminAction({
    required final String id,
    required final String adminId,
    required final String adminUsername,
    required final String action,
    required final String targetType,
    required final String targetId,
    final String? reason,
    final String? details,
    required final DateTime createdAt,
  }) = _$AdminActionImpl;

  factory _AdminAction.fromJson(Map<String, dynamic> json) =
      _$AdminActionImpl.fromJson;

  @override
  String get id;
  @override
  String get adminId;
  @override
  String get adminUsername;
  @override
  String get action;
  @override
  String get targetType;
  @override
  String get targetId;
  @override
  String? get reason;
  @override
  String? get details;
  @override
  DateTime get createdAt;

  /// Create a copy of AdminAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminActionImplCopyWith<_$AdminActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BulkActionRequest _$BulkActionRequestFromJson(Map<String, dynamic> json) {
  return _BulkActionRequest.fromJson(json);
}

/// @nodoc
mixin _$BulkActionRequest {
  List<String> get userIds => throw _privateConstructorUsedError;
  UserApprovalAction get action => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this BulkActionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BulkActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BulkActionRequestCopyWith<BulkActionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BulkActionRequestCopyWith<$Res> {
  factory $BulkActionRequestCopyWith(
    BulkActionRequest value,
    $Res Function(BulkActionRequest) then,
  ) = _$BulkActionRequestCopyWithImpl<$Res, BulkActionRequest>;
  @useResult
  $Res call({List<String> userIds, UserApprovalAction action, String? reason});
}

/// @nodoc
class _$BulkActionRequestCopyWithImpl<$Res, $Val extends BulkActionRequest>
    implements $BulkActionRequestCopyWith<$Res> {
  _$BulkActionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BulkActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIds = null,
    Object? action = null,
    Object? reason = freezed,
  }) {
    return _then(
      _value.copyWith(
            userIds: null == userIds
                ? _value.userIds
                : userIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as UserApprovalAction,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BulkActionRequestImplCopyWith<$Res>
    implements $BulkActionRequestCopyWith<$Res> {
  factory _$$BulkActionRequestImplCopyWith(
    _$BulkActionRequestImpl value,
    $Res Function(_$BulkActionRequestImpl) then,
  ) = __$$BulkActionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> userIds, UserApprovalAction action, String? reason});
}

/// @nodoc
class __$$BulkActionRequestImplCopyWithImpl<$Res>
    extends _$BulkActionRequestCopyWithImpl<$Res, _$BulkActionRequestImpl>
    implements _$$BulkActionRequestImplCopyWith<$Res> {
  __$$BulkActionRequestImplCopyWithImpl(
    _$BulkActionRequestImpl _value,
    $Res Function(_$BulkActionRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BulkActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIds = null,
    Object? action = null,
    Object? reason = freezed,
  }) {
    return _then(
      _$BulkActionRequestImpl(
        userIds: null == userIds
            ? _value._userIds
            : userIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as UserApprovalAction,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BulkActionRequestImpl implements _BulkActionRequest {
  const _$BulkActionRequestImpl({
    required final List<String> userIds,
    required this.action,
    this.reason,
  }) : _userIds = userIds;

  factory _$BulkActionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BulkActionRequestImplFromJson(json);

  final List<String> _userIds;
  @override
  List<String> get userIds {
    if (_userIds is EqualUnmodifiableListView) return _userIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIds);
  }

  @override
  final UserApprovalAction action;
  @override
  final String? reason;

  @override
  String toString() {
    return 'BulkActionRequest(userIds: $userIds, action: $action, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BulkActionRequestImpl &&
            const DeepCollectionEquality().equals(other._userIds, _userIds) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_userIds),
    action,
    reason,
  );

  /// Create a copy of BulkActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BulkActionRequestImplCopyWith<_$BulkActionRequestImpl> get copyWith =>
      __$$BulkActionRequestImplCopyWithImpl<_$BulkActionRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BulkActionRequestImplToJson(this);
  }
}

abstract class _BulkActionRequest implements BulkActionRequest {
  const factory _BulkActionRequest({
    required final List<String> userIds,
    required final UserApprovalAction action,
    final String? reason,
  }) = _$BulkActionRequestImpl;

  factory _BulkActionRequest.fromJson(Map<String, dynamic> json) =
      _$BulkActionRequestImpl.fromJson;

  @override
  List<String> get userIds;
  @override
  UserApprovalAction get action;
  @override
  String? get reason;

  /// Create a copy of BulkActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BulkActionRequestImplCopyWith<_$BulkActionRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BulkActionResult _$BulkActionResultFromJson(Map<String, dynamic> json) {
  return _BulkActionResult.fromJson(json);
}

/// @nodoc
mixin _$BulkActionResult {
  int get successCount => throw _privateConstructorUsedError;
  int get failedCount => throw _privateConstructorUsedError;
  List<String> get errors => throw _privateConstructorUsedError;
  List<String> get processedUserIds => throw _privateConstructorUsedError;

  /// Serializes this BulkActionResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BulkActionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BulkActionResultCopyWith<BulkActionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BulkActionResultCopyWith<$Res> {
  factory $BulkActionResultCopyWith(
    BulkActionResult value,
    $Res Function(BulkActionResult) then,
  ) = _$BulkActionResultCopyWithImpl<$Res, BulkActionResult>;
  @useResult
  $Res call({
    int successCount,
    int failedCount,
    List<String> errors,
    List<String> processedUserIds,
  });
}

/// @nodoc
class _$BulkActionResultCopyWithImpl<$Res, $Val extends BulkActionResult>
    implements $BulkActionResultCopyWith<$Res> {
  _$BulkActionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BulkActionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? successCount = null,
    Object? failedCount = null,
    Object? errors = null,
    Object? processedUserIds = null,
  }) {
    return _then(
      _value.copyWith(
            successCount: null == successCount
                ? _value.successCount
                : successCount // ignore: cast_nullable_to_non_nullable
                      as int,
            failedCount: null == failedCount
                ? _value.failedCount
                : failedCount // ignore: cast_nullable_to_non_nullable
                      as int,
            errors: null == errors
                ? _value.errors
                : errors // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            processedUserIds: null == processedUserIds
                ? _value.processedUserIds
                : processedUserIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BulkActionResultImplCopyWith<$Res>
    implements $BulkActionResultCopyWith<$Res> {
  factory _$$BulkActionResultImplCopyWith(
    _$BulkActionResultImpl value,
    $Res Function(_$BulkActionResultImpl) then,
  ) = __$$BulkActionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int successCount,
    int failedCount,
    List<String> errors,
    List<String> processedUserIds,
  });
}

/// @nodoc
class __$$BulkActionResultImplCopyWithImpl<$Res>
    extends _$BulkActionResultCopyWithImpl<$Res, _$BulkActionResultImpl>
    implements _$$BulkActionResultImplCopyWith<$Res> {
  __$$BulkActionResultImplCopyWithImpl(
    _$BulkActionResultImpl _value,
    $Res Function(_$BulkActionResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BulkActionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? successCount = null,
    Object? failedCount = null,
    Object? errors = null,
    Object? processedUserIds = null,
  }) {
    return _then(
      _$BulkActionResultImpl(
        successCount: null == successCount
            ? _value.successCount
            : successCount // ignore: cast_nullable_to_non_nullable
                  as int,
        failedCount: null == failedCount
            ? _value.failedCount
            : failedCount // ignore: cast_nullable_to_non_nullable
                  as int,
        errors: null == errors
            ? _value._errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        processedUserIds: null == processedUserIds
            ? _value._processedUserIds
            : processedUserIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BulkActionResultImpl implements _BulkActionResult {
  const _$BulkActionResultImpl({
    required this.successCount,
    required this.failedCount,
    required final List<String> errors,
    required final List<String> processedUserIds,
  }) : _errors = errors,
       _processedUserIds = processedUserIds;

  factory _$BulkActionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$BulkActionResultImplFromJson(json);

  @override
  final int successCount;
  @override
  final int failedCount;
  final List<String> _errors;
  @override
  List<String> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  final List<String> _processedUserIds;
  @override
  List<String> get processedUserIds {
    if (_processedUserIds is EqualUnmodifiableListView)
      return _processedUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_processedUserIds);
  }

  @override
  String toString() {
    return 'BulkActionResult(successCount: $successCount, failedCount: $failedCount, errors: $errors, processedUserIds: $processedUserIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BulkActionResultImpl &&
            (identical(other.successCount, successCount) ||
                other.successCount == successCount) &&
            (identical(other.failedCount, failedCount) ||
                other.failedCount == failedCount) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            const DeepCollectionEquality().equals(
              other._processedUserIds,
              _processedUserIds,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    successCount,
    failedCount,
    const DeepCollectionEquality().hash(_errors),
    const DeepCollectionEquality().hash(_processedUserIds),
  );

  /// Create a copy of BulkActionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BulkActionResultImplCopyWith<_$BulkActionResultImpl> get copyWith =>
      __$$BulkActionResultImplCopyWithImpl<_$BulkActionResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BulkActionResultImplToJson(this);
  }
}

abstract class _BulkActionResult implements BulkActionResult {
  const factory _BulkActionResult({
    required final int successCount,
    required final int failedCount,
    required final List<String> errors,
    required final List<String> processedUserIds,
  }) = _$BulkActionResultImpl;

  factory _BulkActionResult.fromJson(Map<String, dynamic> json) =
      _$BulkActionResultImpl.fromJson;

  @override
  int get successCount;
  @override
  int get failedCount;
  @override
  List<String> get errors;
  @override
  List<String> get processedUserIds;

  /// Create a copy of BulkActionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BulkActionResultImplCopyWith<_$BulkActionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AdminUser _$AdminUserFromJson(Map<String, dynamic> json) {
  return _AdminUser.fromJson(json);
}

/// @nodoc
mixin _$AdminUser {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  bool get isStaff => throw _privateConstructorUsedError;
  bool get isSuperuser => throw _privateConstructorUsedError;
  List<AdminPermission> get permissions => throw _privateConstructorUsedError;
  DateTime? get lastLogin => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AdminUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminUserCopyWith<AdminUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminUserCopyWith<$Res> {
  factory $AdminUserCopyWith(AdminUser value, $Res Function(AdminUser) then) =
      _$AdminUserCopyWithImpl<$Res, AdminUser>;
  @useResult
  $Res call({
    String id,
    String username,
    String email,
    String firstName,
    String lastName,
    bool isStaff,
    bool isSuperuser,
    List<AdminPermission> permissions,
    DateTime? lastLogin,
    DateTime createdAt,
  });
}

/// @nodoc
class _$AdminUserCopyWithImpl<$Res, $Val extends AdminUser>
    implements $AdminUserCopyWith<$Res> {
  _$AdminUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? isStaff = null,
    Object? isSuperuser = null,
    Object? permissions = null,
    Object? lastLogin = freezed,
    Object? createdAt = null,
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
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            isStaff: null == isStaff
                ? _value.isStaff
                : isStaff // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSuperuser: null == isSuperuser
                ? _value.isSuperuser
                : isSuperuser // ignore: cast_nullable_to_non_nullable
                      as bool,
            permissions: null == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as List<AdminPermission>,
            lastLogin: freezed == lastLogin
                ? _value.lastLogin
                : lastLogin // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
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
abstract class _$$AdminUserImplCopyWith<$Res>
    implements $AdminUserCopyWith<$Res> {
  factory _$$AdminUserImplCopyWith(
    _$AdminUserImpl value,
    $Res Function(_$AdminUserImpl) then,
  ) = __$$AdminUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String username,
    String email,
    String firstName,
    String lastName,
    bool isStaff,
    bool isSuperuser,
    List<AdminPermission> permissions,
    DateTime? lastLogin,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$AdminUserImplCopyWithImpl<$Res>
    extends _$AdminUserCopyWithImpl<$Res, _$AdminUserImpl>
    implements _$$AdminUserImplCopyWith<$Res> {
  __$$AdminUserImplCopyWithImpl(
    _$AdminUserImpl _value,
    $Res Function(_$AdminUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AdminUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? isStaff = null,
    Object? isSuperuser = null,
    Object? permissions = null,
    Object? lastLogin = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$AdminUserImpl(
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
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        isStaff: null == isStaff
            ? _value.isStaff
            : isStaff // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSuperuser: null == isSuperuser
            ? _value.isSuperuser
            : isSuperuser // ignore: cast_nullable_to_non_nullable
                  as bool,
        permissions: null == permissions
            ? _value._permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as List<AdminPermission>,
        lastLogin: freezed == lastLogin
            ? _value.lastLogin
            : lastLogin // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
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
class _$AdminUserImpl implements _AdminUser {
  const _$AdminUserImpl({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isStaff,
    required this.isSuperuser,
    required final List<AdminPermission> permissions,
    this.lastLogin,
    required this.createdAt,
  }) : _permissions = permissions;

  factory _$AdminUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminUserImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final bool isStaff;
  @override
  final bool isSuperuser;
  final List<AdminPermission> _permissions;
  @override
  List<AdminPermission> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  final DateTime? lastLogin;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'AdminUser(id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName, isStaff: $isStaff, isSuperuser: $isSuperuser, permissions: $permissions, lastLogin: $lastLogin, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.isStaff, isStaff) || other.isStaff == isStaff) &&
            (identical(other.isSuperuser, isSuperuser) ||
                other.isSuperuser == isSuperuser) &&
            const DeepCollectionEquality().equals(
              other._permissions,
              _permissions,
            ) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    username,
    email,
    firstName,
    lastName,
    isStaff,
    isSuperuser,
    const DeepCollectionEquality().hash(_permissions),
    lastLogin,
    createdAt,
  );

  /// Create a copy of AdminUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminUserImplCopyWith<_$AdminUserImpl> get copyWith =>
      __$$AdminUserImplCopyWithImpl<_$AdminUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminUserImplToJson(this);
  }
}

abstract class _AdminUser implements AdminUser {
  const factory _AdminUser({
    required final String id,
    required final String username,
    required final String email,
    required final String firstName,
    required final String lastName,
    required final bool isStaff,
    required final bool isSuperuser,
    required final List<AdminPermission> permissions,
    final DateTime? lastLogin,
    required final DateTime createdAt,
  }) = _$AdminUserImpl;

  factory _AdminUser.fromJson(Map<String, dynamic> json) =
      _$AdminUserImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  bool get isStaff;
  @override
  bool get isSuperuser;
  @override
  List<AdminPermission> get permissions;
  @override
  DateTime? get lastLogin;
  @override
  DateTime get createdAt;

  /// Create a copy of AdminUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminUserImplCopyWith<_$AdminUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SystemHealth _$SystemHealthFromJson(Map<String, dynamic> json) {
  return _SystemHealth.fromJson(json);
}

/// @nodoc
mixin _$SystemHealth {
  bool get isHealthy => throw _privateConstructorUsedError;
  Map<String, ServiceStatus> get services => throw _privateConstructorUsedError;
  DatabaseStatus get database => throw _privateConstructorUsedError;
  CacheStatus get cache => throw _privateConstructorUsedError;
  WebSocketStatus get websocket => throw _privateConstructorUsedError;
  DateTime get lastChecked => throw _privateConstructorUsedError;

  /// Serializes this SystemHealth to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SystemHealth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SystemHealthCopyWith<SystemHealth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemHealthCopyWith<$Res> {
  factory $SystemHealthCopyWith(
    SystemHealth value,
    $Res Function(SystemHealth) then,
  ) = _$SystemHealthCopyWithImpl<$Res, SystemHealth>;
  @useResult
  $Res call({
    bool isHealthy,
    Map<String, ServiceStatus> services,
    DatabaseStatus database,
    CacheStatus cache,
    WebSocketStatus websocket,
    DateTime lastChecked,
  });

  $DatabaseStatusCopyWith<$Res> get database;
  $CacheStatusCopyWith<$Res> get cache;
  $WebSocketStatusCopyWith<$Res> get websocket;
}

/// @nodoc
class _$SystemHealthCopyWithImpl<$Res, $Val extends SystemHealth>
    implements $SystemHealthCopyWith<$Res> {
  _$SystemHealthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SystemHealth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isHealthy = null,
    Object? services = null,
    Object? database = null,
    Object? cache = null,
    Object? websocket = null,
    Object? lastChecked = null,
  }) {
    return _then(
      _value.copyWith(
            isHealthy: null == isHealthy
                ? _value.isHealthy
                : isHealthy // ignore: cast_nullable_to_non_nullable
                      as bool,
            services: null == services
                ? _value.services
                : services // ignore: cast_nullable_to_non_nullable
                      as Map<String, ServiceStatus>,
            database: null == database
                ? _value.database
                : database // ignore: cast_nullable_to_non_nullable
                      as DatabaseStatus,
            cache: null == cache
                ? _value.cache
                : cache // ignore: cast_nullable_to_non_nullable
                      as CacheStatus,
            websocket: null == websocket
                ? _value.websocket
                : websocket // ignore: cast_nullable_to_non_nullable
                      as WebSocketStatus,
            lastChecked: null == lastChecked
                ? _value.lastChecked
                : lastChecked // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of SystemHealth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DatabaseStatusCopyWith<$Res> get database {
    return $DatabaseStatusCopyWith<$Res>(_value.database, (value) {
      return _then(_value.copyWith(database: value) as $Val);
    });
  }

  /// Create a copy of SystemHealth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CacheStatusCopyWith<$Res> get cache {
    return $CacheStatusCopyWith<$Res>(_value.cache, (value) {
      return _then(_value.copyWith(cache: value) as $Val);
    });
  }

  /// Create a copy of SystemHealth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WebSocketStatusCopyWith<$Res> get websocket {
    return $WebSocketStatusCopyWith<$Res>(_value.websocket, (value) {
      return _then(_value.copyWith(websocket: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SystemHealthImplCopyWith<$Res>
    implements $SystemHealthCopyWith<$Res> {
  factory _$$SystemHealthImplCopyWith(
    _$SystemHealthImpl value,
    $Res Function(_$SystemHealthImpl) then,
  ) = __$$SystemHealthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isHealthy,
    Map<String, ServiceStatus> services,
    DatabaseStatus database,
    CacheStatus cache,
    WebSocketStatus websocket,
    DateTime lastChecked,
  });

  @override
  $DatabaseStatusCopyWith<$Res> get database;
  @override
  $CacheStatusCopyWith<$Res> get cache;
  @override
  $WebSocketStatusCopyWith<$Res> get websocket;
}

/// @nodoc
class __$$SystemHealthImplCopyWithImpl<$Res>
    extends _$SystemHealthCopyWithImpl<$Res, _$SystemHealthImpl>
    implements _$$SystemHealthImplCopyWith<$Res> {
  __$$SystemHealthImplCopyWithImpl(
    _$SystemHealthImpl _value,
    $Res Function(_$SystemHealthImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SystemHealth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isHealthy = null,
    Object? services = null,
    Object? database = null,
    Object? cache = null,
    Object? websocket = null,
    Object? lastChecked = null,
  }) {
    return _then(
      _$SystemHealthImpl(
        isHealthy: null == isHealthy
            ? _value.isHealthy
            : isHealthy // ignore: cast_nullable_to_non_nullable
                  as bool,
        services: null == services
            ? _value._services
            : services // ignore: cast_nullable_to_non_nullable
                  as Map<String, ServiceStatus>,
        database: null == database
            ? _value.database
            : database // ignore: cast_nullable_to_non_nullable
                  as DatabaseStatus,
        cache: null == cache
            ? _value.cache
            : cache // ignore: cast_nullable_to_non_nullable
                  as CacheStatus,
        websocket: null == websocket
            ? _value.websocket
            : websocket // ignore: cast_nullable_to_non_nullable
                  as WebSocketStatus,
        lastChecked: null == lastChecked
            ? _value.lastChecked
            : lastChecked // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SystemHealthImpl implements _SystemHealth {
  const _$SystemHealthImpl({
    required this.isHealthy,
    required final Map<String, ServiceStatus> services,
    required this.database,
    required this.cache,
    required this.websocket,
    required this.lastChecked,
  }) : _services = services;

  factory _$SystemHealthImpl.fromJson(Map<String, dynamic> json) =>
      _$$SystemHealthImplFromJson(json);

  @override
  final bool isHealthy;
  final Map<String, ServiceStatus> _services;
  @override
  Map<String, ServiceStatus> get services {
    if (_services is EqualUnmodifiableMapView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_services);
  }

  @override
  final DatabaseStatus database;
  @override
  final CacheStatus cache;
  @override
  final WebSocketStatus websocket;
  @override
  final DateTime lastChecked;

  @override
  String toString() {
    return 'SystemHealth(isHealthy: $isHealthy, services: $services, database: $database, cache: $cache, websocket: $websocket, lastChecked: $lastChecked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemHealthImpl &&
            (identical(other.isHealthy, isHealthy) ||
                other.isHealthy == isHealthy) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.database, database) ||
                other.database == database) &&
            (identical(other.cache, cache) || other.cache == cache) &&
            (identical(other.websocket, websocket) ||
                other.websocket == websocket) &&
            (identical(other.lastChecked, lastChecked) ||
                other.lastChecked == lastChecked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isHealthy,
    const DeepCollectionEquality().hash(_services),
    database,
    cache,
    websocket,
    lastChecked,
  );

  /// Create a copy of SystemHealth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemHealthImplCopyWith<_$SystemHealthImpl> get copyWith =>
      __$$SystemHealthImplCopyWithImpl<_$SystemHealthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SystemHealthImplToJson(this);
  }
}

abstract class _SystemHealth implements SystemHealth {
  const factory _SystemHealth({
    required final bool isHealthy,
    required final Map<String, ServiceStatus> services,
    required final DatabaseStatus database,
    required final CacheStatus cache,
    required final WebSocketStatus websocket,
    required final DateTime lastChecked,
  }) = _$SystemHealthImpl;

  factory _SystemHealth.fromJson(Map<String, dynamic> json) =
      _$SystemHealthImpl.fromJson;

  @override
  bool get isHealthy;
  @override
  Map<String, ServiceStatus> get services;
  @override
  DatabaseStatus get database;
  @override
  CacheStatus get cache;
  @override
  WebSocketStatus get websocket;
  @override
  DateTime get lastChecked;

  /// Create a copy of SystemHealth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SystemHealthImplCopyWith<_$SystemHealthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceStatus _$ServiceStatusFromJson(Map<String, dynamic> json) {
  return _ServiceStatus.fromJson(json);
}

/// @nodoc
mixin _$ServiceStatus {
  String get name => throw _privateConstructorUsedError;
  bool get isUp => throw _privateConstructorUsedError;
  int get responseTimeMs => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  DateTime get lastChecked => throw _privateConstructorUsedError;

  /// Serializes this ServiceStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceStatusCopyWith<ServiceStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceStatusCopyWith<$Res> {
  factory $ServiceStatusCopyWith(
    ServiceStatus value,
    $Res Function(ServiceStatus) then,
  ) = _$ServiceStatusCopyWithImpl<$Res, ServiceStatus>;
  @useResult
  $Res call({
    String name,
    bool isUp,
    int responseTimeMs,
    String? error,
    DateTime lastChecked,
  });
}

/// @nodoc
class _$ServiceStatusCopyWithImpl<$Res, $Val extends ServiceStatus>
    implements $ServiceStatusCopyWith<$Res> {
  _$ServiceStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isUp = null,
    Object? responseTimeMs = null,
    Object? error = freezed,
    Object? lastChecked = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            isUp: null == isUp
                ? _value.isUp
                : isUp // ignore: cast_nullable_to_non_nullable
                      as bool,
            responseTimeMs: null == responseTimeMs
                ? _value.responseTimeMs
                : responseTimeMs // ignore: cast_nullable_to_non_nullable
                      as int,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastChecked: null == lastChecked
                ? _value.lastChecked
                : lastChecked // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ServiceStatusImplCopyWith<$Res>
    implements $ServiceStatusCopyWith<$Res> {
  factory _$$ServiceStatusImplCopyWith(
    _$ServiceStatusImpl value,
    $Res Function(_$ServiceStatusImpl) then,
  ) = __$$ServiceStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    bool isUp,
    int responseTimeMs,
    String? error,
    DateTime lastChecked,
  });
}

/// @nodoc
class __$$ServiceStatusImplCopyWithImpl<$Res>
    extends _$ServiceStatusCopyWithImpl<$Res, _$ServiceStatusImpl>
    implements _$$ServiceStatusImplCopyWith<$Res> {
  __$$ServiceStatusImplCopyWithImpl(
    _$ServiceStatusImpl _value,
    $Res Function(_$ServiceStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServiceStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isUp = null,
    Object? responseTimeMs = null,
    Object? error = freezed,
    Object? lastChecked = null,
  }) {
    return _then(
      _$ServiceStatusImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        isUp: null == isUp
            ? _value.isUp
            : isUp // ignore: cast_nullable_to_non_nullable
                  as bool,
        responseTimeMs: null == responseTimeMs
            ? _value.responseTimeMs
            : responseTimeMs // ignore: cast_nullable_to_non_nullable
                  as int,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastChecked: null == lastChecked
            ? _value.lastChecked
            : lastChecked // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceStatusImpl implements _ServiceStatus {
  const _$ServiceStatusImpl({
    required this.name,
    required this.isUp,
    required this.responseTimeMs,
    this.error,
    required this.lastChecked,
  });

  factory _$ServiceStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceStatusImplFromJson(json);

  @override
  final String name;
  @override
  final bool isUp;
  @override
  final int responseTimeMs;
  @override
  final String? error;
  @override
  final DateTime lastChecked;

  @override
  String toString() {
    return 'ServiceStatus(name: $name, isUp: $isUp, responseTimeMs: $responseTimeMs, error: $error, lastChecked: $lastChecked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceStatusImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isUp, isUp) || other.isUp == isUp) &&
            (identical(other.responseTimeMs, responseTimeMs) ||
                other.responseTimeMs == responseTimeMs) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.lastChecked, lastChecked) ||
                other.lastChecked == lastChecked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, isUp, responseTimeMs, error, lastChecked);

  /// Create a copy of ServiceStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceStatusImplCopyWith<_$ServiceStatusImpl> get copyWith =>
      __$$ServiceStatusImplCopyWithImpl<_$ServiceStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceStatusImplToJson(this);
  }
}

abstract class _ServiceStatus implements ServiceStatus {
  const factory _ServiceStatus({
    required final String name,
    required final bool isUp,
    required final int responseTimeMs,
    final String? error,
    required final DateTime lastChecked,
  }) = _$ServiceStatusImpl;

  factory _ServiceStatus.fromJson(Map<String, dynamic> json) =
      _$ServiceStatusImpl.fromJson;

  @override
  String get name;
  @override
  bool get isUp;
  @override
  int get responseTimeMs;
  @override
  String? get error;
  @override
  DateTime get lastChecked;

  /// Create a copy of ServiceStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceStatusImplCopyWith<_$ServiceStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DatabaseStatus _$DatabaseStatusFromJson(Map<String, dynamic> json) {
  return _DatabaseStatus.fromJson(json);
}

/// @nodoc
mixin _$DatabaseStatus {
  bool get isConnected => throw _privateConstructorUsedError;
  int get connectionCount => throw _privateConstructorUsedError;
  int get queryCount => throw _privateConstructorUsedError;
  double get avgQueryTime => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this DatabaseStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DatabaseStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DatabaseStatusCopyWith<DatabaseStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabaseStatusCopyWith<$Res> {
  factory $DatabaseStatusCopyWith(
    DatabaseStatus value,
    $Res Function(DatabaseStatus) then,
  ) = _$DatabaseStatusCopyWithImpl<$Res, DatabaseStatus>;
  @useResult
  $Res call({
    bool isConnected,
    int connectionCount,
    int queryCount,
    double avgQueryTime,
    String? error,
  });
}

/// @nodoc
class _$DatabaseStatusCopyWithImpl<$Res, $Val extends DatabaseStatus>
    implements $DatabaseStatusCopyWith<$Res> {
  _$DatabaseStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DatabaseStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
    Object? connectionCount = null,
    Object? queryCount = null,
    Object? avgQueryTime = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            isConnected: null == isConnected
                ? _value.isConnected
                : isConnected // ignore: cast_nullable_to_non_nullable
                      as bool,
            connectionCount: null == connectionCount
                ? _value.connectionCount
                : connectionCount // ignore: cast_nullable_to_non_nullable
                      as int,
            queryCount: null == queryCount
                ? _value.queryCount
                : queryCount // ignore: cast_nullable_to_non_nullable
                      as int,
            avgQueryTime: null == avgQueryTime
                ? _value.avgQueryTime
                : avgQueryTime // ignore: cast_nullable_to_non_nullable
                      as double,
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
abstract class _$$DatabaseStatusImplCopyWith<$Res>
    implements $DatabaseStatusCopyWith<$Res> {
  factory _$$DatabaseStatusImplCopyWith(
    _$DatabaseStatusImpl value,
    $Res Function(_$DatabaseStatusImpl) then,
  ) = __$$DatabaseStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isConnected,
    int connectionCount,
    int queryCount,
    double avgQueryTime,
    String? error,
  });
}

/// @nodoc
class __$$DatabaseStatusImplCopyWithImpl<$Res>
    extends _$DatabaseStatusCopyWithImpl<$Res, _$DatabaseStatusImpl>
    implements _$$DatabaseStatusImplCopyWith<$Res> {
  __$$DatabaseStatusImplCopyWithImpl(
    _$DatabaseStatusImpl _value,
    $Res Function(_$DatabaseStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DatabaseStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
    Object? connectionCount = null,
    Object? queryCount = null,
    Object? avgQueryTime = null,
    Object? error = freezed,
  }) {
    return _then(
      _$DatabaseStatusImpl(
        isConnected: null == isConnected
            ? _value.isConnected
            : isConnected // ignore: cast_nullable_to_non_nullable
                  as bool,
        connectionCount: null == connectionCount
            ? _value.connectionCount
            : connectionCount // ignore: cast_nullable_to_non_nullable
                  as int,
        queryCount: null == queryCount
            ? _value.queryCount
            : queryCount // ignore: cast_nullable_to_non_nullable
                  as int,
        avgQueryTime: null == avgQueryTime
            ? _value.avgQueryTime
            : avgQueryTime // ignore: cast_nullable_to_non_nullable
                  as double,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DatabaseStatusImpl implements _DatabaseStatus {
  const _$DatabaseStatusImpl({
    required this.isConnected,
    required this.connectionCount,
    required this.queryCount,
    required this.avgQueryTime,
    this.error,
  });

  factory _$DatabaseStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatabaseStatusImplFromJson(json);

  @override
  final bool isConnected;
  @override
  final int connectionCount;
  @override
  final int queryCount;
  @override
  final double avgQueryTime;
  @override
  final String? error;

  @override
  String toString() {
    return 'DatabaseStatus(isConnected: $isConnected, connectionCount: $connectionCount, queryCount: $queryCount, avgQueryTime: $avgQueryTime, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseStatusImpl &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.connectionCount, connectionCount) ||
                other.connectionCount == connectionCount) &&
            (identical(other.queryCount, queryCount) ||
                other.queryCount == queryCount) &&
            (identical(other.avgQueryTime, avgQueryTime) ||
                other.avgQueryTime == avgQueryTime) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isConnected,
    connectionCount,
    queryCount,
    avgQueryTime,
    error,
  );

  /// Create a copy of DatabaseStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseStatusImplCopyWith<_$DatabaseStatusImpl> get copyWith =>
      __$$DatabaseStatusImplCopyWithImpl<_$DatabaseStatusImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DatabaseStatusImplToJson(this);
  }
}

abstract class _DatabaseStatus implements DatabaseStatus {
  const factory _DatabaseStatus({
    required final bool isConnected,
    required final int connectionCount,
    required final int queryCount,
    required final double avgQueryTime,
    final String? error,
  }) = _$DatabaseStatusImpl;

  factory _DatabaseStatus.fromJson(Map<String, dynamic> json) =
      _$DatabaseStatusImpl.fromJson;

  @override
  bool get isConnected;
  @override
  int get connectionCount;
  @override
  int get queryCount;
  @override
  double get avgQueryTime;
  @override
  String? get error;

  /// Create a copy of DatabaseStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatabaseStatusImplCopyWith<_$DatabaseStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CacheStatus _$CacheStatusFromJson(Map<String, dynamic> json) {
  return _CacheStatus.fromJson(json);
}

/// @nodoc
mixin _$CacheStatus {
  bool get isConnected => throw _privateConstructorUsedError;
  int get hitRate => throw _privateConstructorUsedError;
  int get keyCount => throw _privateConstructorUsedError;
  String get memoryUsage => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this CacheStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CacheStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CacheStatusCopyWith<CacheStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CacheStatusCopyWith<$Res> {
  factory $CacheStatusCopyWith(
    CacheStatus value,
    $Res Function(CacheStatus) then,
  ) = _$CacheStatusCopyWithImpl<$Res, CacheStatus>;
  @useResult
  $Res call({
    bool isConnected,
    int hitRate,
    int keyCount,
    String memoryUsage,
    String? error,
  });
}

/// @nodoc
class _$CacheStatusCopyWithImpl<$Res, $Val extends CacheStatus>
    implements $CacheStatusCopyWith<$Res> {
  _$CacheStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CacheStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
    Object? hitRate = null,
    Object? keyCount = null,
    Object? memoryUsage = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            isConnected: null == isConnected
                ? _value.isConnected
                : isConnected // ignore: cast_nullable_to_non_nullable
                      as bool,
            hitRate: null == hitRate
                ? _value.hitRate
                : hitRate // ignore: cast_nullable_to_non_nullable
                      as int,
            keyCount: null == keyCount
                ? _value.keyCount
                : keyCount // ignore: cast_nullable_to_non_nullable
                      as int,
            memoryUsage: null == memoryUsage
                ? _value.memoryUsage
                : memoryUsage // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$CacheStatusImplCopyWith<$Res>
    implements $CacheStatusCopyWith<$Res> {
  factory _$$CacheStatusImplCopyWith(
    _$CacheStatusImpl value,
    $Res Function(_$CacheStatusImpl) then,
  ) = __$$CacheStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isConnected,
    int hitRate,
    int keyCount,
    String memoryUsage,
    String? error,
  });
}

/// @nodoc
class __$$CacheStatusImplCopyWithImpl<$Res>
    extends _$CacheStatusCopyWithImpl<$Res, _$CacheStatusImpl>
    implements _$$CacheStatusImplCopyWith<$Res> {
  __$$CacheStatusImplCopyWithImpl(
    _$CacheStatusImpl _value,
    $Res Function(_$CacheStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CacheStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
    Object? hitRate = null,
    Object? keyCount = null,
    Object? memoryUsage = null,
    Object? error = freezed,
  }) {
    return _then(
      _$CacheStatusImpl(
        isConnected: null == isConnected
            ? _value.isConnected
            : isConnected // ignore: cast_nullable_to_non_nullable
                  as bool,
        hitRate: null == hitRate
            ? _value.hitRate
            : hitRate // ignore: cast_nullable_to_non_nullable
                  as int,
        keyCount: null == keyCount
            ? _value.keyCount
            : keyCount // ignore: cast_nullable_to_non_nullable
                  as int,
        memoryUsage: null == memoryUsage
            ? _value.memoryUsage
            : memoryUsage // ignore: cast_nullable_to_non_nullable
                  as String,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CacheStatusImpl implements _CacheStatus {
  const _$CacheStatusImpl({
    required this.isConnected,
    required this.hitRate,
    required this.keyCount,
    required this.memoryUsage,
    this.error,
  });

  factory _$CacheStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$CacheStatusImplFromJson(json);

  @override
  final bool isConnected;
  @override
  final int hitRate;
  @override
  final int keyCount;
  @override
  final String memoryUsage;
  @override
  final String? error;

  @override
  String toString() {
    return 'CacheStatus(isConnected: $isConnected, hitRate: $hitRate, keyCount: $keyCount, memoryUsage: $memoryUsage, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheStatusImpl &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.hitRate, hitRate) || other.hitRate == hitRate) &&
            (identical(other.keyCount, keyCount) ||
                other.keyCount == keyCount) &&
            (identical(other.memoryUsage, memoryUsage) ||
                other.memoryUsage == memoryUsage) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isConnected,
    hitRate,
    keyCount,
    memoryUsage,
    error,
  );

  /// Create a copy of CacheStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheStatusImplCopyWith<_$CacheStatusImpl> get copyWith =>
      __$$CacheStatusImplCopyWithImpl<_$CacheStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CacheStatusImplToJson(this);
  }
}

abstract class _CacheStatus implements CacheStatus {
  const factory _CacheStatus({
    required final bool isConnected,
    required final int hitRate,
    required final int keyCount,
    required final String memoryUsage,
    final String? error,
  }) = _$CacheStatusImpl;

  factory _CacheStatus.fromJson(Map<String, dynamic> json) =
      _$CacheStatusImpl.fromJson;

  @override
  bool get isConnected;
  @override
  int get hitRate;
  @override
  int get keyCount;
  @override
  String get memoryUsage;
  @override
  String? get error;

  /// Create a copy of CacheStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CacheStatusImplCopyWith<_$CacheStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WebSocketStatus _$WebSocketStatusFromJson(Map<String, dynamic> json) {
  return _WebSocketStatus.fromJson(json);
}

/// @nodoc
mixin _$WebSocketStatus {
  bool get isRunning => throw _privateConstructorUsedError;
  int get activeConnections => throw _privateConstructorUsedError;
  int get totalMessages => throw _privateConstructorUsedError;
  double get avgLatency => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this WebSocketStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WebSocketStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WebSocketStatusCopyWith<WebSocketStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebSocketStatusCopyWith<$Res> {
  factory $WebSocketStatusCopyWith(
    WebSocketStatus value,
    $Res Function(WebSocketStatus) then,
  ) = _$WebSocketStatusCopyWithImpl<$Res, WebSocketStatus>;
  @useResult
  $Res call({
    bool isRunning,
    int activeConnections,
    int totalMessages,
    double avgLatency,
    String? error,
  });
}

/// @nodoc
class _$WebSocketStatusCopyWithImpl<$Res, $Val extends WebSocketStatus>
    implements $WebSocketStatusCopyWith<$Res> {
  _$WebSocketStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WebSocketStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRunning = null,
    Object? activeConnections = null,
    Object? totalMessages = null,
    Object? avgLatency = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            isRunning: null == isRunning
                ? _value.isRunning
                : isRunning // ignore: cast_nullable_to_non_nullable
                      as bool,
            activeConnections: null == activeConnections
                ? _value.activeConnections
                : activeConnections // ignore: cast_nullable_to_non_nullable
                      as int,
            totalMessages: null == totalMessages
                ? _value.totalMessages
                : totalMessages // ignore: cast_nullable_to_non_nullable
                      as int,
            avgLatency: null == avgLatency
                ? _value.avgLatency
                : avgLatency // ignore: cast_nullable_to_non_nullable
                      as double,
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
abstract class _$$WebSocketStatusImplCopyWith<$Res>
    implements $WebSocketStatusCopyWith<$Res> {
  factory _$$WebSocketStatusImplCopyWith(
    _$WebSocketStatusImpl value,
    $Res Function(_$WebSocketStatusImpl) then,
  ) = __$$WebSocketStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isRunning,
    int activeConnections,
    int totalMessages,
    double avgLatency,
    String? error,
  });
}

/// @nodoc
class __$$WebSocketStatusImplCopyWithImpl<$Res>
    extends _$WebSocketStatusCopyWithImpl<$Res, _$WebSocketStatusImpl>
    implements _$$WebSocketStatusImplCopyWith<$Res> {
  __$$WebSocketStatusImplCopyWithImpl(
    _$WebSocketStatusImpl _value,
    $Res Function(_$WebSocketStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WebSocketStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRunning = null,
    Object? activeConnections = null,
    Object? totalMessages = null,
    Object? avgLatency = null,
    Object? error = freezed,
  }) {
    return _then(
      _$WebSocketStatusImpl(
        isRunning: null == isRunning
            ? _value.isRunning
            : isRunning // ignore: cast_nullable_to_non_nullable
                  as bool,
        activeConnections: null == activeConnections
            ? _value.activeConnections
            : activeConnections // ignore: cast_nullable_to_non_nullable
                  as int,
        totalMessages: null == totalMessages
            ? _value.totalMessages
            : totalMessages // ignore: cast_nullable_to_non_nullable
                  as int,
        avgLatency: null == avgLatency
            ? _value.avgLatency
            : avgLatency // ignore: cast_nullable_to_non_nullable
                  as double,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WebSocketStatusImpl implements _WebSocketStatus {
  const _$WebSocketStatusImpl({
    required this.isRunning,
    required this.activeConnections,
    required this.totalMessages,
    required this.avgLatency,
    this.error,
  });

  factory _$WebSocketStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$WebSocketStatusImplFromJson(json);

  @override
  final bool isRunning;
  @override
  final int activeConnections;
  @override
  final int totalMessages;
  @override
  final double avgLatency;
  @override
  final String? error;

  @override
  String toString() {
    return 'WebSocketStatus(isRunning: $isRunning, activeConnections: $activeConnections, totalMessages: $totalMessages, avgLatency: $avgLatency, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebSocketStatusImpl &&
            (identical(other.isRunning, isRunning) ||
                other.isRunning == isRunning) &&
            (identical(other.activeConnections, activeConnections) ||
                other.activeConnections == activeConnections) &&
            (identical(other.totalMessages, totalMessages) ||
                other.totalMessages == totalMessages) &&
            (identical(other.avgLatency, avgLatency) ||
                other.avgLatency == avgLatency) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isRunning,
    activeConnections,
    totalMessages,
    avgLatency,
    error,
  );

  /// Create a copy of WebSocketStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WebSocketStatusImplCopyWith<_$WebSocketStatusImpl> get copyWith =>
      __$$WebSocketStatusImplCopyWithImpl<_$WebSocketStatusImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WebSocketStatusImplToJson(this);
  }
}

abstract class _WebSocketStatus implements WebSocketStatus {
  const factory _WebSocketStatus({
    required final bool isRunning,
    required final int activeConnections,
    required final int totalMessages,
    required final double avgLatency,
    final String? error,
  }) = _$WebSocketStatusImpl;

  factory _WebSocketStatus.fromJson(Map<String, dynamic> json) =
      _$WebSocketStatusImpl.fromJson;

  @override
  bool get isRunning;
  @override
  int get activeConnections;
  @override
  int get totalMessages;
  @override
  double get avgLatency;
  @override
  String? get error;

  /// Create a copy of WebSocketStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WebSocketStatusImplCopyWith<_$WebSocketStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
