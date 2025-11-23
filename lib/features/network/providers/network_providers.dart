import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/network_repository.dart';
import '../models/friend_model.dart';

part 'network_providers.g.dart';

@riverpod
class FriendsList extends _$FriendsList {
  @override
  Future<List<FriendConnection>> build() async {
    final repository = ref.watch(networkRepositoryProvider);
    return repository.getFriends();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final repository = ref.read(networkRepositoryProvider);
    state = await AsyncValue.guard(() => repository.getFriends());
  }

  Future<void> removeFriend(String userId) async {
    final repository = ref.read(networkRepositoryProvider);
    await repository.removeFriend(userId);
    
    state.whenData((friends) {
      final updatedFriends = friends.where((friend) => friend.friendId != userId).toList();
      state = AsyncValue.data(updatedFriends);
    });
  }

  Future<void> blockUser(String userId) async {
    final repository = ref.read(networkRepositoryProvider);
    await repository.blockUser(userId);
    
    state.whenData((friends) {
      final updatedFriends = friends.map((friend) {
        if (friend.friendId == userId) {
          return friend.copyWith(isBlocked: true);
        }
        return friend;
      }).toList();
      state = AsyncValue.data(updatedFriends);
    });
  }

  Future<void> unblockUser(String userId) async {
    final repository = ref.read(networkRepositoryProvider);
    await repository.unblockUser(userId);
    
    state.whenData((friends) {
      final updatedFriends = friends.map((friend) {
        if (friend.friendId == userId) {
          return friend.copyWith(isBlocked: false);
        }
        return friend;
      }).toList();
      state = AsyncValue.data(updatedFriends);
    });
  }

  Future<void> toggleCloseFriend(String userId) async {
    final repository = ref.read(networkRepositoryProvider);
    
    state.whenData((friends) {
      final friend = friends.firstWhere((f) => f.friendId == userId);
      if (friend.isCloseFriend) {
        repository.removeFromCloseFriends(userId);
      } else {
        repository.addToCloseFriends(userId);
      }
      
      final updatedFriends = friends.map((f) {
        if (f.friendId == userId) {
          return f.copyWith(isCloseFriend: !f.isCloseFriend);
        }
        return f;
      }).toList();
      state = AsyncValue.data(updatedFriends);
    });
  }
}

@riverpod
class FriendRequests extends _$FriendRequests {
  @override
  Future<List<FriendRequest>> build() async {
    final repository = ref.watch(networkRepositoryProvider);
    return repository.getFriendRequests();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final repository = ref.read(networkRepositoryProvider);
    state = await AsyncValue.guard(() => repository.getFriendRequests());
  }

  Future<FriendRequest> sendRequest(SendFriendRequestModel request) async {
    final repository = ref.read(networkRepositoryProvider);
    final friendRequest = await repository.sendFriendRequest(request);
    
    state.whenData((requests) {
      state = AsyncValue.data([friendRequest, ...requests]);
    });
    
    return friendRequest;
  }

  Future<void> acceptRequest(String requestId) async {
    final repository = ref.read(networkRepositoryProvider);
    await repository.acceptFriendRequest(requestId);
    
    state.whenData((requests) {
      final updatedRequests = requests.map((request) {
        if (request.id == requestId) {
          return request.copyWith(
            status: FriendRequestStatus.accepted,
            respondedAt: DateTime.now(),
          );
        }
        return request;
      }).toList();
      state = AsyncValue.data(updatedRequests);
    });
    
    // Refresh friends list
    ref.invalidate(friendsListProvider);
  }

  Future<void> declineRequest(String requestId) async {
    final repository = ref.read(networkRepositoryProvider);
    await repository.declineFriendRequest(requestId);
    
    state.whenData((requests) {
      final updatedRequests = requests.map((request) {
        if (request.id == requestId) {
          return request.copyWith(
            status: FriendRequestStatus.declined,
            respondedAt: DateTime.now(),
          );
        }
        return request;
      }).toList();
      state = AsyncValue.data(updatedRequests);
    });
  }

  Future<void> cancelRequest(String requestId) async {
    final repository = ref.read(networkRepositoryProvider);
    await repository.cancelFriendRequest(requestId);
    
    state.whenData((requests) {
      final updatedRequests = requests.where((request) => request.id != requestId).toList();
      state = AsyncValue.data(updatedRequests);
    });
  }
}

@riverpod
class SentFriendRequests extends _$SentFriendRequests {
  @override
  Future<List<FriendRequest>> build() async {
    final repository = ref.watch(networkRepositoryProvider);
    return repository.getFriendRequests(sent: true);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final repository = ref.read(networkRepositoryProvider);
    state = await AsyncValue.guard(() => repository.getFriendRequests(sent: true));
  }

  Future<void> cancelRequest(String requestId) async {
    final repository = ref.read(networkRepositoryProvider);
    await repository.cancelFriendRequest(requestId);
    
    state.whenData((requests) {
      final updatedRequests = requests.where((request) => request.id != requestId).toList();
      state = AsyncValue.data(updatedRequests);
    });
  }
}

@riverpod
class UserSuggestions extends _$UserSuggestions {
  @override
  Future<List<UserSuggestion>> build() async {
    final repository = ref.watch(networkRepositoryProvider);
    return repository.getUserSuggestions();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final repository = ref.read(networkRepositoryProvider);
    state = await AsyncValue.guard(() => repository.getUserSuggestions());
  }

  Future<void> sendRequest(String userId, String? message) async {
    final repository = ref.read(networkRepositoryProvider);
    final request = SendFriendRequestModel(userId: userId, message: message);
    await repository.sendFriendRequest(request);
    
    state.whenData((suggestions) {
      final updatedSuggestions = suggestions.where((suggestion) => 
          suggestion.user.id != userId).toList();
      state = AsyncValue.data(updatedSuggestions);
    });
    
    // Update friend requests
    ref.invalidate(sentFriendRequestsProvider);
  }

  Future<void> dismissSuggestion(String userId) async {
    final repository = ref.read(networkRepositoryProvider);
    await repository.dismissSuggestion(userId);
    
    state.whenData((suggestions) {
      final updatedSuggestions = suggestions.where((suggestion) => 
          suggestion.user.id != userId).toList();
      state = AsyncValue.data(updatedSuggestions);
    });
  }
}

@riverpod
class NetworkStats extends _$NetworkStats {
  @override
  Future<NetworkStats> build() async {
    final repository = ref.watch(networkRepositoryProvider);
    return repository.getNetworkStats();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final repository = ref.read(networkRepositoryProvider);
    state = await AsyncValue.guard(() => repository.getNetworkStats());
  }
}

@riverpod
class MutualFriends extends _$MutualFriends {
  @override
  Future<List<FriendConnection>> build(String userId) async {
    final repository = ref.watch(networkRepositoryProvider);
    return repository.getMutualFriends(userId);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final repository = ref.read(networkRepositoryProvider);
    state = await AsyncValue.guard(() => repository.getMutualFriends(userId));
  }
}

@riverpod
class BlockedUsers extends _$BlockedUsers {
  @override
  Future<List<FriendConnection>> build() async {
    final repository = ref.watch(networkRepositoryProvider);
    return repository.getBlockedUsers();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final repository = ref.read(networkRepositoryProvider);
    state = await AsyncValue.guard(() => repository.getBlockedUsers());
  }

  Future<void> unblockUser(String userId) async {
    final repository = ref.read(networkRepositoryProvider);
    await repository.unblockUser(userId);
    
    state.whenData((blockedUsers) {
      final updatedBlockedUsers = blockedUsers.where((user) => user.friendId != userId).toList();
      state = AsyncValue.data(updatedBlockedUsers);
    });
    
    // Refresh friends list
    ref.invalidate(friendsListProvider);
  }
}

@riverpod
Stream<FriendRequest> newFriendRequestStream(NewFriendRequestStreamRef ref) {
  final repository = ref.watch(networkRepositoryProvider);
  return repository.friendRequestStream;
}

@riverpod
Stream<Map<String, dynamic>> friendshipUpdateStream(FriendshipUpdateStreamRef ref) {
  final repository = ref.watch(networkRepositoryProvider);
  return repository.friendshipUpdateStream;
}

@riverpod
Stream<Map<String, dynamic>> userOnlineStatusStream(UserOnlineStatusStreamRef ref) {
  final repository = ref.watch(networkRepositoryProvider);
  return repository.userOnlineStatusStream;
}