// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unified_auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$unifiedAuthServiceHash() =>
    r'e5037dda2648131949dbfc9c88c4a9ebbedc2efc';

/// See also [unifiedAuthService].
@ProviderFor(unifiedAuthService)
final unifiedAuthServiceProvider =
    AutoDisposeProvider<UnifiedAuthService>.internal(
      unifiedAuthService,
      name: r'unifiedAuthServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$unifiedAuthServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UnifiedAuthServiceRef = AutoDisposeProviderRef<UnifiedAuthService>;
String _$currentUserHash() => r'54eb0d948ea63b91c05cd91a30c626b68fb2c7e2';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeProvider<Map<String, dynamic>?>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserRef = AutoDisposeProviderRef<Map<String, dynamic>?>;
String _$isAuthenticatedHash() => r'9dad978551e51b6be67ccfe4263098b37c70a0e3';

/// See also [isAuthenticated].
@ProviderFor(isAuthenticated)
final isAuthenticatedProvider = AutoDisposeProvider<bool>.internal(
  isAuthenticated,
  name: r'isAuthenticatedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isAuthenticatedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsAuthenticatedRef = AutoDisposeProviderRef<bool>;
String _$authStateHash() => r'5638c9db91265cd1b27320c4172097efef664d3e';

/// See also [AuthState].
@ProviderFor(AuthState)
final authStateProvider =
    AutoDisposeAsyncNotifierProvider<AuthState, AuthStatus>.internal(
      AuthState.new,
      name: r'authStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AuthState = AutoDisposeAsyncNotifier<AuthStatus>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
