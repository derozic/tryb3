import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../tux/components/tux_button.dart';
import '../../../../tux/theme/tux_spacing.dart';
import '../../models/friend_model.dart';
import '../../providers/network_providers.dart';

class FriendListItem extends ConsumerWidget {
  final FriendConnection friend;

  const FriendListItem({
    super.key,
    required this.friend,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(TuxSpacing.md),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: friend.friend.avatarUrl != null
                  ? CachedNetworkImageProvider(friend.friend.avatarUrl!)
                  : null,
              child: friend.friend.avatarUrl == null
                  ? Text(
                      friend.friend.name.isNotEmpty 
                          ? friend.friend.name[0].toUpperCase() 
                          : '?',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: TuxSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          friend.friend.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (friend.isCloseFriend)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: TuxSpacing.sm,
                            vertical: TuxSpacing.xs,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                size: 12,
                                color: theme.colorScheme.primary,
                              ),
                              const SizedBox(width: TuxSpacing.xs),
                              Text(
                                'Close Friend',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: TuxSpacing.xs),
                  Text(
                    'Friends since ${timeago.format(friend.acceptedAt ?? friend.createdAt)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  if (friend.mutualConnectionCount != null) ...[
                    const SizedBox(height: TuxSpacing.xs),
                    Text(
                      '${friend.mutualConnectionCount} mutual friends',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: TuxSpacing.md),
            PopupMenuButton<String>(
              onSelected: (value) => _handleMenuAction(context, ref, value),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'message',
                  child: Row(
                    children: [
                      Icon(Icons.message, size: 20, color: Colors.grey[600]),
                      const SizedBox(width: TuxSpacing.sm),
                      const Text('Send Message'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'close_friend',
                  child: Row(
                    children: [
                      Icon(
                        friend.isCloseFriend ? Icons.star : Icons.star_border,
                        size: 20,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: TuxSpacing.sm),
                      Text(friend.isCloseFriend ? 'Remove from Close Friends' : 'Add to Close Friends'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'mute',
                  child: Row(
                    children: [
                      Icon(
                        friend.isMuted ? Icons.volume_up : Icons.volume_off,
                        size: 20,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: TuxSpacing.sm),
                      Text(friend.isMuted ? 'Unmute' : 'Mute'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'block',
                  child: Row(
                    children: [
                      const Icon(Icons.block, size: 20, color: Colors.red),
                      const SizedBox(width: TuxSpacing.sm),
                      const Text('Block', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'remove',
                  child: Row(
                    children: [
                      const Icon(Icons.person_remove, size: 20, color: Colors.red),
                      const SizedBox(width: TuxSpacing.sm),
                      const Text('Remove Friend', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ],
              child: const Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }

  void _handleMenuAction(BuildContext context, WidgetRef ref, String action) {
    switch (action) {
      case 'message':
        // TODO: Open chat with friend
        break;
      case 'close_friend':
        ref.read(friendsListProvider.notifier).toggleCloseFriend(friend.friendId);
        break;
      case 'mute':
        // TODO: Toggle mute
        break;
      case 'block':
        _showBlockDialog(context, ref);
        break;
      case 'remove':
        _showRemoveDialog(context, ref);
        break;
    }
  }

  void _showBlockDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Block User'),
        content: Text('Are you sure you want to block ${friend.friend.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TuxButton(
            label: 'Block',
            onPressed: () {
              ref.read(friendsListProvider.notifier).blockUser(friend.friendId);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _showRemoveDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Friend'),
        content: Text('Are you sure you want to remove ${friend.friend.name} from your friends?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TuxButton(
            label: 'Remove',
            onPressed: () {
              ref.read(friendsListProvider.notifier).removeFriend(friend.friendId);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}