import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/user_model.dart';
import '../data/admin_repository.dart';
import '../models/admin_model.dart';

class AdminDashboardNotifier extends StateNotifier<AsyncValue<AdminDashboardStats>> {
  final AdminRepository _repository;

  AdminDashboardNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    try {
      state = const AsyncValue.loading();
      final stats = await _repository.getDashboardStats();
      state = AsyncValue.data(stats);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  void refresh() {
    loadDashboard();
  }
}

class PendingUsersNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  final AdminRepository _repository;

  PendingUsersNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadPendingUsers();
  }

  Future<void> loadPendingUsers({
    int page = 1,
    int pageSize = 20,
    String? search,
  }) async {
    try {
      state = const AsyncValue.loading();
      final users = await _repository.getPendingUsers(
        page: page,
        pageSize: pageSize,
        search: search,
      );
      state = AsyncValue.data(users);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<bool> approveUser(String userId, {String? reason}) async {
    try {
      final updatedUser = await _repository.approveUser(userId, reason: reason);
      
      // Remove from pending list
      state.whenData((users) {
        final updatedUsers = users.where((u) => u.id != userId).toList();
        state = AsyncValue.data(updatedUsers);
      });
      
      return true;
    } catch (e) {
      // Handle error but don't change state
      return false;
    }
  }

  Future<bool> rejectUser(String userId, {String? reason}) async {
    try {
      await _repository.rejectUser(userId, reason: reason);
      
      // Remove from pending list
      state.whenData((users) {
        final updatedUsers = users.where((u) => u.id != userId).toList();
        state = AsyncValue.data(updatedUsers);
      });
      
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<BulkActionResult?> performBulkAction(BulkActionRequest request) async {
    try {
      final result = await _repository.performBulkAction(request);
      
      // Remove processed users from list
      state.whenData((users) {
        final updatedUsers = users.where((u) => 
          !result.processedUserIds.contains(u.id)
        ).toList();
        state = AsyncValue.data(updatedUsers);
      });
      
      return result;
    } catch (e) {
      return null;
    }
  }

  void refresh() {
    loadPendingUsers();
  }
}

class AllUsersNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  final AdminRepository _repository;

  AllUsersNotifier(this._repository) : super(const AsyncValue.loading());

  Future<void> loadUsers({
    int page = 1,
    int pageSize = 20,
    String? search,
    UserStatus? status,
  }) async {
    try {
      state = const AsyncValue.loading();
      final users = await _repository.getAllUsers(
        page: page,
        pageSize: pageSize,
        search: search,
        status: status,
      );
      state = AsyncValue.data(users);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<bool> updateUserStatus(String userId, UserApprovalAction action, {String? reason}) async {
    try {
      UserModel? updatedUser;
      
      switch (action) {
        case UserApprovalAction.approve:
          updatedUser = await _repository.approveUser(userId, reason: reason);
          break;
        case UserApprovalAction.reject:
          updatedUser = await _repository.rejectUser(userId, reason: reason);
          break;
        case UserApprovalAction.suspend:
          updatedUser = await _repository.suspendUser(userId, reason: reason);
          break;
        case UserApprovalAction.reactivate:
          updatedUser = await _repository.reactivateUser(userId, reason: reason);
          break;
        case UserApprovalAction.delete:
          await _repository.deleteUser(userId, reason: reason);
          // Remove user from list
          state.whenData((users) {
            final updatedUsers = users.where((u) => u.id != userId).toList();
            state = AsyncValue.data(updatedUsers);
          });
          return true;
      }

      if (updatedUser != null) {
        // Update user in list
        state.whenData((users) {
          final updatedUsers = users.map((u) => 
            u.id == userId ? updatedUser! : u
          ).toList();
          state = AsyncValue.data(updatedUsers);
        });
      }
      
      return true;
    } catch (e) {
      return false;
    }
  }

  void refresh({
    String? search,
    UserStatus? status,
  }) {
    loadUsers(search: search, status: status);
  }
}

class SystemHealthNotifier extends StateNotifier<AsyncValue<SystemHealth>> {
  final AdminRepository _repository;

  SystemHealthNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadSystemHealth();
  }

  Future<void> loadSystemHealth() async {
    try {
      state = const AsyncValue.loading();
      final health = await _repository.getSystemHealth();
      state = AsyncValue.data(health);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  void refresh() {
    loadSystemHealth();
  }
}

class AdminActionsNotifier extends StateNotifier<AsyncValue<List<AdminAction>>> {
  final AdminRepository _repository;

  AdminActionsNotifier(this._repository) : super(const AsyncValue.loading());

  Future<void> loadActions({
    int page = 1,
    int pageSize = 20,
    String? adminId,
    String? action,
  }) async {
    try {
      state = const AsyncValue.loading();
      final actions = await _repository.getAdminActions(
        page: page,
        pageSize: pageSize,
        adminId: adminId,
        action: action,
      );
      state = AsyncValue.data(actions);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  void refresh({
    String? adminId,
    String? action,
  }) {
    loadActions(adminId: adminId, action: action);
  }
}

// Providers
final adminDashboardProvider = StateNotifierProvider<AdminDashboardNotifier, AsyncValue<AdminDashboardStats>>(
  (ref) {
    final repository = ref.watch(adminRepositoryProvider);
    return AdminDashboardNotifier(repository);
  },
);

final pendingUsersProvider = StateNotifierProvider<PendingUsersNotifier, AsyncValue<List<UserModel>>>(
  (ref) {
    final repository = ref.watch(adminRepositoryProvider);
    return PendingUsersNotifier(repository);
  },
);

final allUsersProvider = StateNotifierProvider<AllUsersNotifier, AsyncValue<List<UserModel>>>(
  (ref) {
    final repository = ref.watch(adminRepositoryProvider);
    return AllUsersNotifier(repository);
  },
);

final systemHealthProvider = StateNotifierProvider<SystemHealthNotifier, AsyncValue<SystemHealth>>(
  (ref) {
    final repository = ref.watch(adminRepositoryProvider);
    return SystemHealthNotifier(repository);
  },
);

final adminActionsProvider = StateNotifierProvider<AdminActionsNotifier, AsyncValue<List<AdminAction>>>(
  (ref) {
    final repository = ref.watch(adminRepositoryProvider);
    return AdminActionsNotifier(repository);
  },
);

// Selection providers for bulk operations
final selectedUsersProvider = StateProvider<Set<String>>((ref) => {});

final userSearchProvider = StateProvider<String?>((ref) => null);

final userStatusFilterProvider = StateProvider<UserStatus?>((ref) => null);