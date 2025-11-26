import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../tux/components/tux_button.dart';
import '../../../../tux/theme/tux_spacing.dart';
import '../../models/friend_model.dart';
import '../../providers/network_providers.dart';

class FriendRequestItem extends ConsumerWidget {
  final FriendRequest request;

  const FriendRequestItem({
    super.key,
    required this.request,
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
                  backgroundImage: request.sender.avatarUrl != null
                      ? CachedNetworkImageProvider(request.sender.avatarUrl!)
                      : null,
                  child: request.sender.avatarUrl == null
                      ? Text(
                          request.sender.name.isNotEmpty 
                              ? request.sender.name[0].toUpperCase() 
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
                        request.sender.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: TuxSpacing.xs),
                      Text(
                        'Sent ${timeago.format(request.createdAt)}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (request.message != null && request.message!.isNotEmpty) ...[
              const SizedBox(height: TuxSpacing.md),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(TuxSpacing.md),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: theme.colorScheme.outline.withOpacity(0.2),
                  ),
                ),
                child: Text(
                  request.message!,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
            const SizedBox(height: TuxSpacing.md),
            if (request.status == FriendRequestStatus.pending) ...[
              Row(
                children: [
                  Expanded(
                    child: TuxButton(
                      label: 'Accept',
                      onPressed: () {
                        ref.read(friendRequestsProvider.notifier)
                            .acceptRequest(request.id);
                      },
                    ),
                  ),
                  const SizedBox(width: TuxSpacing.md),
                  Expanded(
                    child: TuxButton(
                      label: 'Decline',
                      variant: ButtonVariant.outlined,
                      onPressed: () {
                        ref.read(friendRequestsProvider.notifier)
                            .declineRequest(request.id);
                      },
                    ),
                  ),
                ],
              ),
            ] else ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: TuxSpacing.sm),
                decoration: BoxDecoration(
                  color: _getStatusColor(request.status).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${request.status.icon} ${request.status.displayName}',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: _getStatusColor(request.status),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(FriendRequestStatus status) {
    switch (status) {
      case FriendRequestStatus.accepted:
        return Colors.green;
      case FriendRequestStatus.declined:
        return Colors.red;
      case FriendRequestStatus.cancelled:
        return Colors.grey;
      case FriendRequestStatus.pending:
        return Colors.orange;
    }
  }
}

enum ButtonVariant { filled, outlined }