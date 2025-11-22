import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../shared/models/post_model.dart';
import '../../../../tux/theme/tux_spacing.dart';
import '../../../../tux/components/tux_button.dart';
import '../widgets/post_card.dart';

class PostDetailPage extends ConsumerStatefulWidget {
  final String postId;

  const PostDetailPage({Key? key, required this.postId}) : super(key: key);

  @override
  ConsumerState<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends ConsumerState<PostDetailPage> {
  final _commentController = TextEditingController();
  bool _isCommenting = false;

  // Mock post data - would normally be fetched from provider
  late PostModel post;

  @override
  void initState() {
    super.initState();
    // Mock post data
    post = PostModel(
      id: widget.postId,
      content: 'Just launched my new Flutter app! 🚀 #flutter #coding #mobile',
      authorId: '1',
      author: const UserModel(
        id: '1',
        email: 'test@example.com',
        username: 'testuser',
        name: 'Test User',
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text('Post'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => _showShareMenu(context),
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(TuxSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostCard(post: post),
                  const SizedBox(height: TuxSpacing.lg),
                  _buildCommentsSection(theme),
                ],
              ),
            ),
          ),
          _buildCommentInput(theme),
        ],
      ),
    );
  }

  Widget _buildCommentsSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comments (${post.commentsCount})',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: TuxSpacing.md),
        _buildMockComments(theme),
      ],
    );
  }

  Widget _buildMockComments(ThemeData theme) {
    // Mock comment data
    final comments = [
      {
        'id': '1',
        'author': 'johndoe',
        'authorName': 'John Doe',
        'content': 'Congratulations! The app looks amazing 🎉',
        'likes': 5,
        'isLiked': false,
        'createdAt': DateTime.now().subtract(const Duration(minutes: 30)),
      },
      {
        'id': '2',
        'author': 'sarahdesigns',
        'authorName': 'Sarah Chen',
        'content': 'Love the clean UI design! What framework did you use?',
        'likes': 3,
        'isLiked': true,
        'createdAt': DateTime.now().subtract(const Duration(hours: 1)),
      },
      {
        'id': '3',
        'author': 'mikecodes',
        'authorName': 'Mike Rodriguez',
        'content': 'This is inspiring! I\'m working on my first Flutter app too. Any tips for beginners?',
        'likes': 2,
        'isLiked': false,
        'createdAt': DateTime.now().subtract(const Duration(hours: 2)),
      },
    ];

    return Column(
      children: comments.map((comment) => _buildCommentItem(comment, theme)).toList(),
    );
  }

  Widget _buildCommentItem(Map<String, dynamic> comment, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(bottom: TuxSpacing.md),
      padding: const EdgeInsets.all(TuxSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: theme.colorScheme.primary,
                child: Text(
                  comment['authorName'].toString().substring(0, 1).toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: TuxSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment['authorName'],
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '@${comment['author']}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                timeago.format(comment['createdAt']),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            ],
          ),
          const SizedBox(height: TuxSpacing.sm),
          Text(
            comment['content'],
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: TuxSpacing.sm),
          Row(
            children: [
              InkWell(
                onTap: () => _toggleCommentLike(comment['id']),
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: TuxSpacing.xs,
                    vertical: TuxSpacing.xs,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        comment['isLiked'] ? Icons.favorite : Icons.favorite_border,
                        size: 16,
                        color: comment['isLiked'] ? Colors.red : theme.colorScheme.outline,
                      ),
                      const SizedBox(width: TuxSpacing.xs),
                      Text(
                        comment['likes'].toString(),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: comment['isLiked'] ? Colors.red : theme.colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: TuxSpacing.md),
              InkWell(
                onTap: () => _replyToComment(comment['author']),
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: TuxSpacing.xs,
                    vertical: TuxSpacing.xs,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.reply,
                        size: 16,
                        color: theme.colorScheme.outline,
                      ),
                      const SizedBox(width: TuxSpacing.xs),
                      Text(
                        'Reply',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommentInput(ThemeData theme) {
    return Container(
      padding: EdgeInsets.only(
        left: TuxSpacing.md,
        right: TuxSpacing.md,
        top: TuxSpacing.md,
        bottom: MediaQuery.of(context).viewInsets.bottom + TuxSpacing.md,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: theme.colorScheme.primary,
            child: const Text(
              'T',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: TuxSpacing.sm),
          Expanded(
            child: TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: 'Add a comment...',
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
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: TuxSpacing.md,
                  vertical: TuxSpacing.sm,
                ),
              ),
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          const SizedBox(width: TuxSpacing.sm),
          IconButton(
            onPressed: _isCommenting ? null : _submitComment,
            icon: _isCommenting 
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.send),
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }

  void _toggleCommentLike(String commentId) {
    // TODO: Implement comment like functionality
    print('Toggle like for comment: $commentId');
  }

  void _replyToComment(String username) {
    _commentController.text = '@$username ';
    _commentController.selection = TextSelection.fromPosition(
      TextPosition(offset: _commentController.text.length),
    );
  }

  Future<void> _submitComment() async {
    if (_commentController.text.trim().isEmpty) return;

    setState(() {
      _isCommenting = true;
    });

    try {
      // TODO: Implement comment submission
      await Future.delayed(const Duration(seconds: 1)); // Mock delay
      
      _commentController.clear();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Comment posted successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to post comment: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isCommenting = false;
        });
      }
    }
  }

  void _showShareMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(TuxSpacing.md),
              child: Text(
                'Share Post',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: const Text('Copy Link'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Copy link to clipboard
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share to...'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Share via platform
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Send in Message'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Share via direct message
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}