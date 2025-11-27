# State Management Architecture

## Overview
Professional state management using Riverpod 2.0 with AsyncNotifier pattern, sealed classes, and immutable state models.

## Core Principles

### 1. **Immutable State**
All state objects are immutable using Freezed, ensuring predictable state updates and preventing accidental mutations.

### 2. **Type Safety**
Sealed classes provide compile-time guarantees for exhaustive pattern matching.

### 3. **Reactive Updates**
Providers automatically rebuild UI when dependencies change.

## Implementation Patterns

### AsyncNotifier Pattern

```dart
@riverpod
class AuthState extends _$AuthState {
  @override
  FutureOr<AuthStatus> build() async {
    // Initialize state
    final isAuth = await _authService.isAuthenticated();
    return isAuth 
      ? AuthStatus.authenticated(user: user)
      : AuthStatus.unauthenticated();
  }
  
  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    
    try {
      final user = await _authService.signIn(email, password);
      state = AsyncData(AuthStatus.authenticated(user: user));
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}
```

### Sealed Classes for State

```dart
@freezed
sealed class AuthStatus with _$AuthStatus {
  const factory AuthStatus.unknown() = _Unknown;
  const factory AuthStatus.authenticated({
    required String userId,
    required String token,
    DateTime? expiresAt,
  }) = _Authenticated;
  const factory AuthStatus.unauthenticated({
    String? reason,
  }) = _Unauthenticated;
  const factory AuthStatus.authenticating() = _Authenticating;
}
```

### Provider Composition

```dart
// Base service provider
@riverpod
UnifiedAuthService authService(Ref ref) {
  return UnifiedAuthService();
}

// State provider depending on service
@riverpod
class AuthState extends _$AuthState {
  late final _authService = ref.watch(authServiceProvider);
  
  @override
  FutureOr<AuthStatus> build() async {
    return _authService.checkAuthStatus();
  }
}

// Computed provider
@riverpod
bool isAuthenticated(Ref ref) {
  final authState = ref.watch(authStateProvider);
  return authState.whenOrNull(
    data: (status) => status is Authenticated,
  ) ?? false;
}

// Current user provider
@riverpod
User? currentUser(Ref ref) {
  final authState = ref.watch(authStateProvider);
  return authState.whenOrNull(
    data: (status) => status.mapOrNull(
      authenticated: (auth) => auth.user,
    ),
  );
}
```

## State Models

### User State

```dart
@freezed
class UserState with _$UserState {
  const factory UserState({
    required AuthenticationStatus authStatus,
    UserProfile? currentUser,
    PersonalizationSettings? personalization,
    SyncStatus? syncStatus,
    @Default({}) Map<String, dynamic> metadata,
    DateTime? lastSyncedAt,
  }) = _UserState;
  
  factory UserState.initial() => const UserState(
    authStatus: AuthenticationStatus.unknown(),
  );
}
```

### App State Container

```dart
@freezed
class AppState with _$AppState {
  const factory AppState({
    required UserState userState,
    required ChatState chatState,
    required SocialState socialState,
    required NetworkState networkState,
    required UIState uiState,
    @Default({}) Map<String, dynamic> featureFlags,
  }) = _AppState;
  
  factory AppState.initial() => AppState(
    userState: UserState.initial(),
    chatState: ChatState.initial(),
    socialState: SocialState.initial(),
    networkState: NetworkState.connected(),
    uiState: UIState.initial(),
  );
}
```

## Provider Types

### 1. **Service Providers**
Singleton services that live for the app lifetime.

```dart
@Riverpod(keepAlive: true)
DatabaseService databaseService(Ref ref) {
  return DatabaseService();
}
```

### 2. **State Notifiers**
Mutable state containers with business logic.

```dart
@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  List<CartItem> build() => [];
  
  void addItem(Product product) {
    state = [...state, CartItem(product: product)];
  }
}
```

### 3. **Future Providers**
Async data fetching with automatic error handling.

```dart
@riverpod
Future<List<Post>> userPosts(Ref ref, String userId) async {
  final api = ref.watch(apiServiceProvider);
  return api.getUserPosts(userId);
}
```

### 4. **Stream Providers**
Real-time data subscriptions.

```dart
@riverpod
Stream<List<Message>> chatMessages(Ref ref, String roomId) {
  final chat = ref.watch(chatServiceProvider);
  return chat.watchMessages(roomId);
}
```

## Best Practices

### 1. **Provider Naming**
- Services: `serviceNameProvider`
- State: `featureStateProvider`
- Computed: `isConditionProvider` or `computedValueProvider`

### 2. **State Updates**
```dart
// ❌ Bad - Direct mutation
state.user.name = 'New Name';

// ✅ Good - Immutable update
state = state.copyWith(
  user: state.user.copyWith(name: 'New Name'),
);
```

### 3. **Error Handling**
```dart
ref.listen(authStateProvider, (previous, next) {
  next.whenOrNull(
    error: (error, stack) {
      showSnackBar(context, error.toString());
    },
  );
});
```

### 4. **Provider Scoping**
```dart
// Override for testing
ProviderScope(
  overrides: [
    authServiceProvider.overrideWithValue(MockAuthService()),
  ],
  child: MyApp(),
)
```

## Testing

### Unit Testing Providers

```dart
test('authentication state', () async {
  final container = ProviderContainer(
    overrides: [
      authServiceProvider.overrideWithValue(MockAuthService()),
    ],
  );
  
  final state = container.read(authStateProvider);
  expect(state, isA<AsyncLoading>());
  
  await container.read(authStateProvider.future);
  expect(container.read(isAuthenticatedProvider), true);
});
```

### Widget Testing

```dart
testWidgets('shows user name when authenticated', (tester) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        currentUserProvider.overrideWithValue(
          User(name: 'Test User'),
        ),
      ],
      child: MyApp(),
    ),
  );
  
  expect(find.text('Test User'), findsOneWidget);
});
```

## Migration Guide

### From Provider to Riverpod

```dart
// Provider
class AuthModel extends ChangeNotifier {
  User? _user;
  User? get user => _user;
  
  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}

// Riverpod
@riverpod
class AuthState extends _$AuthState {
  @override
  User? build() => null;
  
  void setUser(User user) {
    state = user;
  }
}
```

### From setState to Riverpod

```dart
// StatefulWidget
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isLoading = false;
  
  void loadData() {
    setState(() => isLoading = true);
    // Load data
    setState(() => isLoading = false);
  }
}

// ConsumerWidget
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingProvider);
    
    return ElevatedButton(
      onPressed: () => ref.read(dataProvider.notifier).load(),
      child: isLoading ? CircularProgressIndicator() : Text('Load'),
    );
  }
}
```

## Performance Optimization

### 1. **Selective Rebuilds**
```dart
// Only rebuild when specific field changes
final userName = ref.watch(
  userProvider.select((user) => user?.name),
);
```

### 2. **Provider Caching**
```dart
@Riverpod(keepAlive: true)
Future<ExpensiveData> expensiveComputation(Ref ref) async {
  // This will be cached until explicitly invalidated
  return await computeExpensiveData();
}
```

### 3. **Debouncing**
```dart
@riverpod
class SearchState extends _$SearchState {
  Timer? _debounceTimer;
  
  @override
  List<Result> build() => [];
  
  void search(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      _performSearch(query);
    });
  }
}
```

## Common Patterns

### Loading States
```dart
Widget build(BuildContext context, WidgetRef ref) {
  final asyncValue = ref.watch(dataProvider);
  
  return asyncValue.when(
    data: (data) => DataView(data),
    loading: () => CircularProgressIndicator(),
    error: (error, stack) => ErrorWidget(error),
  );
}
```

### Refresh Pattern
```dart
RefreshIndicator(
  onRefresh: () => ref.refresh(dataProvider.future),
  child: ListView(...),
)
```

### Infinite Scroll
```dart
@riverpod
class PaginatedList extends _$PaginatedList {
  int _page = 1;
  
  @override
  Future<List<Item>> build() async {
    return _loadPage(1);
  }
  
  Future<void> loadMore() async {
    final currentItems = state.valueOrNull ?? [];
    state = const AsyncLoading();
    
    try {
      final newItems = await _loadPage(++_page);
      state = AsyncData([...currentItems, ...newItems]);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}
```

---

This state management architecture provides a scalable, testable, and maintainable foundation for Flutter applications.