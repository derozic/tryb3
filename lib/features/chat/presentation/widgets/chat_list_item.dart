import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../tux/theme/tux_spacing.dart';
import '../../models/chat_model.dart';

class ChatListItem extends StatelessWidget {
  final ChatModel chat;
  final VoidCallback onTap;

  const ChatListItem({
    super.key,
    required this.chat,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: TuxSpacing.md,
        vertical: TuxSpacing.sm,
      ),
      leading: _buildAvatar(context),
      title: Row(
        children: [
          Expanded(
            child: Text(
              chat.name,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: chat.unreadCount > 0 ? FontWeight.bold : FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (chat.isPinned) ...[
            const SizedBox(width: TuxSpacing.xs),
            Icon(
              Icons.push_pin,
              size: 16,
              color: theme.colorScheme.primary,
            ),
          ],
          if (chat.isMuted) ...[
            const SizedBox(width: TuxSpacing.xs),
            Icon(
              Icons.notifications_off,
              size: 16,
              color: Colors.grey[600],
            ),
          ],
        ],
      ),
      subtitle: _buildSubtitle(context),
      trailing: _buildTrailing(context),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    final theme = Theme.of(context);
    
    if (chat.chatType == ChatType.direct && chat.participants.isNotEmpty) {
      // For direct messages, show the other person's avatar
      final otherUser = chat.participants.first;
      return CircleAvatar(
        radius: 24,
        backgroundImage: otherUser.avatarUrl != null
            ? CachedNetworkImageProvider(otherUser.avatarUrl!)
            : null,
        child: otherUser.avatarUrl == null
            ? Text(
                otherUser.name.isNotEmpty ? otherUser.name[0].toUpperCase() : '?',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              )
            : null,
      );
    } else {
      // For group chats or channels, show chat avatar or icon
      return CircleAvatar(
        radius: 24,
        backgroundImage: chat.avatarUrl != null
            ? CachedNetworkImageProvider(chat.avatarUrl!)
            : null,
        child: chat.avatarUrl == null
            ? Icon(
                chat.chatType == ChatType.group
                    ? Icons.group
                    : Icons.tag,
                color: theme.colorScheme.onPrimary,
              )
            : null,
      );
    }
  }

  Widget _buildSubtitle(BuildContext context) {
    final theme = Theme.of(context);
    
    if (chat.lastMessage == null) {
      return Text(
        'No messages yet',
        style: theme.textTheme.bodySmall?.copyWith(
          color: Colors.grey[600],
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    final lastMessage = chat.lastMessage!;
    String messageText = '';

    switch (lastMessage.messageType) {
      case MessageType.text:
        messageText = lastMessage.content;
        break;
      case MessageType.image:
        messageText = '📷 Image';
        break;
      case MessageType.video:
        messageText = '🎥 Video';
        break;
      case MessageType.audio:
        messageText = '🎵 Audio';
        break;
      case MessageType.file:
        messageText = '📎 File';
        break;
      case MessageType.location:
        messageText = '📍 Location';
        break;
      case MessageType.system:
        messageText = lastMessage.content;
        break;
    }

    return Row(
      children: [
        if (lastMessage.messageType != MessageType.text && 
            lastMessage.messageType != MessageType.system) ...[
          Text(
            messageText.split(' ')[0], // Just the emoji
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(width: TuxSpacing.xs),
        ],
        Expanded(
          child: Text(
            lastMessage.messageType == MessageType.text || 
            lastMessage.messageType == MessageType.system
                ? messageText
                : messageText.substring(messageText.indexOf(' ') + 1),
            style: theme.textTheme.bodySmall?.copyWith(
              color: chat.unreadCount > 0 
                  ? theme.colorScheme.onSurface
                  : Colors.grey[600],
              fontWeight: chat.unreadCount > 0 ? FontWeight.w500 : FontWeight.normal,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildTrailing(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (chat.lastMessage != null) ...[
          Text(
            timeago.format(chat.lastMessage!.sentAt),
            style: theme.textTheme.bodySmall?.copyWith(
              color: chat.unreadCount > 0 
                  ? theme.colorScheme.primary
                  : Colors.grey[600],
              fontSize: 11,
            ),
          ),
          const SizedBox(height: TuxSpacing.xs),
        ],
        if (chat.unreadCount > 0)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: TuxSpacing.sm,
              vertical: TuxSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            constraints: const BoxConstraints(minWidth: 20),
            child: Text(
              chat.unreadCount > 99 ? '99+' : chat.unreadCount.toString(),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}