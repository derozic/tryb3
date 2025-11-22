// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatModelImpl _$$ChatModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      chatType: $enumDecode(_$ChatTypeEnumMap, json['chatType']),
      participantIds: (json['participantIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      participants: (json['participants'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastMessageId: json['lastMessageId'] as String?,
      lastMessage: json['lastMessage'] == null
          ? null
          : ChatMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
      isPinned: json['isPinned'] as bool? ?? false,
      isMuted: json['isMuted'] as bool? ?? false,
      isArchived: json['isArchived'] as bool? ?? false,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ChatModelImplToJson(_$ChatModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'avatarUrl': instance.avatarUrl,
      'chatType': _$ChatTypeEnumMap[instance.chatType]!,
      'participantIds': instance.participantIds,
      'participants': instance.participants,
      'lastMessageId': instance.lastMessageId,
      'lastMessage': instance.lastMessage,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'unreadCount': instance.unreadCount,
      'isPinned': instance.isPinned,
      'isMuted': instance.isMuted,
      'isArchived': instance.isArchived,
      'metadata': instance.metadata,
    };

const _$ChatTypeEnumMap = {
  ChatType.direct: 'direct',
  ChatType.group: 'group',
  ChatType.channel: 'channel',
};

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      id: json['id'] as String,
      chatId: json['chatId'] as String,
      senderId: json['senderId'] as String,
      sender: User.fromJson(json['sender'] as Map<String, dynamic>),
      content: json['content'] as String,
      messageType: $enumDecode(_$MessageTypeEnumMap, json['messageType']),
      attachmentUrls:
          (json['attachmentUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      replyToMessageId: json['replyToMessageId'] as String?,
      replyToMessage: json['replyToMessage'] == null
          ? null
          : ChatMessage.fromJson(
              json['replyToMessage'] as Map<String, dynamic>,
            ),
      sentAt: DateTime.parse(json['sentAt'] as String),
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      readByUserIds:
          (json['readByUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      status:
          $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
          MessageStatus.sent,
      reactions:
          (json['reactions'] as List<dynamic>?)
              ?.map((e) => MessageReaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chatId': instance.chatId,
      'senderId': instance.senderId,
      'sender': instance.sender,
      'content': instance.content,
      'messageType': _$MessageTypeEnumMap[instance.messageType]!,
      'attachmentUrls': instance.attachmentUrls,
      'replyToMessageId': instance.replyToMessageId,
      'replyToMessage': instance.replyToMessage,
      'sentAt': instance.sentAt.toIso8601String(),
      'editedAt': instance.editedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'readByUserIds': instance.readByUserIds,
      'status': _$MessageStatusEnumMap[instance.status]!,
      'reactions': instance.reactions,
      'metadata': instance.metadata,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.video: 'video',
  MessageType.audio: 'audio',
  MessageType.file: 'file',
  MessageType.location: 'location',
  MessageType.system: 'system',
};

const _$MessageStatusEnumMap = {
  MessageStatus.sending: 'sending',
  MessageStatus.sent: 'sent',
  MessageStatus.delivered: 'delivered',
  MessageStatus.read: 'read',
  MessageStatus.failed: 'failed',
};

_$MessageReactionImpl _$$MessageReactionImplFromJson(
  Map<String, dynamic> json,
) => _$MessageReactionImpl(
  id: json['id'] as String,
  messageId: json['messageId'] as String,
  userId: json['userId'] as String,
  username: json['username'] as String,
  emoji: json['emoji'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$MessageReactionImplToJson(
  _$MessageReactionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'messageId': instance.messageId,
  'userId': instance.userId,
  'username': instance.username,
  'emoji': instance.emoji,
  'createdAt': instance.createdAt.toIso8601String(),
};

_$SendMessageRequestImpl _$$SendMessageRequestImplFromJson(
  Map<String, dynamic> json,
) => _$SendMessageRequestImpl(
  chatId: json['chatId'] as String,
  content: json['content'] as String,
  messageType:
      $enumDecodeNullable(_$MessageTypeEnumMap, json['messageType']) ??
      MessageType.text,
  attachmentUrls: (json['attachmentUrls'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  replyToMessageId: json['replyToMessageId'] as String?,
);

Map<String, dynamic> _$$SendMessageRequestImplToJson(
  _$SendMessageRequestImpl instance,
) => <String, dynamic>{
  'chatId': instance.chatId,
  'content': instance.content,
  'messageType': _$MessageTypeEnumMap[instance.messageType]!,
  'attachmentUrls': instance.attachmentUrls,
  'replyToMessageId': instance.replyToMessageId,
};

_$CreateChatRequestImpl _$$CreateChatRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateChatRequestImpl(
  name: json['name'] as String,
  description: json['description'] as String?,
  chatType:
      $enumDecodeNullable(_$ChatTypeEnumMap, json['chatType']) ??
      ChatType.group,
  participantIds: (json['participantIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  avatarUrl: json['avatarUrl'] as String?,
);

Map<String, dynamic> _$$CreateChatRequestImplToJson(
  _$CreateChatRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'chatType': _$ChatTypeEnumMap[instance.chatType]!,
  'participantIds': instance.participantIds,
  'avatarUrl': instance.avatarUrl,
};
