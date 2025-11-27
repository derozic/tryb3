// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminDashboardStatsImpl _$$AdminDashboardStatsImplFromJson(
  Map<String, dynamic> json,
) => _$AdminDashboardStatsImpl(
  totalUsers: (json['totalUsers'] as num).toInt(),
  pendingUsers: (json['pendingUsers'] as num).toInt(),
  approvedUsers: (json['approvedUsers'] as num).toInt(),
  rejectedUsers: (json['rejectedUsers'] as num).toInt(),
  suspendedUsers: (json['suspendedUsers'] as num).toInt(),
  totalPosts: (json['totalPosts'] as num).toInt(),
  totalNotifications: (json['totalNotifications'] as num).toInt(),
  activeDevices: (json['activeDevices'] as num).toInt(),
  usersByDay: Map<String, int>.from(json['usersByDay'] as Map),
  postsByDay: Map<String, int>.from(json['postsByDay'] as Map),
  notificationsByType: Map<String, int>.from(
    json['notificationsByType'] as Map,
  ),
);

Map<String, dynamic> _$$AdminDashboardStatsImplToJson(
  _$AdminDashboardStatsImpl instance,
) => <String, dynamic>{
  'totalUsers': instance.totalUsers,
  'pendingUsers': instance.pendingUsers,
  'approvedUsers': instance.approvedUsers,
  'rejectedUsers': instance.rejectedUsers,
  'suspendedUsers': instance.suspendedUsers,
  'totalPosts': instance.totalPosts,
  'totalNotifications': instance.totalNotifications,
  'activeDevices': instance.activeDevices,
  'usersByDay': instance.usersByDay,
  'postsByDay': instance.postsByDay,
  'notificationsByType': instance.notificationsByType,
};

_$UserApprovalRequestImpl _$$UserApprovalRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UserApprovalRequestImpl(
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  requestedAt: DateTime.parse(json['requestedAt'] as String),
  reason: json['reason'] as String?,
  adminNotes: json['adminNotes'] as String?,
);

Map<String, dynamic> _$$UserApprovalRequestImplToJson(
  _$UserApprovalRequestImpl instance,
) => <String, dynamic>{
  'user': instance.user,
  'requestedAt': instance.requestedAt.toIso8601String(),
  'reason': instance.reason,
  'adminNotes': instance.adminNotes,
};

_$AdminActionImpl _$$AdminActionImplFromJson(Map<String, dynamic> json) =>
    _$AdminActionImpl(
      id: json['id'] as String,
      adminId: json['adminId'] as String,
      adminUsername: json['adminUsername'] as String,
      action: json['action'] as String,
      targetType: json['targetType'] as String,
      targetId: json['targetId'] as String,
      reason: json['reason'] as String?,
      details: json['details'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AdminActionImplToJson(_$AdminActionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'adminId': instance.adminId,
      'adminUsername': instance.adminUsername,
      'action': instance.action,
      'targetType': instance.targetType,
      'targetId': instance.targetId,
      'reason': instance.reason,
      'details': instance.details,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$BulkActionRequestImpl _$$BulkActionRequestImplFromJson(
  Map<String, dynamic> json,
) => _$BulkActionRequestImpl(
  userIds: (json['userIds'] as List<dynamic>).map((e) => e as String).toList(),
  action: $enumDecode(_$UserApprovalActionEnumMap, json['action']),
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$$BulkActionRequestImplToJson(
  _$BulkActionRequestImpl instance,
) => <String, dynamic>{
  'userIds': instance.userIds,
  'action': _$UserApprovalActionEnumMap[instance.action]!,
  'reason': instance.reason,
};

const _$UserApprovalActionEnumMap = {
  UserApprovalAction.approve: 'approve',
  UserApprovalAction.reject: 'reject',
  UserApprovalAction.suspend: 'suspend',
  UserApprovalAction.delete: 'delete',
  UserApprovalAction.reactivate: 'reactivate',
};

_$BulkActionResultImpl _$$BulkActionResultImplFromJson(
  Map<String, dynamic> json,
) => _$BulkActionResultImpl(
  successCount: (json['successCount'] as num).toInt(),
  failedCount: (json['failedCount'] as num).toInt(),
  errors: (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
  processedUserIds: (json['processedUserIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$BulkActionResultImplToJson(
  _$BulkActionResultImpl instance,
) => <String, dynamic>{
  'successCount': instance.successCount,
  'failedCount': instance.failedCount,
  'errors': instance.errors,
  'processedUserIds': instance.processedUserIds,
};

_$AdminUserImpl _$$AdminUserImplFromJson(Map<String, dynamic> json) =>
    _$AdminUserImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      isStaff: json['isStaff'] as bool,
      isSuperuser: json['isSuperuser'] as bool,
      permissions: (json['permissions'] as List<dynamic>)
          .map((e) => $enumDecode(_$AdminPermissionEnumMap, e))
          .toList(),
      lastLogin: json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AdminUserImplToJson(_$AdminUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'isStaff': instance.isStaff,
      'isSuperuser': instance.isSuperuser,
      'permissions': instance.permissions
          .map((e) => _$AdminPermissionEnumMap[e]!)
          .toList(),
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$AdminPermissionEnumMap = {
  AdminPermission.userManagement: 'userManagement',
  AdminPermission.postModeration: 'postModeration',
  AdminPermission.systemSettings: 'systemSettings',
  AdminPermission.analytics: 'analytics',
  AdminPermission.notifications: 'notifications',
};

_$SystemHealthImpl _$$SystemHealthImplFromJson(Map<String, dynamic> json) =>
    _$SystemHealthImpl(
      isHealthy: json['isHealthy'] as bool,
      services: (json['services'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, ServiceStatus.fromJson(e as Map<String, dynamic>)),
      ),
      database: DatabaseStatus.fromJson(
        json['database'] as Map<String, dynamic>,
      ),
      cache: CacheStatus.fromJson(json['cache'] as Map<String, dynamic>),
      websocket: WebSocketStatus.fromJson(
        json['websocket'] as Map<String, dynamic>,
      ),
      lastChecked: DateTime.parse(json['lastChecked'] as String),
    );

Map<String, dynamic> _$$SystemHealthImplToJson(_$SystemHealthImpl instance) =>
    <String, dynamic>{
      'isHealthy': instance.isHealthy,
      'services': instance.services,
      'database': instance.database,
      'cache': instance.cache,
      'websocket': instance.websocket,
      'lastChecked': instance.lastChecked.toIso8601String(),
    };

_$ServiceStatusImpl _$$ServiceStatusImplFromJson(Map<String, dynamic> json) =>
    _$ServiceStatusImpl(
      name: json['name'] as String,
      isUp: json['isUp'] as bool,
      responseTimeMs: (json['responseTimeMs'] as num).toInt(),
      error: json['error'] as String?,
      lastChecked: DateTime.parse(json['lastChecked'] as String),
    );

Map<String, dynamic> _$$ServiceStatusImplToJson(_$ServiceStatusImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isUp': instance.isUp,
      'responseTimeMs': instance.responseTimeMs,
      'error': instance.error,
      'lastChecked': instance.lastChecked.toIso8601String(),
    };

_$DatabaseStatusImpl _$$DatabaseStatusImplFromJson(Map<String, dynamic> json) =>
    _$DatabaseStatusImpl(
      isConnected: json['isConnected'] as bool,
      connectionCount: (json['connectionCount'] as num).toInt(),
      queryCount: (json['queryCount'] as num).toInt(),
      avgQueryTime: (json['avgQueryTime'] as num).toDouble(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$DatabaseStatusImplToJson(
  _$DatabaseStatusImpl instance,
) => <String, dynamic>{
  'isConnected': instance.isConnected,
  'connectionCount': instance.connectionCount,
  'queryCount': instance.queryCount,
  'avgQueryTime': instance.avgQueryTime,
  'error': instance.error,
};

_$CacheStatusImpl _$$CacheStatusImplFromJson(Map<String, dynamic> json) =>
    _$CacheStatusImpl(
      isConnected: json['isConnected'] as bool,
      hitRate: (json['hitRate'] as num).toInt(),
      keyCount: (json['keyCount'] as num).toInt(),
      memoryUsage: json['memoryUsage'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$CacheStatusImplToJson(_$CacheStatusImpl instance) =>
    <String, dynamic>{
      'isConnected': instance.isConnected,
      'hitRate': instance.hitRate,
      'keyCount': instance.keyCount,
      'memoryUsage': instance.memoryUsage,
      'error': instance.error,
    };

_$WebSocketStatusImpl _$$WebSocketStatusImplFromJson(
  Map<String, dynamic> json,
) => _$WebSocketStatusImpl(
  isRunning: json['isRunning'] as bool,
  activeConnections: (json['activeConnections'] as num).toInt(),
  totalMessages: (json['totalMessages'] as num).toInt(),
  avgLatency: (json['avgLatency'] as num).toDouble(),
  error: json['error'] as String?,
);

Map<String, dynamic> _$$WebSocketStatusImplToJson(
  _$WebSocketStatusImpl instance,
) => <String, dynamic>{
  'isRunning': instance.isRunning,
  'activeConnections': instance.activeConnections,
  'totalMessages': instance.totalMessages,
  'avgLatency': instance.avgLatency,
  'error': instance.error,
};
