// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postsFeedHash() => r'3e0c1b095c6473a9fa217efb585a8cb88137cb82';

/// See also [PostsFeed].
@ProviderFor(PostsFeed)
final postsFeedProvider =
    AutoDisposeAsyncNotifierProvider<PostsFeed, List<PostModel>>.internal(
      PostsFeed.new,
      name: r'postsFeedProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$postsFeedHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PostsFeed = AutoDisposeAsyncNotifier<List<PostModel>>;
String _$postCreationHash() => r'12dc63d970b011d231275fdaf1510eb94310f007';

/// See also [PostCreation].
@ProviderFor(PostCreation)
final postCreationProvider =
    AutoDisposeNotifierProvider<PostCreation, AsyncValue<void>>.internal(
      PostCreation.new,
      name: r'postCreationProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$postCreationHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PostCreation = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
