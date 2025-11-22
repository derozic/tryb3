import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../tux/theme/tux_spacing.dart';
import '../../../../tux/components/tux_button.dart';
import '../widgets/post_card.dart';
import '../../providers/posts_providers.dart';

class DiscoverPage extends ConsumerStatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  ConsumerState<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends ConsumerState<DiscoverPage> with TickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text('Discover'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(96),
          child: Column(
            children: [
              _buildSearchBar(theme),
              const SizedBox(height: TuxSpacing.sm),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: const [
                  Tab(text: 'For You'),
                  Tab(text: 'Trending'),
                  Tab(text: 'Following'),
                  Tab(text: 'Recent'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildForYouTab(),
          _buildTrendingTab(),
          _buildFollowingTab(),
          _buildRecentTab(),
        ],
      ),
    );
  }

  Widget _buildSearchBar(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TuxSpacing.md),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search posts, hashtags, users...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: theme.colorScheme.outline.withOpacity(0.3),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: theme.colorScheme.outline.withOpacity(0.3),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
            ),
          ),
          filled: true,
          fillColor: theme.colorScheme.background,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: TuxSpacing.md,
            vertical: TuxSpacing.sm,
          ),
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        onSubmitted: _performSearch,
      ),
    );
  }

  Widget _buildForYouTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: TuxSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTrendingHashtags(),
          const SizedBox(height: TuxSpacing.lg),
          _buildSuggestedUsers(),
          const SizedBox(height: TuxSpacing.lg),
          _buildRecommendedPosts(),
        ],
      ),
    );
  }

  Widget _buildTrendingHashtags() {
    final hashtags = ['#flutter', '#coding', '#mobile', '#ui', '#design', '#tech'];
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TuxSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Hashtags',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: TuxSpacing.md),
          Wrap(
            spacing: TuxSpacing.sm,
            runSpacing: TuxSpacing.sm,
            children: hashtags.map((hashtag) => Chip(
              label: Text(hashtag),
              backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              ),
              onDeleted: null,
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedUsers() {
    final users = [
      {'name': 'Flutter Team', 'username': 'flutterdev', 'followers': '1.2M', 'isVerified': true},
      {'name': 'Google Developers', 'username': 'googledev', 'followers': '856K', 'isVerified': true},
      {'name': 'Material Design', 'username': 'materialdesign', 'followers': '423K', 'isVerified': true},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TuxSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Suggested Users',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: TuxSpacing.md),
          ...users.map((user) => _buildUserCard(user)),
        ],
      ),
    );
  }

  Widget _buildUserCard(Map<String, dynamic> user) {
    final theme = Theme.of(context);
    
    return Container(
      margin: const EdgeInsets.only(bottom: TuxSpacing.sm),
      padding: const EdgeInsets.all(TuxSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: theme.colorScheme.primary,
            child: Text(
              user['name'].toString().substring(0, 1),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: TuxSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      user['name'],
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (user['isVerified']) ...[
                      const SizedBox(width: TuxSpacing.xs),
                      Icon(
                        Icons.verified,
                        size: 16,
                        color: Colors.blue[600],
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: TuxSpacing.xs),
                Text(
                  '@${user['username']} • ${user['followers']} followers',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),
          TuxButton(
            label: 'Follow',
            variant: TuxButtonVariant.primary,
            size: TuxButtonSize.small,
            onPressed: () => _followUser(user['username']),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedPosts() {
    final postsAsyncValue = ref.watch(postsFeedProvider);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TuxSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommended Posts',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: TuxSpacing.md),
          postsAsyncValue.when(
            data: (posts) => Column(
              children: posts.take(3).map((post) => Padding(
                padding: const EdgeInsets.only(bottom: TuxSpacing.md),
                child: PostCard(post: post),
              )).toList(),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Text('Error loading posts: $error'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.trending_up, size: 64, color: Colors.grey),
          SizedBox(height: TuxSpacing.md),
          Text(
            'Trending Posts',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: TuxSpacing.sm),
          Text(
            'Discover what\'s popular right now',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowingTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people, size: 64, color: Colors.grey),
          SizedBox(height: TuxSpacing.md),
          Text(
            'Following Feed',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: TuxSpacing.sm),
          Text(
            'Posts from people you follow',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.schedule, size: 64, color: Colors.grey),
          SizedBox(height: TuxSpacing.md),
          Text(
            'Recent Posts',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: TuxSpacing.sm),
          Text(
            'Latest posts from everyone',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  void _performSearch(String query) {
    if (query.trim().isEmpty) return;
    
    // TODO: Implement search functionality
    print('Searching for: $query');
  }

  void _followUser(String username) {
    // TODO: Implement follow functionality
    print('Following user: $username');
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Started following @$username'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}