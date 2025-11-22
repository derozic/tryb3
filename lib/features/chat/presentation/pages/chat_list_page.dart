import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../tux/components/tux_button.dart';
import '../../../../tux/theme/tux_spacing.dart';
import '../../providers/chat_providers.dart';
import '../widgets/chat_list_item.dart';
import '../widgets/create_chat_dialog.dart';

class ChatListPage extends ConsumerWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatsAsyncValue = ref.watch(chatListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Search chats
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              showCreateChatDialog(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(chatListProvider.notifier).refresh();
        },
        child: chatsAsyncValue.when(
          data: (chats) {
            if (chats.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.chat_outlined,
                      size: 64,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: TuxSpacing.md),
                    const Text(
                      'No conversations yet',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: TuxSpacing.sm),
                    const Text(
                      'Start a conversation with your friends!',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: TuxSpacing.lg),
                    TuxButton(
                      label: 'Start Chat',
                      onPressed: () {
                        showCreateChatDialog(context);
                      },
                    ),
                  ],
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.only(top: TuxSpacing.sm),
              itemCount: chats.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ChatListItem(
                  chat: chat,
                  onTap: () {
                    context.push('/chat/${chat.id}');
                  },
                );
              },
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Colors.red,
                ),
                const SizedBox(height: TuxSpacing.md),
                const Text(
                  'Failed to load conversations',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: TuxSpacing.sm),
                Text(
                  error.toString(),
                  style: const TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TuxSpacing.md),
                TuxButton(
                  label: 'Retry',
                  onPressed: () {
                    ref.read(chatListProvider.notifier).refresh();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}