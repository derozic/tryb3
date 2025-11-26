import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../tux/components/tux_button.dart';
import '../../../../tux/theme/tux_spacing.dart';
import '../../models/friend_model.dart';
import '../../providers/network_providers.dart';

class UserSuggestionItem extends ConsumerWidget {
  final UserSuggestion suggestion;

  const UserSuggestionItem({
    super.key,
    required this.suggestion,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(TuxSpacing.md),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: suggestion.user.avatarUrl != null
                      ? CachedNetworkImageProvider(suggestion.user.avatarUrl!)
                      : null,
                  child: suggestion.user.avatarUrl == null
                      ? Text(
                          suggestion.user.name.isNotEmpty 
                              ? suggestion.user.name[0].toUpperCase() 
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
                      Text(
                        suggestion.user.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: TuxSpacing.xs),
                      Row(
                        children: [
                          Text(suggestion.reason.icon),
                          const SizedBox(width: TuxSpacing.xs),
                          Expanded(
                            child: Text(
                              suggestion.reason.displayName,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (suggestion.mutualFriendsCount > 0) ...[
                        const SizedBox(height: TuxSpacing.xs),
                        Text(
                          '${suggestion.mutualFriendsCount} mutual friend${suggestion.mutualFriendsCount != 1 ? 's' : ''}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ref.read(userSuggestionsProvider.notifier)
                        .dismissSuggestion(suggestion.user.id);
                  },
                  icon: const Icon(Icons.close, size: 20),
                ),
              ],
            ),
            if (suggestion.mutualFriends.isNotEmpty) ...[
              const SizedBox(height: TuxSpacing.md),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(TuxSpacing.sm),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: theme.colorScheme.outline.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mutual Friends',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: TuxSpacing.xs),
                    Wrap(
                      spacing: TuxSpacing.xs,
                      children: suggestion.mutualFriends.take(3).map((friend) {
                        return CircleAvatar(
                          radius: 12,
                          backgroundImage: friend.avatarUrl != null
                              ? CachedNetworkImageProvider(friend.avatarUrl!)
                              : null,
                          child: friend.avatarUrl == null
                              ? Text(
                                  friend.name.isNotEmpty 
                                      ? friend.name[0].toUpperCase() 
                                      : '?',
                                  style: const TextStyle(fontSize: 10),
                                )
                              : null,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: TuxSpacing.md),
            Row(
              children: [
                Expanded(
                  child: TuxButton(
                    label: 'Add Friend',
                    onPressed: () => _showAddFriendDialog(context, ref),
                  ),
                ),
                const SizedBox(width: TuxSpacing.md),
                TuxButton(
                  label: 'View Profile',
                  variant: ButtonVariant.outlined,
                  onPressed: () {
                    // TODO: Navigate to profile
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAddFriendDialog(BuildContext context, WidgetRef ref) {
    final messageController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Send friend request to ${suggestion.user.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: messageController,
              decoration: const InputDecoration(
                hintText: 'Add a message (optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              maxLength: 200,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TuxButton(
            label: 'Send Request',
            onPressed: () {
              ref.read(userSuggestionsProvider.notifier)
                  .sendRequest(suggestion.user.id, messageController.text.trim());
              Navigator.pop(context);
              
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Friend request sent to ${suggestion.user.name}'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}