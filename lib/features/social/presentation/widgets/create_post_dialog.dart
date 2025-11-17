import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/posts_providers.dart';
import '../../../auth/providers/auth_providers.dart';

class CreatePostDialog extends ConsumerStatefulWidget {
  const CreatePostDialog({super.key});

  @override
  ConsumerState<CreatePostDialog> createState() => _CreatePostDialogState();
}

class _CreatePostDialogState extends ConsumerState<CreatePostDialog> {
  final _contentController = TextEditingController();
  final _focusNode = FocusNode();
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && !_isExpanded) {
        setState(() {
          _isExpanded = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _contentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final postCreationState = ref.watch(postCreationProvider);
    final isLoading = postCreationState.isLoading;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: user?.profileImageUrl != null
                      ? ClipOval(
                          child: Image.network(
                            user!.profileImageUrl!,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.name ?? 'User',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '@${user?.username ?? 'username'}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: isLoading ? null : () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Content input
            Expanded(
              child: TextField(
                controller: _contentController,
                focusNode: _focusNode,
                maxLines: null,
                minLines: _isExpanded ? 5 : 3,
                enabled: !isLoading,
                decoration: const InputDecoration(
                  hintText: "What's happening?",
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 18),
                ),
                style: const TextStyle(fontSize: 18),
              ),
            ),
            
            // Media options (if expanded)
            if (_isExpanded) ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    onPressed: isLoading ? null : () {
                      // TODO: Add image picker
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Image picker coming soon!'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.photo_outlined),
                    tooltip: 'Add photos',
                  ),
                  IconButton(
                    onPressed: isLoading ? null : () {
                      // TODO: Add gif picker
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('GIF picker coming soon!'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.gif_box_outlined),
                    tooltip: 'Add GIF',
                  ),
                  IconButton(
                    onPressed: isLoading ? null : () {
                      // TODO: Add emoji picker
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Emoji picker coming soon!'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.emoji_emotions_outlined),
                    tooltip: 'Add emoji',
                  ),
                  const Spacer(),
                  Text(
                    '${_contentController.text.length}/280',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: _contentController.text.length > 280
                          ? Colors.red
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
            
            const SizedBox(height: 16),
            
            // Action buttons
            Row(
              children: [
                if (!_isExpanded)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: isLoading ? null : () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                  ),
                if (!_isExpanded) const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: isLoading || _contentController.text.trim().isEmpty
                        ? null
                        : _handlePost,
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Post'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handlePost() async {
    if (_contentController.text.trim().isEmpty) return;
    if (_contentController.text.length > 280) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Post is too long. Maximum 280 characters.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      await ref.read(postCreationProvider.notifier).createPost(
        _contentController.text.trim(),
      );
      
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Post created successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create post: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

void showCreatePostDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const CreatePostDialog(),
  );
}