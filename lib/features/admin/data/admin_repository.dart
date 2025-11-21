import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/api_service.dart';
import '../../../shared/models/user_model.dart';
import '../models/admin_model.dart';

class AdminRepository {
  final ApiService _apiService;

  AdminRepository(this._apiService);

  Future<AdminDashboardStats> getDashboardStats() async {
    try {
      final response = await _apiService.get('/admin/dashboard/stats/');
      return AdminDashboardStats.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch dashboard stats: $e');
    }
  }

  Future<List<UserModel>> getPendingUsers({
    int page = 1,
    int pageSize = 20,
    String? search,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
        'status': 'pending',
        if (search != null && search.isNotEmpty) 'search': search,
      };

      final response = await _apiService.get('/users/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => UserModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch pending users: $e');
    }
  }

  Future<List<UserModel>> getAllUsers({
    int page = 1,
    int pageSize = 20,
    String? search,
    UserStatus? status,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
        if (search != null && search.isNotEmpty) 'search': search,
        if (status != null) 'status': status.name,
      };

      final response = await _apiService.get('/admin/users/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => UserModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }

  Future<UserModel> approveUser(String userId, {String? reason}) async {
    try {
      final data = <String, dynamic>{
        'action': 'approve',
        if (reason != null) 'reason': reason,
      };

      final response = await _apiService.post('/admin/users/$userId/approve/', data: data);
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to approve user: $e');
    }
  }

  Future<UserModel> rejectUser(String userId, {String? reason}) async {
    try {
      final data = <String, dynamic>{
        'action': 'reject',
        if (reason != null) 'reason': reason,
      };

      final response = await _apiService.post('/admin/users/$userId/reject/', data: data);
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to reject user: $e');
    }
  }

  Future<UserModel> suspendUser(String userId, {String? reason}) async {
    try {
      final data = <String, dynamic>{
        'action': 'suspend',
        if (reason != null) 'reason': reason,
      };

      final response = await _apiService.post('/admin/users/$userId/suspend/', data: data);
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to suspend user: $e');
    }
  }

  Future<UserModel> reactivateUser(String userId, {String? reason}) async {
    try {
      final data = <String, dynamic>{
        'action': 'reactivate',
        if (reason != null) 'reason': reason,
      };

      final response = await _apiService.post('/admin/users/$userId/reactivate/', data: data);
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to reactivate user: $e');
    }
  }

  Future<void> deleteUser(String userId, {String? reason}) async {
    try {
      final queryParams = <String, dynamic>{
        if (reason != null) 'reason': reason,
      };

      await _apiService.delete('/admin/users/$userId/', queryParameters: queryParams);
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }

  Future<BulkActionResult> performBulkAction(BulkActionRequest request) async {
    try {
      final response = await _apiService.post('/admin/users/bulk-action/', data: request.toJson());
      return BulkActionResult.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to perform bulk action: $e');
    }
  }

  Future<List<AdminAction>> getAdminActions({
    int page = 1,
    int pageSize = 20,
    String? adminId,
    String? action,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
        if (adminId != null) 'admin_id': adminId,
        if (action != null) 'action': action,
      };

      final response = await _apiService.get('/admin/actions/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => AdminAction.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch admin actions: $e');
    }
  }

  Future<UserModel> getUserDetails(String userId) async {
    try {
      final response = await _apiService.get('/admin/users/$userId/');
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch user details: $e');
    }
  }

  Future<SystemHealth> getSystemHealth() async {
    try {
      final response = await _apiService.get('/admin/system/health/');
      return SystemHealth.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch system health: $e');
    }
  }

  Future<Map<String, dynamic>> getAnalytics({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      
      if (startDate != null) {
        queryParams['start_date'] = startDate.toIso8601String().split('T')[0];
      }
      if (endDate != null) {
        queryParams['end_date'] = endDate.toIso8601String().split('T')[0];
      }

      final response = await _apiService.get('/admin/analytics/', queryParameters: queryParams);
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch analytics: $e');
    }
  }

  Future<void> sendNotificationToUsers({
    required List<String> userIds,
    required String title,
    required String message,
    String? notificationType,
    Map<String, dynamic>? actionData,
  }) async {
    try {
      final data = {
        'user_ids': userIds,
        'title': title,
        'message': message,
        if (notificationType != null) 'notification_type': notificationType,
        if (actionData != null) 'action_data': actionData,
      };

      await _apiService.post('/notifications/admin/create-bulk/', data: data);
    } catch (e) {
      throw Exception('Failed to send notifications: $e');
    }
  }

  Future<void> exportUsers({
    String format = 'csv',
    UserStatus? status,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'format': format,
        if (status != null) 'status': status.name,
        if (startDate != null) 'start_date': startDate.toIso8601String().split('T')[0],
        if (endDate != null) 'end_date': endDate.toIso8601String().split('T')[0],
      };

      await _apiService.get('/admin/users/export/', queryParameters: queryParams);
    } catch (e) {
      throw Exception('Failed to export users: $e');
    }
  }
}

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return AdminRepository(apiService);
});