import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../shared/models/post_model.dart';
import '../../../shared/models/user_model.dart';

part 'posts_repository.g.dart';

abstract class PostsRepository {
  Future<List<PostModel>> getFeed({int page = 0, int limit = 20});
  Future<PostModel> createPost(String content, {List<String>? imageUrls});
  Future<PostModel> likePost(String postId);
  Future<PostModel> unlikePost(String postId);
  Future<void> deletePost(String postId);
}

class MockPostsRepository implements PostsRepository {
  static final List<PostModel> _mockPosts = [
    PostModel(
      id: '1',
      content: 'Just launched my new Flutter app! 🚀 #flutter #coding #mobile',
      authorId: '1',
      author: const UserModel(
        id: '1',
        email: 'test@example.com',
        username: 'testuser',
        displayName: 'Test User',
        isVerified: true,
        followersCount: 1250,
        followingCount: 180,
        postsCount: 42,
      ),
      imageUrls: [],
      likesCount: 24,
      commentsCount: 8,
      sharesCount: 3,
      isLiked: false,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    PostModel(
      id: '2',
      content: 'Beautiful sunset at the beach today! 🌅 Nature never fails to amaze me.',
      authorId: '2',
      author: const UserModel(
        id: '2',
        email: 'john@example.com',
        username: 'johndoe',
        displayName: 'John Doe',
        isVerified: false,
        followersCount: 450,
        followingCount: 320,
        postsCount: 156,
      ),
      imageUrls: [
        'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=500&h=500&fit=crop',
      ],
      likesCount: 89,
      commentsCount: 15,
      sharesCount: 7,
      isLiked: true,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      updatedAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    PostModel(
      id: '3',
      content: 'Working on a new design system for our app. Clean, minimal, and user-friendly! What do you think about dark mode trends?',
      authorId: '3',
      author: const UserModel(
        id: '3',
        email: 'sarah@example.com',
        username: 'sarahdesigns',
        displayName: 'Sarah Chen',
        isVerified: true,
        followersCount: 2340,
        followingCount: 890,
        postsCount: 234,
      ),
      imageUrls: [
        'https://images.unsplash.com/photo-1559028006-448665bd7c7f?w=500&h=500&fit=crop',
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=500&h=500&fit=crop',
      ],
      likesCount: 156,
      commentsCount: 23,
      sharesCount: 12,
      isLiked: false,
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      updatedAt: DateTime.now().subtract(const Duration(hours: 8)),
    ),
    PostModel(
      id: '4',
      content: 'Coffee and code ☕️💻 Starting the day right! What\'s your favorite coding fuel?',
      authorId: '4',
      author: const UserModel(
        id: '4',
        email: 'mike@example.com',
        username: 'mikecodes',
        displayName: 'Mike Rodriguez',
        isVerified: false,
        followersCount: 678,
        followingCount: 234,
        postsCount: 89,
      ),
      imageUrls: [],
      likesCount: 45,
      commentsCount: 18,
      sharesCount: 2,
      isLiked: true,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      updatedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  @override
  Future<List<PostModel>> getFeed({int page = 0, int limit = 20}) async {
    await Future.delayed(const Duration(milliseconds: 800)); // Simulate network delay
    
    final startIndex = page * limit;
    final endIndex = (startIndex + limit).clamp(0, _mockPosts.length);
    
    if (startIndex >= _mockPosts.length) {
      return [];
    }
    
    return _mockPosts.sublist(startIndex, endIndex);
  }

  @override
  Future<PostModel> createPost(String content, {List<String>? imageUrls}) async {
    await Future.delayed(const Duration(seconds: 1));
    
    final newPost = PostModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      authorId: '1', // Current user
      author: const UserModel(
        id: '1',
        email: 'test@example.com',
        username: 'testuser',
        displayName: 'Test User',
        isVerified: true,
        followersCount: 1250,
        followingCount: 180,
        postsCount: 43,
      ),
      imageUrls: imageUrls ?? [],
      likesCount: 0,
      commentsCount: 0,
      sharesCount: 0,
      isLiked: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    
    _mockPosts.insert(0, newPost);
    return newPost;
  }

  @override
  Future<PostModel> likePost(String postId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    final index = _mockPosts.indexWhere((post) => post.id == postId);
    if (index != -1) {
      final post = _mockPosts[index];
      final updatedPost = post.copyWith(
        isLiked: true,
        likesCount: post.likesCount + 1,
      );
      _mockPosts[index] = updatedPost;
      return updatedPost;
    }
    
    throw Exception('Post not found');
  }

  @override
  Future<PostModel> unlikePost(String postId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    final index = _mockPosts.indexWhere((post) => post.id == postId);
    if (index != -1) {
      final post = _mockPosts[index];
      final updatedPost = post.copyWith(
        isLiked: false,
        likesCount: (post.likesCount - 1).clamp(0, double.infinity).toInt(),
      );
      _mockPosts[index] = updatedPost;
      return updatedPost;
    }
    
    throw Exception('Post not found');
  }

  @override
  Future<void> deletePost(String postId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _mockPosts.removeWhere((post) => post.id == postId);
  }
}

@riverpod
PostsRepository postsRepository(PostsRepositoryRef ref) {
  return MockPostsRepository();
}