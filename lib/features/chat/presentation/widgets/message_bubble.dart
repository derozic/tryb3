import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../tux/theme/tux_spacing.dart';
import '../../models/chat_model.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final Function(String emoji) onReaction;
  final Function(String newContent) onEdit;
  final VoidCallback onDelete;

  const MessageBubble({
    super.key,
    required this.message,
    required this.onReaction,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCurrentUser = true; // TODO: Check if current user sent this message
    
    return Row(
      mainAxisAlignment: isCurrentUser 
          ? MainAxisAlignment.end 
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isCurrentUser) ...[
          _buildAvatar(),
          const SizedBox(width: TuxSpacing.sm),
        ],
        Flexible(
          child: Column(
            crossAxisAlignment: isCurrentUser 
                ? CrossAxisAlignment.end 
                : CrossAxisAlignment.start,
            children: [
              if (!isCurrentUser)
                Padding(
                  padding: const EdgeInsets.only(
                    left: TuxSpacing.sm,
                    bottom: TuxSpacing.xs,
                  ),
                  child: Text(
                    message.sender.name,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              GestureDetector(
                onLongPress: () => _showMessageOptions(context),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: TuxSpacing.md,
                    vertical: TuxSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    color: isCurrentUser
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(18),
                      topRight: const Radius.circular(18),
                      bottomLeft: Radius.circular(isCurrentUser ? 18 : 4),
                      bottomRight: Radius.circular(isCurrentUser ? 4 : 18),
                    ),
                    border: !isCurrentUser
                        ? Border.all(color: theme.colorScheme.outline.withOpacity(0.2))
                        : null,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (message.replyToMessage != null)
                        _buildReplyPreview(theme, isCurrentUser),
                      _buildMessageContent(theme, isCurrentUser),
                      if (message.reactions.isNotEmpty)
                        _buildReactions(theme),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: TuxSpacing.xs,
                  left: TuxSpacing.sm,
                  right: TuxSpacing.sm,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      timeago.format(message.sentAt),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                        fontSize: 11,
                      ),
                    ),
                    if (message.editedAt != null) ...[
                      const SizedBox(width: TuxSpacing.xs),
                      Text(
                        '(edited)',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[500],
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                    if (isCurrentUser) ...[
                      const SizedBox(width: TuxSpacing.xs),
                      Icon(
                        _getStatusIcon(),
                        size: 12,
                        color: Colors.grey[600],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        if (isCurrentUser) ...[
          const SizedBox(width: TuxSpacing.sm),
          _buildAvatar(),
        ],
      ],
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 16,
      backgroundImage: message.sender.avatarUrl != null
          ? CachedNetworkImageProvider(message.sender.avatarUrl!)
          : null,
      child: message.sender.avatarUrl == null
          ? Text(
              message.sender.name.isNotEmpty 
                  ? message.sender.name[0].toUpperCase() 
                  : '?',
              style: const TextStyle(fontSize: 12),
            )
          : null,
    );
  }

  Widget _buildReplyPreview(ThemeData theme, bool isCurrentUser) {
    final replyMessage = message.replyToMessage!;
    
    return Container(
      margin: const EdgeInsets.only(bottom: TuxSpacing.sm),
      padding: const EdgeInsets.all(TuxSpacing.sm),
      decoration: BoxDecoration(
        color: (isCurrentUser 
            ? theme.colorScheme.onPrimary 
            : theme.colorScheme.primary)
            .withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border(
          left: BorderSide(
            color: isCurrentUser 
                ? theme.colorScheme.onPrimary 
                : theme.colorScheme.primary,
            width: 3,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            replyMessage.sender.name,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: isCurrentUser 
                  ? theme.colorScheme.onPrimary 
                  : theme.colorScheme.primary,
            ),
          ),
          Text(
            replyMessage.content,
            style: theme.textTheme.bodySmall?.copyWith(
              color: (isCurrentUser 
                  ? theme.colorScheme.onPrimary 
                  : theme.colorScheme.onSurface)
                  .withOpacity(0.7),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildMessageContent(ThemeData theme, bool isCurrentUser) {
    switch (message.messageType) {
      case MessageType.text:
        return Text(
          message.content,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isCurrentUser 
                ? theme.colorScheme.onPrimary 
                : theme.colorScheme.onSurface,
          ),
        );
      case MessageType.image:
        return _buildImageMessage(theme);
      case MessageType.system:
        return Text(
          message.content,
          style: theme.textTheme.bodySmall?.copyWith(
            fontStyle: FontStyle.italic,
            color: Colors.grey[600],
          ),
        );
      default:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message.messageType.icon),
            const SizedBox(width: TuxSpacing.sm),
            Flexible(
              child: Text(
                message.content,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isCurrentUser 
                      ? theme.colorScheme.onPrimary 
                      : theme.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        );
    }
  }

  Widget _buildImageMessage(ThemeData theme) {
    if (message.attachmentUrls.isEmpty) {
      return Text(
        'Image',
        style: theme.textTheme.bodyMedium?.copyWith(
          fontStyle: FontStyle.italic,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: message.attachmentUrls.first,
        width: 200,
        height: 200,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: 200,
          height: 200,
          color: Colors.grey[300],
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (context, url, error) => Container(
          width: 200,
          height: 200,
          color: Colors.grey[300],
          child: const Icon(Icons.error),
        ),
      ),
    );
  }

  Widget _buildReactions(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(top: TuxSpacing.sm),
      child: Wrap(
        spacing: TuxSpacing.xs,
        children: message.reactions.map((reaction) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: TuxSpacing.sm,
              vertical: TuxSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.outline),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(reaction.emoji),
                const SizedBox(width: TuxSpacing.xs),
                Text(
                  '1', // TODO: Count reactions by emoji
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  IconData _getStatusIcon() {
    switch (message.status) {
      case MessageStatus.sending:
        return Icons.schedule;
      case MessageStatus.sent:
        return Icons.check;
      case MessageStatus.delivered:
        return Icons.done_all;
      case MessageStatus.read:
        return Icons.done_all;
      case MessageStatus.failed:
        return Icons.error;
    }
  }

  void _showMessageOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.copy),
            title: const Text('Copy'),
            onTap: () {
              Clipboard.setData(ClipboardData(text: message.content));
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Message copied')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.emoji_emotions),
            title: const Text('React'),
            onTap: () {
              Navigator.pop(context);
              _showReactionPicker(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.reply),
            title: const Text('Reply'),
            onTap: () {
              Navigator.pop(context);
              // TODO: Implement reply
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit'),
            onTap: () {
              Navigator.pop(context);
              _showEditDialog(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text('Delete', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
              onDelete();
            },
          ),
        ],
      ),
    );
  }

  void _showReactionPicker(BuildContext context) {
    const emojis = ['👍', '❤️', '😂', '😮', '😢', '😡'];
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('React to message'),
        content: Wrap(
          spacing: TuxSpacing.md,
          children: emojis.map((emoji) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context);
                onReaction(emoji);
              },
              child: Container(
                padding: const EdgeInsets.all(TuxSpacing.md),
                child: Text(emoji, style: const TextStyle(fontSize: 24)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final controller = TextEditingController(text: message.content);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit message'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter new message',
            border: OutlineInputBorder(),
          ),
          maxLines: null,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onEdit(controller.text.trim());
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}