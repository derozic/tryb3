import 'package:freezed_annotation/freezed_annotation.dart';
import '../../shared/models/user_model.dart';

part 'admin_model.freezed.dart';
part 'admin_model.g.dart';

@freezed
class AdminDashboardStats with _$AdminDashboardStats {
  const factory AdminDashboardStats({
    required int totalUsers,
    required int pendingUsers,
    required int approvedUsers,
    required int rejectedUsers,
    required int suspendedUsers,
    required int totalPosts,
    required int totalNotifications,
    required int activeDevices,
    required Map<String, int> usersByDay,
    required Map<String, int> postsByDay,
    required Map<String, int> notificationsByType,
  }) = _AdminDashboardStats;

  factory AdminDashboardStats.fromJson(Map<String, dynamic> json) =>
      _$AdminDashboardStatsFromJson(json);
}

@freezed
class UserApprovalRequest with _$UserApprovalRequest {
  const factory UserApprovalRequest({
    required UserModel user,
    required DateTime requestedAt,
    String? reason,
    String? adminNotes,
  }) = _UserApprovalRequest;

  factory UserApprovalRequest.fromJson(Map<String, dynamic> json) =>
      _$UserApprovalRequestFromJson(json);
}

@freezed
class AdminAction with _$AdminAction {
  const factory AdminAction({
    required String id,
    required String adminId,
    required String adminUsername,
    required String action,
    required String targetType,
    required String targetId,
    String? reason,
    String? details,
    required DateTime createdAt,
  }) = _AdminAction;

  factory AdminAction.fromJson(Map<String, dynamic> json) =>
      _$AdminActionFromJson(json);
}

@freezed
class BulkActionRequest with _$BulkActionRequest {
  const factory BulkActionRequest({
    required List<String> userIds,
    required UserApprovalAction action,
    String? reason,
  }) = _BulkActionRequest;

  factory BulkActionRequest.fromJson(Map<String, dynamic> json) =>
      _$BulkActionRequestFromJson(json);
}

@freezed
class BulkActionResult with _$BulkActionResult {
  const factory BulkActionResult({
    required int successCount,
    required int failedCount,
    required List<String> errors,
    required List<String> processedUserIds,
  }) = _BulkActionResult;

  factory BulkActionResult.fromJson(Map<String, dynamic> json) =>
      _$BulkActionResultFromJson(json);
}

enum UserApprovalAction {
  approve,
  reject,
  suspend,
  delete,
  reactivate,
}

enum AdminPermission {
  userManagement,
  postModeration,
  systemSettings,
  analytics,
  notifications,
}

@freezed
class AdminUser with _$AdminUser {
  const factory AdminUser({
    required String id,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required bool isStaff,
    required bool isSuperuser,
    required List<AdminPermission> permissions,
    DateTime? lastLogin,
    required DateTime createdAt,
  }) = _AdminUser;

  factory AdminUser.fromJson(Map<String, dynamic> json) =>
      _$AdminUserFromJson(json);
}

@freezed
class SystemHealth with _$SystemHealth {
  const factory SystemHealth({
    required bool isHealthy,
    required Map<String, ServiceStatus> services,
    required DatabaseStatus database,
    required CacheStatus cache,
    required WebSocketStatus websocket,
    required DateTime lastChecked,
  }) = _SystemHealth;

  factory SystemHealth.fromJson(Map<String, dynamic> json) =>
      _$SystemHealthFromJson(json);
}

@freezed
class ServiceStatus with _$ServiceStatus {
  const factory ServiceStatus({
    required String name,
    required bool isUp,
    required int responseTimeMs,
    String? error,
    required DateTime lastChecked,
  }) = _ServiceStatus;

  factory ServiceStatus.fromJson(Map<String, dynamic> json) =>
      _$ServiceStatusFromJson(json);
}

@freezed
class DatabaseStatus with _$DatabaseStatus {
  const factory DatabaseStatus({
    required bool isConnected,
    required int connectionCount,
    required int queryCount,
    required double avgQueryTime,
    String? error,
  }) = _DatabaseStatus;

  factory DatabaseStatus.fromJson(Map<String, dynamic> json) =>
      _$DatabaseStatusFromJson(json);
}

@freezed
class CacheStatus with _$CacheStatus {
  const factory CacheStatus({
    required bool isConnected,
    required int hitRate,
    required int keyCount,
    required String memoryUsage,
    String? error,
  }) = _CacheStatus;

  factory CacheStatus.fromJson(Map<String, dynamic> json) =>
      _$CacheStatusFromJson(json);
}

@freezed
class WebSocketStatus with _$WebSocketStatus {
  const factory WebSocketStatus({
    required bool isRunning,
    required int activeConnections,
    required int totalMessages,
    required double avgLatency,
    String? error,
  }) = _WebSocketStatus;

  factory WebSocketStatus.fromJson(Map<String, dynamic> json) =>
      _$WebSocketStatusFromJson(json);
}