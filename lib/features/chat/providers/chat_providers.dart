import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/chat_repository.dart';
import '../models/chat_model.dart';

part 'chat_providers.g.dart';

@riverpod
class ChatList extends _$ChatList {
  @override
  Future<List<ChatModel>> build() async {
    final repository = ref.watch(chatRepositoryProvider);
    return repository.getChats();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final repository = ref.read(chatRepositoryProvider);
    state = await AsyncValue.guard(() => repository.getChats());
  }

  Future<ChatModel> createChat(CreateChatRequest request) async {
    final repository = ref.read(chatRepositoryProvider);
    final newChat = await repository.createChat(request);
    
    state.whenData((chats) {
      state = AsyncValue.data([newChat, ...chats]);
    });
    
    return newChat;
  }

  Future<void> deleteChat(String chatId) async {
    final repository = ref.read(chatRepositoryProvider);
    await repository.deleteChat(chatId);
    
    state.whenData((chats) {
      final updatedChats = chats.where((chat) => chat.id != chatId).toList();
      state = AsyncValue.data(updatedChats);
    });
  }

  Future<void> leaveChat(String chatId) async {
    final repository = ref.read(chatRepositoryProvider);
    await repository.leaveChat(chatId);
    
    state.whenData((chats) {
      final updatedChats = chats.where((chat) => chat.id != chatId).toList();
      state = AsyncValue.data(updatedChats);
    });
  }
}

@riverpod
class ChatMessages extends _$ChatMessages {
  @override
  Future<List<ChatMessage>> build(String chatId) async {
    final repository = ref.watch(chatRepositoryProvider);
    return repository.getMessages(chatId: chatId);
  }

  Future<void> loadMore({String? beforeMessageId}) async {
    final repository = ref.read(chatRepositoryProvider);
    final newMessages = await repository.getMessages(
      chatId: chatId,
      beforeMessageId: beforeMessageId,
    );
    
    state.whenData((currentMessages) {
      final allMessages = [...currentMessages, ...newMessages];
      state = AsyncValue.data(allMessages);
    });
  }

  Future<ChatMessage> sendMessage(SendMessageRequest request) async {
    final repository = ref.read(chatRepositoryProvider);
    final newMessage = await repository.sendMessage(request);
    
    state.whenData((messages) {
      final updatedMessages = [newMessage, ...messages];
      state = AsyncValue.data(updatedMessages);
    });
    
    // Update chat list to show new message
    ref.invalidate(chatListProvider);
    
    return newMessage;
  }

  Future<void> editMessage(String messageId, String newContent) async {
    final repository = ref.read(chatRepositoryProvider);
    final editedMessage = await repository.editMessage(chatId, messageId, newContent);
    
    state.whenData((messages) {
      final updatedMessages = messages.map((msg) {
        return msg.id == messageId ? editedMessage : msg;
      }).toList();
      state = AsyncValue.data(updatedMessages);
    });
  }

  Future<void> deleteMessage(String messageId) async {
    final repository = ref.read(chatRepositoryProvider);
    await repository.deleteMessage(chatId, messageId);
    
    state.whenData((messages) {
      final updatedMessages = messages.where((msg) => msg.id != messageId).toList();
      state = AsyncValue.data(updatedMessages);
    });
  }

  Future<void> markAsRead(String messageId) async {
    final repository = ref.read(chatRepositoryProvider);
    await repository.markMessageAsRead(chatId, messageId);
  }

  Future<void> addReaction(String messageId, String emoji) async {
    final repository = ref.read(chatRepositoryProvider);
    await repository.addReaction(chatId, messageId, emoji);
    
    // Refresh messages to show new reaction
    ref.invalidate(chatMessagesProvider(chatId));
  }
}

@riverpod
class ChatDetail extends _$ChatDetail {
  @override
  Future<ChatModel> build(String chatId) async {
    final repository = ref.watch(chatRepositoryProvider);
    return repository.getChat(chatId);
  }

  Future<void> updateChat(Map<String, dynamic> updates) async {
    final repository = ref.read(chatRepositoryProvider);
    final updatedChat = await repository.updateChat(chatId, updates);
    state = AsyncValue.data(updatedChat);
  }

  Future<void> addParticipant(String userId) async {
    final repository = ref.read(chatRepositoryProvider);
    await repository.addParticipant(chatId, userId);
    ref.invalidate(chatDetailProvider(chatId));
  }

  Future<void> removeParticipant(String userId) async {
    final repository = ref.read(chatRepositoryProvider);
    await repository.removeParticipant(chatId, userId);
    ref.invalidate(chatDetailProvider(chatId));
  }
}

@riverpod
class TypingIndicators extends _$TypingIndicators {
  @override
  Map<String, bool> build() {
    final repository = ref.watch(chatRepositoryProvider);
    
    // Listen to typing stream
    repository.typingStream.listen((data) {
      final chatId = data['chat_id'] as String;
      final isTyping = data['is_typing'] as bool;
      
      state = {
        ...state,
        chatId: isTyping,
      };
      
      // Remove typing indicator after 3 seconds if still typing
      if (isTyping) {
        Future.delayed(const Duration(seconds: 3), () {
          if (state[chatId] == true) {
            state = {
              ...state,
              chatId: false,
            };
          }
        });
      }
    });
    
    return {};
  }

  void sendTypingIndicator(String chatId, bool isTyping) {
    final repository = ref.read(chatRepositoryProvider);
    repository.sendTypingIndicator(chatId, isTyping);
  }
}

@riverpod
Stream<ChatMessage> newMessageStream(NewMessageStreamRef ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return repository.messageStream;
}

@riverpod
Stream<Map<String, dynamic>> chatUpdateStream(ChatUpdateStreamRef ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return repository.chatUpdateStream;
}