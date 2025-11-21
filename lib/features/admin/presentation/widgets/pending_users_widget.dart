import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/models/user_model.dart';
import '../../../../tux/components/tux_card.dart';
import '../../../../tux/components/tux_button.dart';
import '../../../../tux/theme/tux_spacing.dart';
import '../../providers/admin_provider.dart';

class PendingUsersWidget extends ConsumerWidget {
  final List<UserModel> users;
  final bool showViewAll;

  const PendingUsersWidget({
    Key? key,
    required this.users,
    this.showViewAll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    if (users.isEmpty) {
      return TuxCard(
        body: Padding(
          padding: const EdgeInsets.all(TuxSpacing.lg),
          child: Column(
            children: [
              Icon(
                Icons.check_circle,
                size: 48,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: TuxSpacing.md),
              Text(
                'No Pending Approvals',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: TuxSpacing.sm),
              Text(
                'All user registrations have been processed.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return TuxCard(
      body: Column(
        children: [
          ...users.map((user) => _PendingUserTile(user: user)),
          if (showViewAll) ...[
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(TuxSpacing.md),
              child: TuxButton(
                text: 'View All Pending Users',
                variant: TuxButtonVariant.ghost,
                onPressed: () => context.go('/admin/approvals'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PendingUserTile extends ConsumerStatefulWidget {
  final UserModel user;

  const _PendingUserTile({required this.user});

  @override
  ConsumerState<_PendingUserTile> createState() => _PendingUserTileState();
}

class _PendingUserTileState extends ConsumerState<_PendingUserTile> {
  bool _isLoading = false;

  Future<void> _approveUser() async {
    setState(() => _isLoading = true);
    
    try {
      final success = await ref.read(pendingUsersProvider.notifier).approveUser(widget.user.id);
      
      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User ${widget.user.username} approved successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to approve user: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _rejectUser() async {
    final reason = await _showReasonDialog('Reject User');
    if (reason == null) return;

    setState(() => _isLoading = true);
    
    try {
      final success = await ref.read(pendingUsersProvider.notifier).rejectUser(
        widget.user.id,
        reason: reason.isEmpty ? null : reason,
      );
      
      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User ${widget.user.username} rejected'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to reject user: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<String?> _showReasonDialog(String title) async {
    String reason = '';
    
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Provide a reason for ${widget.user.username}:'),
            const SizedBox(height: TuxSpacing.md),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Reason (optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              onChanged: (value) => reason = value,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, reason),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(TuxSpacing.md),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          // User Avatar
          CircleAvatar(
            radius: 20,
            backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
            backgroundImage: widget.user.avatarUrl != null
                ? NetworkImage(widget.user.avatarUrl!)
                : null,
            child: widget.user.avatarUrl == null
                ? Text(
                    widget.user.username[0].toUpperCase(),
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: TuxSpacing.md),
          
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.username,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: TuxSpacing.xs),
                Text(
                  widget.user.email,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                if (widget.user.firstName != null || widget.user.lastName != null) ...[
                  const SizedBox(height: TuxSpacing.xs),
                  Text(
                    '${widget.user.firstName ?? ''} ${widget.user.lastName ?? ''}'.trim(),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
                const SizedBox(height: TuxSpacing.xs),
                Text(
                  'Registered: ${_formatDate(widget.user.createdAt)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          
          // Action Buttons
          if (_isLoading) ...[
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ] else ...[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TuxButton(
                  text: 'Approve',
                  size: TuxButtonSize.small,
                  variant: TuxButtonVariant.primary,
                  onPressed: _approveUser,
                ),
                const SizedBox(width: TuxSpacing.sm),
                TuxButton(
                  text: 'Reject',
                  size: TuxButtonSize.small,
                  variant: TuxButtonVariant.danger,
                  onPressed: _rejectUser,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}