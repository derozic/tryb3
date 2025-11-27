# Data Persistence Strategy

## Overview
Multi-tier data persistence architecture implementing offline-first patterns with intelligent caching, background synchronization, and user-specific data isolation.

## Architecture Layers

```
┌─────────────────────────────────────┐
│         UI Layer (Widgets)          │
├─────────────────────────────────────┤
│     State Layer (Riverpod)          │
├─────────────────────────────────────┤
│   Repository Layer (Business)       │
├─────────────────────────────────────┤
│      Cache Layer (Memory)           │
├─────────────────────────────────────┤
│    Local Storage (SQLite/Prefs)     │
├─────────────────────────────────────┤
│     Remote API (REST/GraphQL)       │
└─────────────────────────────────────┘
```

## Storage Technologies

### 1. **SharedPreferences**
Fast key-value storage for simple data.

**Use Cases:**
- Authentication tokens
- User preferences
- App settings
- Small JSON objects

```dart
class PreferenceService {
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';
  
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }
  
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }
}
```

### 2. **Drift (SQLite)**
Relational database for complex data structures.

**Use Cases:**
- Chat messages
- User profiles
- Social posts
- Friend connections
- Offline queue

```dart
@DriftDatabase(tables: [
  ChatMessages,
  UserProfiles,
  SocialPosts,
  FriendConnections,
])
class AppDatabase extends _$AppDatabase {
  @override
  int get schemaVersion => 1;
  
  // User-specific queries
  Future<List<ChatMessage>> getUserMessages(String userId) {
    return (select(chatMessages)
      ..where((m) => m.userId.equals(userId))
      ..orderBy([(m) => OrderingTerm(
        expression: m.createdAt,
        mode: OrderingMode.desc,
      )]))
      .get();
  }
}
```

### 3. **In-Memory Cache**
Fast access for frequently used data.

```dart
class CacheManager {
  final Map<String, CachedData> _cache = {};
  static const Duration _defaultTTL = Duration(minutes: 5);
  
  T? get<T>(String key) {
    final cached = _cache[key];
    if (cached != null && !cached.isExpired) {
      return cached.data as T?;
    }
    _cache.remove(key);
    return null;
  }
  
  void set(String key, dynamic data, {Duration? ttl}) {
    _cache[key] = CachedData(
      data: data,
      timestamp: DateTime.now(),
      ttl: ttl ?? _defaultTTL,
    );
  }
}
```

## Data Models

### User-Specific Tables

```dart
class ChatMessages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get messageId => text().unique()();
  TextColumn get chatRoomId => text()();
  TextColumn get senderId => text()();
  TextColumn get content => text()();
  DateTimeColumn get createdAt => dateTime()();
  
  // User context
  TextColumn get userId => text()(); // Current authenticated user
  BoolColumn get isMine => boolean()();
  
  @override
  List<Set<Column>> get uniqueKeys => [
    {messageId, userId}, // Unique per user
  ];
}
```

### Sync Queue for Offline Operations

```dart
class SyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get operationType => text()(); // create, update, delete
  TextColumn get entityType => text()(); // message, post, profile
  TextColumn get entityId => text()();
  TextColumn get payload => text()(); // JSON data
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  BoolColumn get isPending => boolean().withDefault(const Constant(true))();
}
```

## Caching Strategy

### Cache Levels

1. **L1 - Memory Cache**
   - TTL: 5 minutes
   - Size: 100 items max
   - Use: Hot data

2. **L2 - Local Storage**
   - TTL: 24 hours
   - Size: Unlimited
   - Use: Offline access

3. **L3 - Remote API**
   - TTL: Permanent
   - Size: Unlimited
   - Use: Source of truth

### Cache Invalidation

```dart
class CacheInvalidator {
  // Time-based invalidation
  bool isExpired(DateTime timestamp, Duration ttl) {
    return DateTime.now().difference(timestamp) > ttl;
  }
  
  // Event-based invalidation
  void invalidateUser(String userId) {
    _cache.removeWhere((key, _) => key.contains(userId));
    _notifyListeners(CacheEvent.userInvalidated, userId);
  }
  
  // Manual invalidation
  void invalidateAll() {
    _cache.clear();
    _database.deleteAll();
  }
}
```

## Repository Pattern

```dart
class UserRepository {
  final CacheManager _cache;
  final AppDatabase _database;
  final ApiService _api;
  
  Future<UserProfile?> getUserProfile(String userId) async {
    // L1: Check memory cache
    final cached = _cache.get<UserProfile>('profile:$userId');
    if (cached != null) return cached;
    
    // L2: Check local database
    final local = await _database.getProfile(userId);
    if (local != null) {
      _cache.set('profile:$userId', local);
      
      // Fetch fresh data in background
      _fetchProfileInBackground(userId);
      
      return local;
    }
    
    // L3: Fetch from API
    return _fetchProfile(userId);
  }
  
  Future<UserProfile?> _fetchProfile(String userId) async {
    try {
      final profile = await _api.getUserProfile(userId);
      
      // Update all cache levels
      _cache.set('profile:$userId', profile);
      await _database.upsertProfile(profile);
      
      return profile;
    } catch (e) {
      // Return stale data if available
      return await _database.getProfile(userId);
    }
  }
}
```

## Offline Support

### Sync Queue Implementation

```dart
class SyncService {
  final AppDatabase _database;
  final ApiService _api;
  Timer? _syncTimer;
  
  void startSync() {
    _syncTimer = Timer.periodic(
      const Duration(seconds: 30),
      (_) => _processSyncQueue(),
    );
  }
  
  Future<void> _processSyncQueue() async {
    final pending = await _database.getPendingOperations();
    
    for (final operation in pending) {
      try {
        await _executeOperation(operation);
        await _database.markOperationComplete(operation.id);
      } catch (e) {
        await _database.incrementRetryCount(operation.id);
        
        if (operation.retryCount > 3) {
          await _database.markOperationFailed(operation.id);
        }
      }
    }
  }
  
  Future<void> _executeOperation(SyncOperation op) async {
    switch (op.type) {
      case 'create_message':
        return _api.sendMessage(op.payload);
      case 'update_profile':
        return _api.updateProfile(op.payload);
      case 'delete_post':
        return _api.deletePost(op.entityId);
    }
  }
}
```

### Optimistic Updates

```dart
class ChatRepository {
  Future<Message> sendMessage(String content, String roomId) async {
    // Create optimistic message
    final optimisticMessage = Message(
      id: Uuid().v4(),
      content: content,
      roomId: roomId,
      senderId: currentUserId,
      createdAt: DateTime.now(),
      status: MessageStatus.sending,
    );
    
    // Update UI immediately
    await _database.insertMessage(optimisticMessage);
    _notifyListeners(optimisticMessage);
    
    try {
      // Send to server
      final serverMessage = await _api.sendMessage(content, roomId);
      
      // Update with server data
      await _database.updateMessage(
        optimisticMessage.id,
        serverMessage,
      );
      
      return serverMessage;
    } catch (e) {
      // Queue for retry
      await _syncQueue.add(
        SyncOperation.sendMessage(optimisticMessage),
      );
      
      // Update status
      await _database.updateMessageStatus(
        optimisticMessage.id,
        MessageStatus.failed,
      );
      
      throw e;
    }
  }
}
```

## Data Migration

### Schema Versioning

```dart
@DriftDatabase(tables: [/* ... */])
class AppDatabase extends _$AppDatabase {
  @override
  int get schemaVersion => 2;
  
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          // Add new column
          await m.addColumn(userProfiles, userProfiles.phoneNumber);
          
          // Migrate data
          await customStatement(
            'UPDATE user_profiles SET phone_number = NULL',
          );
        }
      },
    );
  }
}
```

### Data Export/Import

```dart
class DataExporter {
  Future<String> exportUserData(String userId) async {
    final data = {
      'profile': await _database.getUserProfile(userId),
      'messages': await _database.getUserMessages(userId),
      'posts': await _database.getUserPosts(userId),
      'settings': await _database.getUserSettings(userId),
    };
    
    return jsonEncode(data);
  }
  
  Future<void> importUserData(String json) async {
    final data = jsonDecode(json);
    
    await _database.transaction(() async {
      await _database.importProfile(data['profile']);
      await _database.importMessages(data['messages']);
      await _database.importPosts(data['posts']);
      await _database.importSettings(data['settings']);
    });
  }
}
```

## Performance Optimization

### Batch Operations

```dart
Future<void> insertMessages(List<Message> messages) async {
  await _database.batch((batch) {
    for (final message in messages) {
      batch.insert(chatMessages, message.toCompanion());
    }
  });
}
```

### Lazy Loading

```dart
Stream<List<Message>> watchMessages(String roomId) {
  return (select(chatMessages)
    ..where((m) => m.roomId.equals(roomId))
    ..orderBy([(m) => OrderingTerm(
      expression: m.createdAt,
      mode: OrderingMode.desc,
    )])
    ..limit(50)) // Initial load
    .watch()
    .map((messages) => messages.reversed.toList());
}
```

### Indexes

```dart
class OptimizedMessages extends Table {
  // ... columns ...
  
  @override
  List<Set<Column>> get uniqueKeys => [
    {messageId, userId},
  ];
  
  @override
  List<String> get customConstraints => [
    'CREATE INDEX idx_room_created ON chat_messages(room_id, created_at)',
    'CREATE INDEX idx_user_room ON chat_messages(user_id, room_id)',
  ];
}
```

## Security Considerations

### Data Encryption

```dart
class SecureStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  
  Future<void> saveSecure(String key, String value) async {
    final encrypted = await _encrypt(value);
    await _storage.write(key: key, value: encrypted);
  }
  
  Future<String?> getSecure(String key) async {
    final encrypted = await _storage.read(key: key);
    return encrypted != null ? await _decrypt(encrypted) : null;
  }
}
```

### User Isolation

```dart
// Always filter by current user
Future<List<T>> getUserData<T>(String table) {
  return database
    .select(table)
    .where((row) => row.userId.equals(currentUserId))
    .get();
}

// Clear user data on logout
Future<void> clearUserData(String userId) async {
  await database.transaction(() async {
    await database.deleteWhere(chatMessages, (m) => m.userId.equals(userId));
    await database.deleteWhere(userProfiles, (p) => p.userId.equals(userId));
    await database.deleteWhere(socialPosts, (p) => p.userId.equals(userId));
  });
}
```

## Testing

### Mock Database

```dart
class MockDatabase extends AppDatabase {
  @override
  Future<List<Message>> getUserMessages(String userId) async {
    return [
      Message(id: '1', content: 'Test message'),
    ];
  }
}

test('loads user messages', () async {
  final repo = MessageRepository(database: MockDatabase());
  final messages = await repo.getMessages('user123');
  expect(messages, hasLength(1));
});
```

### Cache Testing

```dart
test('cache expiration', () {
  final cache = CacheManager();
  cache.set('key', 'value', ttl: Duration(seconds: 1));
  
  expect(cache.get('key'), equals('value'));
  
  // Wait for expiration
  await Future.delayed(Duration(seconds: 2));
  
  expect(cache.get('key'), isNull);
});
```

---

This data persistence strategy ensures reliable, performant, and secure data management for offline-first Flutter applications.