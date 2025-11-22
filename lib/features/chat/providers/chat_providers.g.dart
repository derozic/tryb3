// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newMessageStreamHash() => r'22c43f6fdaefdfd3fa13a295adaa0da3382a1dab';

/// See also [newMessageStream].
@ProviderFor(newMessageStream)
final newMessageStreamProvider =
    AutoDisposeStreamProvider<ChatMessage>.internal(
      newMessageStream,
      name: r'newMessageStreamProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$newMessageStreamHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NewMessageStreamRef = AutoDisposeStreamProviderRef<ChatMessage>;
String _$chatUpdateStreamHash() => r'3dfc6e404fefa4a870a5ac35d48f6d47dfefcf36';

/// See also [chatUpdateStream].
@ProviderFor(chatUpdateStream)
final chatUpdateStreamProvider =
    AutoDisposeStreamProvider<Map<String, dynamic>>.internal(
      chatUpdateStream,
      name: r'chatUpdateStreamProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$chatUpdateStreamHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ChatUpdateStreamRef =
    AutoDisposeStreamProviderRef<Map<String, dynamic>>;
String _$chatListHash() => r'56de14593b4406dbdbe966ba2697c1ae4614c391';

/// See also [ChatList].
@ProviderFor(ChatList)
final chatListProvider =
    AutoDisposeAsyncNotifierProvider<ChatList, List<ChatModel>>.internal(
      ChatList.new,
      name: r'chatListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$chatListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ChatList = AutoDisposeAsyncNotifier<List<ChatModel>>;
String _$chatMessagesHash() => r'b5555bd65ede6d58804637d72ca42ae813a28681';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ChatMessages
    extends BuildlessAutoDisposeAsyncNotifier<List<ChatMessage>> {
  late final String chatId;

  FutureOr<List<ChatMessage>> build(String chatId);
}

/// See also [ChatMessages].
@ProviderFor(ChatMessages)
const chatMessagesProvider = ChatMessagesFamily();

/// See also [ChatMessages].
class ChatMessagesFamily extends Family<AsyncValue<List<ChatMessage>>> {
  /// See also [ChatMessages].
  const ChatMessagesFamily();

  /// See also [ChatMessages].
  ChatMessagesProvider call(String chatId) {
    return ChatMessagesProvider(chatId);
  }

  @override
  ChatMessagesProvider getProviderOverride(
    covariant ChatMessagesProvider provider,
  ) {
    return call(provider.chatId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatMessagesProvider';
}

/// See also [ChatMessages].
class ChatMessagesProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<ChatMessages, List<ChatMessage>> {
  /// See also [ChatMessages].
  ChatMessagesProvider(String chatId)
    : this._internal(
        () => ChatMessages()..chatId = chatId,
        from: chatMessagesProvider,
        name: r'chatMessagesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$chatMessagesHash,
        dependencies: ChatMessagesFamily._dependencies,
        allTransitiveDependencies:
            ChatMessagesFamily._allTransitiveDependencies,
        chatId: chatId,
      );

  ChatMessagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatId,
  }) : super.internal();

  final String chatId;

  @override
  FutureOr<List<ChatMessage>> runNotifierBuild(
    covariant ChatMessages notifier,
  ) {
    return notifier.build(chatId);
  }

  @override
  Override overrideWith(ChatMessages Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatMessagesProvider._internal(
        () => create()..chatId = chatId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatId: chatId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChatMessages, List<ChatMessage>>
  createElement() {
    return _ChatMessagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatMessagesProvider && other.chatId == chatId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChatMessagesRef
    on AutoDisposeAsyncNotifierProviderRef<List<ChatMessage>> {
  /// The parameter `chatId` of this provider.
  String get chatId;
}

class _ChatMessagesProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<ChatMessages, List<ChatMessage>>
    with ChatMessagesRef {
  _ChatMessagesProviderElement(super.provider);

  @override
  String get chatId => (origin as ChatMessagesProvider).chatId;
}

String _$chatDetailHash() => r'7ce92b5a318c6401a290f3f3002828edace247a7';

abstract class _$ChatDetail
    extends BuildlessAutoDisposeAsyncNotifier<ChatModel> {
  late final String chatId;

  FutureOr<ChatModel> build(String chatId);
}

/// See also [ChatDetail].
@ProviderFor(ChatDetail)
const chatDetailProvider = ChatDetailFamily();

/// See also [ChatDetail].
class ChatDetailFamily extends Family<AsyncValue<ChatModel>> {
  /// See also [ChatDetail].
  const ChatDetailFamily();

  /// See also [ChatDetail].
  ChatDetailProvider call(String chatId) {
    return ChatDetailProvider(chatId);
  }

  @override
  ChatDetailProvider getProviderOverride(
    covariant ChatDetailProvider provider,
  ) {
    return call(provider.chatId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatDetailProvider';
}

/// See also [ChatDetail].
class ChatDetailProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChatDetail, ChatModel> {
  /// See also [ChatDetail].
  ChatDetailProvider(String chatId)
    : this._internal(
        () => ChatDetail()..chatId = chatId,
        from: chatDetailProvider,
        name: r'chatDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$chatDetailHash,
        dependencies: ChatDetailFamily._dependencies,
        allTransitiveDependencies: ChatDetailFamily._allTransitiveDependencies,
        chatId: chatId,
      );

  ChatDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatId,
  }) : super.internal();

  final String chatId;

  @override
  FutureOr<ChatModel> runNotifierBuild(covariant ChatDetail notifier) {
    return notifier.build(chatId);
  }

  @override
  Override overrideWith(ChatDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatDetailProvider._internal(
        () => create()..chatId = chatId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatId: chatId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChatDetail, ChatModel>
  createElement() {
    return _ChatDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatDetailProvider && other.chatId == chatId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChatDetailRef on AutoDisposeAsyncNotifierProviderRef<ChatModel> {
  /// The parameter `chatId` of this provider.
  String get chatId;
}

class _ChatDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChatDetail, ChatModel>
    with ChatDetailRef {
  _ChatDetailProviderElement(super.provider);

  @override
  String get chatId => (origin as ChatDetailProvider).chatId;
}

String _$typingIndicatorsHash() => r'58d409f7d900cc508462670dfaf2fdc165b5c797';

/// See also [TypingIndicators].
@ProviderFor(TypingIndicators)
final typingIndicatorsProvider =
    AutoDisposeNotifierProvider<TypingIndicators, Map<String, bool>>.internal(
      TypingIndicators.new,
      name: r'typingIndicatorsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$typingIndicatorsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TypingIndicators = AutoDisposeNotifier<Map<String, bool>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
