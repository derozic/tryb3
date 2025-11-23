import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../tux/components/tux_button.dart';
import '../../../../tux/theme/tux_spacing.dart';
import '../../providers/network_providers.dart';
import '../widgets/friend_list_item.dart';
import '../widgets/friend_request_item.dart';
import '../widgets/user_suggestion_item.dart';

class NetworkPage extends ConsumerStatefulWidget {
  const NetworkPage({super.key});

  @override
  ConsumerState<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends ConsumerState<NetworkPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final networkStats = ref.watch(networkStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Network'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Search users
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              // TODO: Network settings
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Friends'),
                  const SizedBox(width: TuxSpacing.xs),
                  networkStats.when(
                    data: (stats) => _buildBadge(stats.friendsCount),
                    loading: () => const SizedBox(),
                    error: (_, __) => const SizedBox(),
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Requests'),
                  const SizedBox(width: TuxSpacing.xs),
                  networkStats.when(
                    data: (stats) => _buildBadge(stats.pendingRequestsCount),
                    loading: () => const SizedBox(),
                    error: (_, __) => const SizedBox(),
                  ),
                ],
              ),
            ),
            const Tab(text: 'Suggestions'),
            const Tab(text: 'Blocked'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _FriendsTab(),
          _RequestsTab(),
          _SuggestionsTab(),
          _BlockedTab(),
        ],
      ),
    );
  }

  Widget _buildBadge(int count) {
    if (count == 0) return const SizedBox();
    
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: const BoxConstraints(minWidth: 16),
      child: Text(
        count > 99 ? '99+' : count.toString(),
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _FriendsTab extends ConsumerWidget {
  const _FriendsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friendsAsyncValue = ref.watch(friendsListProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(friendsListProvider.notifier).refresh();
      },
      child: friendsAsyncValue.when(
        data: (friends) {
          if (friends.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people_outline, size: 64, color: Colors.grey),
                  SizedBox(height: TuxSpacing.md),
                  Text(
                    'No friends yet',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: TuxSpacing.sm),
                  Text(
                    'Start connecting with people!',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(TuxSpacing.md),
            itemCount: friends.length,
            separatorBuilder: (context, index) => const SizedBox(height: TuxSpacing.sm),
            itemBuilder: (context, index) {
              return FriendListItem(friend: friends[index]);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: TuxSpacing.md),
              Text('Error: $error'),
              const SizedBox(height: TuxSpacing.md),
              TuxButton(
                label: 'Retry',
                onPressed: () => ref.read(friendsListProvider.notifier).refresh(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RequestsTab extends ConsumerWidget {
  const _RequestsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestsAsyncValue = ref.watch(friendRequestsProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(friendRequestsProvider.notifier).refresh();
      },
      child: requestsAsyncValue.when(
        data: (requests) {
          if (requests.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inbox_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: TuxSpacing.md),
                  Text(
                    'No friend requests',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: TuxSpacing.sm),
                  Text(
                    'Friend requests will appear here',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(TuxSpacing.md),
            itemCount: requests.length,
            separatorBuilder: (context, index) => const SizedBox(height: TuxSpacing.sm),
            itemBuilder: (context, index) {
              return FriendRequestItem(request: requests[index]);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: TuxSpacing.md),
              Text('Error: $error'),
              const SizedBox(height: TuxSpacing.md),
              TuxButton(
                label: 'Retry',
                onPressed: () => ref.read(friendRequestsProvider.notifier).refresh(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SuggestionsTab extends ConsumerWidget {
  const _SuggestionsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionsAsyncValue = ref.watch(userSuggestionsProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(userSuggestionsProvider.notifier).refresh();
      },
      child: suggestionsAsyncValue.when(
        data: (suggestions) {
          if (suggestions.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.explore_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: TuxSpacing.md),
                  Text(
                    'No suggestions',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: TuxSpacing.sm),
                  Text(
                    'Check back later for new suggestions',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(TuxSpacing.md),
            itemCount: suggestions.length,
            separatorBuilder: (context, index) => const SizedBox(height: TuxSpacing.sm),
            itemBuilder: (context, index) {
              return UserSuggestionItem(suggestion: suggestions[index]);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: TuxSpacing.md),
              Text('Error: $error'),
              const SizedBox(height: TuxSpacing.md),
              TuxButton(
                label: 'Retry',
                onPressed: () => ref.read(userSuggestionsProvider.notifier).refresh(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlockedTab extends ConsumerWidget {
  const _BlockedTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blockedAsyncValue = ref.watch(blockedUsersProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(blockedUsersProvider.notifier).refresh();
      },
      child: blockedAsyncValue.when(
        data: (blockedUsers) {
          if (blockedUsers.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.block_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: TuxSpacing.md),
                  Text(
                    'No blocked users',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: TuxSpacing.sm),
                  Text(
                    'Blocked users will appear here',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(TuxSpacing.md),
            itemCount: blockedUsers.length,
            separatorBuilder: (context, index) => const SizedBox(height: TuxSpacing.sm),
            itemBuilder: (context, index) {
              final blockedUser = blockedUsers[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: blockedUser.friend.avatarUrl != null
                        ? NetworkImage(blockedUser.friend.avatarUrl!)
                        : null,
                    child: blockedUser.friend.avatarUrl == null
                        ? Text(blockedUser.friend.name[0].toUpperCase())
                        : null,
                  ),
                  title: Text(blockedUser.friend.name),
                  subtitle: Text('Blocked ${blockedUser.createdAt.toString()}'),
                  trailing: TuxButton(
                    label: 'Unblock',
                    onPressed: () {
                      ref.read(blockedUsersProvider.notifier)
                          .unblockUser(blockedUser.friendId);
                    },
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: TuxSpacing.md),
              Text('Error: $error'),
              const SizedBox(height: TuxSpacing.md),
              TuxButton(
                label: 'Retry',
                onPressed: () => ref.read(blockedUsersProvider.notifier).refresh(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}