// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newFriendRequestStreamHash() =>
    r'a99b3abdbd6d8d4a44df44c401a8a5e4674a1e25';

/// See also [newFriendRequestStream].
@ProviderFor(newFriendRequestStream)
final newFriendRequestStreamProvider =
    AutoDisposeStreamProvider<FriendRequest>.internal(
      newFriendRequestStream,
      name: r'newFriendRequestStreamProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$newFriendRequestStreamHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NewFriendRequestStreamRef = AutoDisposeStreamProviderRef<FriendRequest>;
String _$friendshipUpdateStreamHash() =>
    r'ba653eeaeeb54867230b2ad2680636950391c5b5';

/// See also [friendshipUpdateStream].
@ProviderFor(friendshipUpdateStream)
final friendshipUpdateStreamProvider =
    AutoDisposeStreamProvider<Map<String, dynamic>>.internal(
      friendshipUpdateStream,
      name: r'friendshipUpdateStreamProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$friendshipUpdateStreamHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FriendshipUpdateStreamRef =
    AutoDisposeStreamProviderRef<Map<String, dynamic>>;
String _$userOnlineStatusStreamHash() =>
    r'ab98cb6859354cbf16d03fe2a2c2c152dbcf9fa7';

/// See also [userOnlineStatusStream].
@ProviderFor(userOnlineStatusStream)
final userOnlineStatusStreamProvider =
    AutoDisposeStreamProvider<Map<String, dynamic>>.internal(
      userOnlineStatusStream,
      name: r'userOnlineStatusStreamProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userOnlineStatusStreamHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserOnlineStatusStreamRef =
    AutoDisposeStreamProviderRef<Map<String, dynamic>>;
String _$friendsListHash() => r'f91de4ce7be092f8ff23d6bf429e61927583230f';

/// See also [FriendsList].
@ProviderFor(FriendsList)
final friendsListProvider =
    AutoDisposeAsyncNotifierProvider<
      FriendsList,
      List<FriendConnection>
    >.internal(
      FriendsList.new,
      name: r'friendsListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$friendsListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FriendsList = AutoDisposeAsyncNotifier<List<FriendConnection>>;
String _$friendRequestsHash() => r'e20031d93fcb4c25ede9f0bb77abd7d6ee3b46d0';

/// See also [FriendRequests].
@ProviderFor(FriendRequests)
final friendRequestsProvider =
    AutoDisposeAsyncNotifierProvider<
      FriendRequests,
      List<FriendRequest>
    >.internal(
      FriendRequests.new,
      name: r'friendRequestsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$friendRequestsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FriendRequests = AutoDisposeAsyncNotifier<List<FriendRequest>>;
String _$sentFriendRequestsHash() =>
    r'96781dd8e966d96f951615b7a9f2bf63cd87934f';

/// See also [SentFriendRequests].
@ProviderFor(SentFriendRequests)
final sentFriendRequestsProvider =
    AutoDisposeAsyncNotifierProvider<
      SentFriendRequests,
      List<FriendRequest>
    >.internal(
      SentFriendRequests.new,
      name: r'sentFriendRequestsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sentFriendRequestsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SentFriendRequests = AutoDisposeAsyncNotifier<List<FriendRequest>>;
String _$userSuggestionsHash() => r'3c682d90f4b84e10b729d5510c964bf8a6debf25';

/// See also [UserSuggestions].
@ProviderFor(UserSuggestions)
final userSuggestionsProvider =
    AutoDisposeAsyncNotifierProvider<
      UserSuggestions,
      List<UserSuggestion>
    >.internal(
      UserSuggestions.new,
      name: r'userSuggestionsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userSuggestionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UserSuggestions = AutoDisposeAsyncNotifier<List<UserSuggestion>>;
String _$networkStatsHash() => r'72e5f56e38fcd088cd2894dd4b48e5badd1a0cb5';

/// See also [NetworkStats].
@ProviderFor(NetworkStats)
final networkStatsProvider =
    AutoDisposeAsyncNotifierProvider<NetworkStats, NetworkStats>.internal(
      NetworkStats.new,
      name: r'networkStatsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$networkStatsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$NetworkStats = AutoDisposeAsyncNotifier<NetworkStats>;
String _$mutualFriendsHash() => r'3000c16738cb8b9d8696d6dd5ce014a4358493a7';

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

abstract class _$MutualFriends
    extends BuildlessAutoDisposeAsyncNotifier<List<FriendConnection>> {
  late final String userId;

  FutureOr<List<FriendConnection>> build(String userId);
}

/// See also [MutualFriends].
@ProviderFor(MutualFriends)
const mutualFriendsProvider = MutualFriendsFamily();

/// See also [MutualFriends].
class MutualFriendsFamily extends Family<AsyncValue<List<FriendConnection>>> {
  /// See also [MutualFriends].
  const MutualFriendsFamily();

  /// See also [MutualFriends].
  MutualFriendsProvider call(String userId) {
    return MutualFriendsProvider(userId);
  }

  @override
  MutualFriendsProvider getProviderOverride(
    covariant MutualFriendsProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mutualFriendsProvider';
}

/// See also [MutualFriends].
class MutualFriendsProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          MutualFriends,
          List<FriendConnection>
        > {
  /// See also [MutualFriends].
  MutualFriendsProvider(String userId)
    : this._internal(
        () => MutualFriends()..userId = userId,
        from: mutualFriendsProvider,
        name: r'mutualFriendsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$mutualFriendsHash,
        dependencies: MutualFriendsFamily._dependencies,
        allTransitiveDependencies:
            MutualFriendsFamily._allTransitiveDependencies,
        userId: userId,
      );

  MutualFriendsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<List<FriendConnection>> runNotifierBuild(
    covariant MutualFriends notifier,
  ) {
    return notifier.build(userId);
  }

  @override
  Override overrideWith(MutualFriends Function() create) {
    return ProviderOverride(
      origin: this,
      override: MutualFriendsProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MutualFriends, List<FriendConnection>>
  createElement() {
    return _MutualFriendsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MutualFriendsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MutualFriendsRef
    on AutoDisposeAsyncNotifierProviderRef<List<FriendConnection>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _MutualFriendsProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          MutualFriends,
          List<FriendConnection>
        >
    with MutualFriendsRef {
  _MutualFriendsProviderElement(super.provider);

  @override
  String get userId => (origin as MutualFriendsProvider).userId;
}

String _$blockedUsersHash() => r'ef95aaeb5724ca2023d339327a2c662fae08edc9';

/// See also [BlockedUsers].
@ProviderFor(BlockedUsers)
final blockedUsersProvider =
    AutoDisposeAsyncNotifierProvider<
      BlockedUsers,
      List<FriendConnection>
    >.internal(
      BlockedUsers.new,
      name: r'blockedUsersProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$blockedUsersHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BlockedUsers = AutoDisposeAsyncNotifier<List<FriendConnection>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
