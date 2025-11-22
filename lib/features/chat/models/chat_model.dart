import 'package:freezed_annotation/freezed_annotation.dart';
import '../../shared/models/user_model.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    required String id,
    required String name,
    String? description,
    String? avatarUrl,
    required ChatType chatType,
    required List<String> participantIds,
    required List<User> participants,
    String? lastMessageId,
    ChatMessage? lastMessage,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(0) int unreadCount,
    @Default(false) bool isPinned,
    @Default(false) bool isMuted,
    @Default(false) bool isArchived,
    Map<String, dynamic>? metadata,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) => _$ChatModelFromJson(json);
}

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required String chatId,
    required String senderId,
    required User sender,
    required String content,
    required MessageType messageType,
    @Default([]) List<String> attachmentUrls,
    String? replyToMessageId,
    ChatMessage? replyToMessage,
    required DateTime sentAt,
    DateTime? editedAt,
    DateTime? deletedAt,
    @Default([]) List<String> readByUserIds,
    @Default(MessageStatus.sent) MessageStatus status,
    @Default([]) List<MessageReaction> reactions,
    Map<String, dynamic>? metadata,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);
}

@freezed
class MessageReaction with _$MessageReaction {
  const factory MessageReaction({
    required String id,
    required String messageId,
    required String userId,
    required String username,
    required String emoji,
    required DateTime createdAt,
  }) = _MessageReaction;

  factory MessageReaction.fromJson(Map<String, dynamic> json) => _$MessageReactionFromJson(json);
}

@freezed
class SendMessageRequest with _$SendMessageRequest {
  const factory SendMessageRequest({
    required String chatId,
    required String content,
    @Default(MessageType.text) MessageType messageType,
    List<String>? attachmentUrls,
    String? replyToMessageId,
  }) = _SendMessageRequest;

  factory SendMessageRequest.fromJson(Map<String, dynamic> json) => _$SendMessageRequestFromJson(json);
}

@freezed
class CreateChatRequest with _$CreateChatRequest {
  const factory CreateChatRequest({
    required String name,
    String? description,
    @Default(ChatType.group) ChatType chatType,
    required List<String> participantIds,
    String? avatarUrl,
  }) = _CreateChatRequest;

  factory CreateChatRequest.fromJson(Map<String, dynamic> json) => _$CreateChatRequestFromJson(json);
}

enum ChatType {
  direct,
  group,
  channel,
}

enum MessageType {
  text,
  image,
  video,
  audio,
  file,
  location,
  system,
}

enum MessageStatus {
  sending,
  sent,
  delivered,
  read,
  failed,
}

extension ChatTypeExtension on ChatType {
  String get displayName {
    switch (this) {
      case ChatType.direct:
        return 'Direct Message';
      case ChatType.group:
        return 'Group Chat';
      case ChatType.channel:
        return 'Channel';
    }
  }

  String get icon {
    switch (this) {
      case ChatType.direct:
        return '💬';
      case ChatType.group:
        return '👥';
      case ChatType.channel:
        return '📢';
    }
  }
}

extension MessageTypeExtension on MessageType {
  String get displayName {
    switch (this) {
      case MessageType.text:
        return 'Text';
      case MessageType.image:
        return 'Image';
      case MessageType.video:
        return 'Video';
      case MessageType.audio:
        return 'Audio';
      case MessageType.file:
        return 'File';
      case MessageType.location:
        return 'Location';
      case MessageType.system:
        return 'System';
    }
  }

  String get icon {
    switch (this) {
      case MessageType.text:
        return '📝';
      case MessageType.image:
        return '📷';
      case MessageType.video:
        return '🎥';
      case MessageType.audio:
        return '🎵';
      case MessageType.file:
        return '📎';
      case MessageType.location:
        return '📍';
      case MessageType.system:
        return '⚙️';
    }
  }
}

extension MessageStatusExtension on MessageStatus {
  String get displayName {
    switch (this) {
      case MessageStatus.sending:
        return 'Sending';
      case MessageStatus.sent:
        return 'Sent';
      case MessageStatus.delivered:
        return 'Delivered';
      case MessageStatus.read:
        return 'Read';
      case MessageStatus.failed:
        return 'Failed';
    }
  }

  String get icon {
    switch (this) {
      case MessageStatus.sending:
        return '⏳';
      case MessageStatus.sent:
        return '✓';
      case MessageStatus.delivered:
        return '✓✓';
      case MessageStatus.read:
        return '✓✓';
      case MessageStatus.failed:
        return '❌';
    }
  }
}