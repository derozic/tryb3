import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/websocket_service.dart';
import '../models/chat_model.dart';

class ChatRepository {
  final ApiService _apiService;
  final WebSocketService _webSocketService;

  ChatRepository(this._apiService, this._webSocketService);

  // Chat Management
  Future<List<ChatModel>> getChats({
    int page = 1,
    int pageSize = 20,
    ChatType? chatType,
    bool includeArchived = false,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
        if (chatType != null) 'chat_type': chatType.name,
        'include_archived': includeArchived,
      };

      final response = await _apiService.get('/chats/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => ChatModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch chats: $e');
    }
  }

  Future<ChatModel> getChat(String chatId) async {
    try {
      final response = await _apiService.get('/chats/$chatId/');
      return ChatModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch chat: $e');
    }
  }

  Future<ChatModel> createChat(CreateChatRequest request) async {
    try {
      final response = await _apiService.post('/chats/', data: request.toJson());
      return ChatModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create chat: $e');
    }
  }

  Future<ChatModel> updateChat(String chatId, Map<String, dynamic> updates) async {
    try {
      final response = await _apiService.patch('/chats/$chatId/', data: updates);
      return ChatModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to update chat: $e');
    }
  }

  Future<void> deleteChat(String chatId) async {
    try {
      await _apiService.delete('/chats/$chatId/');
    } catch (e) {
      throw Exception('Failed to delete chat: $e');
    }
  }

  Future<void> leaveChat(String chatId) async {
    try {
      await _apiService.post('/chats/$chatId/leave/');
    } catch (e) {
      throw Exception('Failed to leave chat: $e');
    }
  }

  // Message Management
  Future<List<ChatMessage>> getMessages({
    required String chatId,
    int page = 1,
    int pageSize = 50,
    String? beforeMessageId,
    String? afterMessageId,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
        if (beforeMessageId != null) 'before': beforeMessageId,
        if (afterMessageId != null) 'after': afterMessageId,
      };

      final response = await _apiService.get('/chats/$chatId/messages/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => ChatMessage.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch messages: $e');
    }
  }

  Future<ChatMessage> sendMessage(SendMessageRequest request) async {
    try {
      final response = await _apiService.post('/chats/${request.chatId}/messages/', data: request.toJson());
      final message = ChatMessage.fromJson(response.data);
      
      // Send via WebSocket for real-time delivery
      _webSocketService.sendMessage('message_sent', {
        'chat_id': request.chatId,
        'message': message.toJson(),
      });
      
      return message;
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }

  Future<ChatMessage> editMessage(String chatId, String messageId, String newContent) async {
    try {
      final response = await _apiService.patch('/chats/$chatId/messages/$messageId/', data: {
        'content': newContent,
      });
      return ChatMessage.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to edit message: $e');
    }
  }

  Future<void> deleteMessage(String chatId, String messageId) async {
    try {
      await _apiService.delete('/chats/$chatId/messages/$messageId/');
    } catch (e) {
      throw Exception('Failed to delete message: $e');
    }
  }

  Future<void> markMessageAsRead(String chatId, String messageId) async {
    try {
      await _apiService.post('/chats/$chatId/messages/$messageId/read/');
      
      // Send read receipt via WebSocket
      _webSocketService.sendMessage('message_read', {
        'chat_id': chatId,
        'message_id': messageId,
      });
    } catch (e) {
      throw Exception('Failed to mark message as read: $e');
    }
  }

  Future<void> markChatAsRead(String chatId) async {
    try {
      await _apiService.post('/chats/$chatId/read/');
    } catch (e) {
      throw Exception('Failed to mark chat as read: $e');
    }
  }

  // Message Reactions
  Future<MessageReaction> addReaction(String chatId, String messageId, String emoji) async {
    try {
      final response = await _apiService.post('/chats/$chatId/messages/$messageId/reactions/', data: {
        'emoji': emoji,
      });
      return MessageReaction.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to add reaction: $e');
    }
  }

  Future<void> removeReaction(String chatId, String messageId, String reactionId) async {
    try {
      await _apiService.delete('/chats/$chatId/messages/$messageId/reactions/$reactionId/');
    } catch (e) {
      throw Exception('Failed to remove reaction: $e');
    }
  }

  // Chat Participants
  Future<void> addParticipant(String chatId, String userId) async {
    try {
      await _apiService.post('/chats/$chatId/participants/', data: {
        'user_id': userId,
      });
    } catch (e) {
      throw Exception('Failed to add participant: $e');
    }
  }

  Future<void> removeParticipant(String chatId, String userId) async {
    try {
      await _apiService.delete('/chats/$chatId/participants/$userId/');
    } catch (e) {
      throw Exception('Failed to remove participant: $e');
    }
  }

  // Typing Indicators
  void sendTypingIndicator(String chatId, bool isTyping) {
    _webSocketService.sendMessage('typing', {
      'chat_id': chatId,
      'is_typing': isTyping,
    });
  }

  // Real-time WebSocket Streams
  Stream<ChatMessage> get messageStream => _webSocketService.messageStream
      .where((data) => data['type'] == 'message_received')
      .map((data) => ChatMessage.fromJson(data['message']));

  Stream<Map<String, dynamic>> get typingStream => _webSocketService.messageStream
      .where((data) => data['type'] == 'typing');

  Stream<Map<String, dynamic>> get chatUpdateStream => _webSocketService.messageStream
      .where((data) => data['type'] == 'chat_updated');

  // Search
  Future<List<ChatMessage>> searchMessages({
    String? chatId,
    required String query,
    MessageType? messageType,
    DateTime? startDate,
    DateTime? endDate,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'q': query,
        'page': page,
        'page_size': pageSize,
        if (chatId != null) 'chat_id': chatId,
        if (messageType != null) 'message_type': messageType.name,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
      };

      final response = await _apiService.get('/chats/messages/search/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => ChatMessage.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to search messages: $e');
    }
  }

  Future<List<ChatModel>> searchChats(String query, {
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'q': query,
        'page': page,
        'page_size': pageSize,
      };

      final response = await _apiService.get('/chats/search/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => ChatModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to search chats: $e');
    }
  }
}

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  final webSocketService = ref.watch(webSocketServiceProvider);
  return ChatRepository(apiService, webSocketService);
});