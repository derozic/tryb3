import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../tux/theme/tux_spacing.dart';
import '../../models/chat_model.dart';
import '../../providers/chat_providers.dart';
import '../widgets/message_bubble.dart';
import '../widgets/chat_input.dart';
import '../widgets/typing_indicator.dart';

class ChatPage extends ConsumerStatefulWidget {
  final String chatId;

  const ChatPage({
    super.key,
    required this.chatId,
  });

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _messageController.addListener(_onMessageChanged);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _messageController.removeListener(_onMessageChanged);
    _messageController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent - 200) {
      // Load more messages when near the bottom
      // TODO: Implement pagination
    }
  }

  void _onMessageChanged() {
    final newIsTyping = _messageController.text.trim().isNotEmpty;
    if (newIsTyping != _isTyping) {
      setState(() {
        _isTyping = newIsTyping;
      });
      ref.read(typingIndicatorsProvider.notifier)
          .sendTypingIndicator(widget.chatId, newIsTyping);
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatAsyncValue = ref.watch(chatDetailProvider(widget.chatId));
    final messagesAsyncValue = ref.watch(chatMessagesProvider(widget.chatId));
    final typingIndicators = ref.watch(typingIndicatorsProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: chatAsyncValue.when(
          data: (chat) => _buildAppBarTitle(chat),
          loading: () => const Text('Loading...'),
          error: (_, __) => const Text('Error'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Chat settings
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: messagesAsyncValue.when(
              data: (messages) => _buildMessagesList(messages, typingIndicators),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 64, color: Colors.red),
                    const SizedBox(height: TuxSpacing.md),
                    Text(
                      'Failed to load messages',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: TuxSpacing.sm),
                    Text(
                      error.toString(),
                      style: const TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ChatInput(
            controller: _messageController,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarTitle(ChatModel chat) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          chat.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          '${chat.participants.length} participant${chat.participants.length != 1 ? 's' : ''}',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildMessagesList(List<ChatMessage> messages, Map<String, bool> typingIndicators) {
    if (messages.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_outlined, size: 64, color: Colors.grey),
            SizedBox(height: TuxSpacing.md),
            Text(
              'No messages yet',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: TuxSpacing.sm),
            Text(
              'Send the first message!',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      reverse: true,
      padding: const EdgeInsets.symmetric(
        horizontal: TuxSpacing.md,
        vertical: TuxSpacing.sm,
      ),
      itemCount: messages.length + (typingIndicators[widget.chatId] == true ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == 0 && typingIndicators[widget.chatId] == true) {
          return const TypingIndicator();
        }

        final messageIndex = typingIndicators[widget.chatId] == true 
            ? index - 1 
            : index;
        final message = messages[messageIndex];

        return Padding(
          padding: const EdgeInsets.only(bottom: TuxSpacing.sm),
          child: MessageBubble(
            message: message,
            onReaction: (emoji) => _addReaction(message.id, emoji),
            onEdit: (newContent) => _editMessage(message.id, newContent),
            onDelete: () => _deleteMessage(message.id),
          ),
        );
      },
    );
  }

  Future<void> _sendMessage() async {
    final content = _messageController.text.trim();
    if (content.isEmpty) return;

    _messageController.clear();
    
    try {
      final request = SendMessageRequest(
        chatId: widget.chatId,
        content: content,
      );

      await ref.read(chatMessagesProvider(widget.chatId).notifier)
          .sendMessage(request);
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send message: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _addReaction(String messageId, String emoji) async {
    try {
      await ref.read(chatMessagesProvider(widget.chatId).notifier)
          .addReaction(messageId, emoji);
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add reaction: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _editMessage(String messageId, String newContent) async {
    try {
      await ref.read(chatMessagesProvider(widget.chatId).notifier)
          .editMessage(messageId, newContent);
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to edit message: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _deleteMessage(String messageId) async {
    try {
      await ref.read(chatMessagesProvider(widget.chatId).notifier)
          .deleteMessage(messageId);
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete message: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}