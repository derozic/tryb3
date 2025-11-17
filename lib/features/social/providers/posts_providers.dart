import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../shared/models/post_model.dart';
import '../data/posts_repository.dart';

part 'posts_providers.g.dart';

@riverpod
class PostsFeed extends _$PostsFeed {
  @override
  Future<List<PostModel>> build() async {
    final repository = ref.read(postsRepositoryProvider);
    return repository.getFeed();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }

  Future<void> likePost(String postId) async {
    final repository = ref.read(postsRepositoryProvider);
    
    // Optimistically update the UI
    final currentState = await future;
    final optimisticState = currentState.map((post) {
      if (post.id == postId) {
        return post.copyWith(
          isLiked: !post.isLiked,
          likesCount: post.isLiked ? post.likesCount - 1 : post.likesCount + 1,
        );
      }
      return post;
    }).toList();
    
    state = AsyncData(optimisticState);
    
    try {
      // Perform the actual like/unlike operation
      final currentPost = currentState.firstWhere((post) => post.id == postId);
      if (currentPost.isLiked) {
        await repository.unlikePost(postId);
      } else {
        await repository.likePost(postId);
      }
      
      // Refresh to get the latest state
      refresh();
    } catch (e) {
      // Revert optimistic update on error
      state = AsyncData(currentState);
      rethrow;
    }
  }

  Future<void> createPost(String content, {List<String>? imageUrls}) async {
    final repository = ref.read(postsRepositoryProvider);
    await repository.createPost(content, imageUrls: imageUrls);
    refresh();
  }

  Future<void> deletePost(String postId) async {
    final repository = ref.read(postsRepositoryProvider);
    await repository.deletePost(postId);
    refresh();
  }
}

@riverpod
class PostCreation extends _$PostCreation {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  Future<void> createPost(String content, {List<String>? imageUrls}) async {
    state = const AsyncValue.loading();
    
    try {
      final repository = ref.read(postsRepositoryProvider);
      await repository.createPost(content, imageUrls: imageUrls);
      
      // Refresh the feed
      ref.read(postsFeedProvider.notifier).refresh();
      
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }
}