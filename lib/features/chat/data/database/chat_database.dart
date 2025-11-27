import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'chat_database.g.dart';

// Message table definition
class Messages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get messageId => text().unique()();
  TextColumn get chatId => text()();
  TextColumn get senderId => text()();
  TextColumn get senderName => text()();
  TextColumn get senderAvatar => text().nullable()();
  TextColumn get content => text()();
  IntColumn get messageType => intEnum<MessageType>()();
  TextColumn get attachmentUrls => text().nullable()(); // JSON array
  TextColumn get replyToMessageId => text().nullable()();
  DateTimeColumn get sentAt => dateTime()();
  DateTimeColumn get editedAt => dateTime().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get readByUserIds => text()(); // JSON array
  IntColumn get status => intEnum<MessageStatus>()();
  TextColumn get reactions => text().nullable()(); // JSON array
  BoolColumn get isSentByMe => boolean().withDefault(const Constant(false))();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  DateTimeColumn get localCreatedAt => dateTime().withDefault(currentDateAndTime)();
}

// Chat table definition
class Chats extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get chatId => text().unique()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get avatarUrl => text().nullable()();
  IntColumn get chatType => intEnum<ChatType>()();
  TextColumn get participantIds => text()(); // JSON array
  TextColumn get lastMessageId => text().nullable()();
  TextColumn get lastMessage => text().nullable()();
  DateTimeColumn get lastMessageTime => dateTime().nullable()();
  IntColumn get unreadCount => integer().withDefault(const Constant(0))();
  BoolColumn get isPinned => boolean().withDefault(const Constant(false))();
  BoolColumn get isMuted => boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  TextColumn get metadata => text().nullable()(); // JSON
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

// Typing indicators table
class TypingIndicators extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get chatId => text()();
  TextColumn get userId => text()();
  TextColumn get userName => text()();
  DateTimeColumn get startedAt => dateTime()();
  
  @override
  Set<Column> get primaryKey => {chatId, userId};
}

// Sync queue table for offline messages
class SyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get action => text()(); // 'send_message', 'edit_message', 'delete_message'
  TextColumn get payload => text()(); // JSON payload
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  BoolColumn get isSyncing => boolean().withDefault(const Constant(false))();
}

enum MessageType { text, image, file, location, voice, video }
enum MessageStatus { sending, sent, delivered, read, failed }
enum ChatType { direct, group, channel }

@DriftDatabase(tables: [Messages, Chats, TypingIndicators, SyncQueue])
class ChatDatabase extends _$ChatDatabase {
  ChatDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Messages queries
  Stream<List<Message>> watchMessagesForChat(String chatId, {int limit = 50}) {
    return (select(messages)
      ..where((tbl) => tbl.chatId.equals(chatId))
      ..orderBy([
        (t) => OrderingTerm(expression: t.sentAt, mode: OrderingMode.desc)
      ])
      ..limit(limit))
      .watch();
  }

  Future<int> insertMessage(MessagesCompanion message) {
    return into(messages).insert(message);
  }

  Future<bool> updateMessage(MessagesCompanion message) {
    return update(messages).replace(message);
  }

  Future<int> deleteMessage(String messageId) {
    return (delete(messages)..where((tbl) => tbl.messageId.equals(messageId)))
        .go();
  }

  Future<void> markMessagesAsRead(String chatId, String userId) async {
    final messagesToUpdate = await (select(messages)
      ..where((tbl) => tbl.chatId.equals(chatId))
      ..where((tbl) => tbl.isSentByMe.equals(false)))
      .get();

    for (final message in messagesToUpdate) {
      final readBy = message.readByUserIds.split(',').toList();
      if (!readBy.contains(userId)) {
        readBy.add(userId);
        await (update(messages)..where((tbl) => tbl.id.equals(message.id)))
          .write(MessagesCompanion(
            readByUserIds: Value(readBy.join(',')),
            status: const Value(MessageStatus.read),
          ));
      }
    }
  }

  // Chats queries
  Stream<List<Chat>> watchAllChats() {
    return (select(chats)
      ..orderBy([
        (t) => OrderingTerm(
          expression: t.isPinned,
          mode: OrderingMode.desc,
        ),
        (t) => OrderingTerm(
          expression: t.lastMessageTime,
          mode: OrderingMode.desc,
        ),
      ]))
      .watch();
  }

  Future<int> insertChat(ChatsCompanion chat) {
    return into(chats).insert(chat);
  }

  Future<bool> updateChat(ChatsCompanion chat) {
    return update(chats).replace(chat);
  }

  Future<Chat?> getChatById(String chatId) {
    return (select(chats)..where((tbl) => tbl.chatId.equals(chatId)))
        .getSingleOrNull();
  }

  Future<void> updateUnreadCount(String chatId, int count) {
    return (update(chats)..where((tbl) => tbl.chatId.equals(chatId)))
      .write(ChatsCompanion(unreadCount: Value(count)));
  }

  // Typing indicators
  Stream<List<TypingIndicator>> watchTypingIndicators(String chatId) {
    return (select(typingIndicators)
      ..where((tbl) => tbl.chatId.equals(chatId)))
      .watch();
  }

  Future<void> setTypingIndicator(String chatId, String userId, String userName) {
    return into(typingIndicators).insertOnConflictUpdate(
      TypingIndicatorsCompanion(
        chatId: Value(chatId),
        userId: Value(userId),
        userName: Value(userName),
        startedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> removeTypingIndicator(String chatId, String userId) {
    return (delete(typingIndicators)
      ..where((tbl) => tbl.chatId.equals(chatId))
      ..where((tbl) => tbl.userId.equals(userId)))
      .go();
  }

  // Sync queue for offline support
  Future<int> addToSyncQueue(String action, Map<String, dynamic> payload) {
    return into(syncQueue).insert(SyncQueueCompanion(
      action: Value(action),
      payload: Value(payload.toString()),
    ));
  }

  Stream<List<SyncQueueData>> watchPendingSyncItems() {
    return (select(syncQueue)
      ..where((tbl) => tbl.isSyncing.equals(false))
      ..orderBy([(t) => OrderingTerm(expression: t.createdAt)]))
      .watch();
  }

  Future<void> markSyncItemAsProcessing(int id) {
    return (update(syncQueue)..where((tbl) => tbl.id.equals(id)))
      .write(const SyncQueueCompanion(isSyncing: Value(true)));
  }

  Future<void> removeSyncItem(int id) {
    return (delete(syncQueue)..where((tbl) => tbl.id.equals(id))).go();
  }

  // Clean up old typing indicators (older than 10 seconds)
  Future<void> cleanupOldTypingIndicators() {
    final tenSecondsAgo = DateTime.now().subtract(const Duration(seconds: 10));
    return (delete(typingIndicators)
      ..where((tbl) => tbl.startedAt.isSmallerThanValue(tenSecondsAgo)))
      .go();
  }

  // Search messages
  Future<List<Message>> searchMessages(String query, {String? chatId}) {
    var queryBuilder = select(messages);
    
    if (chatId != null) {
      queryBuilder.where((tbl) => tbl.chatId.equals(chatId));
    }
    
    queryBuilder.where((tbl) => tbl.content.like('%$query%'));
    queryBuilder.orderBy([
      (t) => OrderingTerm(expression: t.sentAt, mode: OrderingMode.desc)
    ]);
    
    return queryBuilder.get();
  }

  // Clear all data (for logout)
  Future<void> clearAllData() async {
    await delete(messages).go();
    await delete(chats).go();
    await delete(typingIndicators).go();
    await delete(syncQueue).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'tryb3_chat.db'));
    return NativeDatabase(file);
  });
}