# Flutter Mobile Standards

## Overview
Professional Flutter development standards established through TRYB3 implementation, ready for enterprise-grade applications.

## Project Structure

```
lib/
├── core/                    # Core functionality
│   ├── constants/          # App-wide constants
│   ├── data/              # Data layer
│   │   ├── models/       # Data models
│   │   └── repositories/ # Repository pattern
│   ├── router/           # Navigation
│   ├── services/         # Business logic services
│   ├── theme/           # App theming
│   └── utils/          # Utility functions
├── features/           # Feature modules
│   ├── auth/          # Authentication
│   │   ├── data/
│   │   ├── models/
│   │   ├── providers/
│   │   ├── screens/
│   │   └── widgets/
│   ├── chat/          # Chat feature
│   ├── social/        # Social features
│   └── profile/       # User profiles
├── shared/            # Shared across features
│   ├── models/
│   ├── widgets/
│   └── utils/
└── main.dart         # App entry point
```

## Naming Conventions

### Files
- **Snake case**: `user_profile.dart`
- **Descriptive names**: `authentication_service.dart` not `auth.dart`
- **Suffix by type**: `_model.dart`, `_provider.dart`, `_screen.dart`

### Classes
```dart
// Models
class UserModel {}          // Data model
class UserProfile {}        // Domain model

// Providers
class AuthNotifier {}       // State notifier
class AuthStateProvider {}  // Provider

// Services
class AuthenticationService {} // Business logic
class DatabaseService {}       // Infrastructure

// Widgets
class LoginScreen {}        // Full page
class UserCard {}          // Reusable widget
class LoadingIndicator {}  // UI component
```

### Variables
```dart
// Private members
String _privateField;
void _privateMethod() {}

// Public members  
String publicField;
void publicMethod() {}

// Constants
static const String API_KEY = 'key';
static const int MAX_RETRIES = 3;

// Boolean naming
bool isLoading;
bool hasError;
bool canSubmit;
```

## Code Organization

### Feature Module Structure
```dart
features/
└── auth/
    ├── data/
    │   └── auth_repository.dart      # Data access
    ├── models/
    │   └── auth_models.dart         # Data models
    ├── providers/
    │   └── auth_providers.dart      # State management
    ├── screens/
    │   ├── login_screen.dart        # UI screens
    │   └── register_screen.dart
    └── widgets/
        ├── login_form.dart           # Feature widgets
        └── social_login_buttons.dart
```

### Import Organization
```dart
// 1. Dart imports
import 'dart:async';
import 'dart:convert';

// 2. Flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 3. Package imports (alphabetical)
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 4. Project imports (by layer)
import '../../../core/constants/app_constants.dart';
import '../../../core/services/api_service.dart';
import '../../shared/widgets/loading_widget.dart';

// 5. Part files
part 'user_model.freezed.dart';
part 'user_model.g.dart';
```

## State Management Patterns

### Provider Patterns
```dart
// Service provider (singleton)
@Riverpod(keepAlive: true)
DatabaseService databaseService(Ref ref) {
  return DatabaseService();
}

// State notifier
@riverpod
class AuthState extends _$AuthState {
  @override
  FutureOr<User?> build() async {
    return _checkAuthStatus();
  }
  
  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => 
      _authService.signIn(email, password)
    );
  }
}

// Computed provider
@riverpod
bool isAuthenticated(Ref ref) {
  final user = ref.watch(currentUserProvider);
  return user != null;
}
```

### Widget Patterns
```dart
// ConsumerWidget for simple cases
class UserProfile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Text(user?.name ?? 'Guest');
  }
}

// ConsumerStatefulWidget for complex state
class ComplexForm extends ConsumerStatefulWidget {
  @override
  ConsumerState<ComplexForm> createState() => _ComplexFormState();
}

class _ComplexFormState extends ConsumerState<ComplexForm> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    // Access ref here
  }
}
```

## Error Handling

### Try-Catch Patterns
```dart
Future<User?> fetchUser(String id) async {
  try {
    final response = await _api.getUser(id);
    return User.fromJson(response);
  } on DioException catch (e) {
    _logger.error('Network error', e);
    throw NetworkException(e.message);
  } catch (e, stack) {
    _logger.error('Unexpected error', e, stack);
    throw UnexpectedError();
  }
}
```

### AsyncValue Error Handling
```dart
Widget build(BuildContext context, WidgetRef ref) {
  final asyncUser = ref.watch(userProvider);
  
  return asyncUser.when(
    data: (user) => UserView(user),
    loading: () => const LoadingView(),
    error: (error, stack) => ErrorView(
      error: error,
      onRetry: () => ref.invalidate(userProvider),
    ),
  );
}
```

## Performance Optimization

### Widget Optimization
```dart
// Use const constructors
const MyWidget({super.key});

// Minimize rebuilds
final userName = ref.watch(
  userProvider.select((user) => user?.name)
);

// Extract static widgets
class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _StaticHeader(), // Won't rebuild
        _DynamicContent(),
      ],
    );
  }
}
```

### Image Optimization
```dart
// Cache network images
CachedNetworkImage(
  imageUrl: url,
  placeholder: (_, __) => const Shimmer(),
  errorWidget: (_, __, ___) => const Icon(Icons.error),
  cacheManager: CustomCacheManager(),
);

// Optimize local images
Image.asset(
  'assets/image.png',
  width: 100,
  height: 100,
  fit: BoxFit.cover,
  cacheWidth: 100,  // Resize in memory
  cacheHeight: 100,
);
```

## Testing Standards

### Unit Testing
```dart
group('AuthService', () {
  late AuthService authService;
  late MockApiClient mockApi;
  
  setUp(() {
    mockApi = MockApiClient();
    authService = AuthService(mockApi);
  });
  
  test('signIn returns user on success', () async {
    when(() => mockApi.post(any(), data: any(named: 'data')))
      .thenAnswer((_) async => {'user': testUser});
    
    final user = await authService.signIn('email', 'password');
    
    expect(user, isA<User>());
    verify(() => mockApi.post('/auth/login', data: any()));
  });
});
```

### Widget Testing
```dart
testWidgets('shows loading during sign in', (tester) async {
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(home: LoginScreen()),
    ),
  );
  
  await tester.enterText(find.byType(TextField).first, 'email');
  await tester.enterText(find.byType(TextField).last, 'password');
  await tester.tap(find.text('Sign In'));
  await tester.pump();
  
  expect(find.byType(CircularProgressIndicator), findsOneWidget);
});
```

## Security Best Practices

### Sensitive Data
```dart
// Never log sensitive data
_logger.info('User logged in', {'userId': user.id}); // ✅
_logger.info('User logged in', user.toJson()); // ❌

// Use secure storage for sensitive data
final secureStorage = FlutterSecureStorage();
await secureStorage.write(key: 'token', value: token);

// Clear sensitive data on logout
await secureStorage.deleteAll();
SharedPreferences.getInstance().then((p) => p.clear());
```

### Input Validation
```dart
class EmailValidator {
  static final _regex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
  );
  
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!_regex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }
}
```

## Documentation

### Code Comments
```dart
/// Service responsible for user authentication.
/// 
/// Handles sign in, sign out, and token management.
class AuthService {
  /// Signs in a user with email and password.
  /// 
  /// Throws [NetworkException] on connection failure.
  /// Throws [InvalidCredentialsException] on auth failure.
  Future<User> signIn(String email, String password) async {
    // Implementation
  }
}
```

### README Structure
```markdown
# Project Name

## Overview
Brief description of the project.

## Features
- Feature 1
- Feature 2

## Getting Started
### Prerequisites
- Flutter 3.9.2
- Dart 3.0.0

### Installation
\`\`\`bash
flutter pub get
flutter run
\`\`\`

## Architecture
Description of app architecture.

## Testing
\`\`\`bash
flutter test
\`\`\`

## Contributing
Contribution guidelines.
```

## Build & Release

### Environment Configuration
```dart
// Use environment variables
class Environment {
  static const String apiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'http://localhost:8000',
  );
  
  static const bool isProduction = bool.fromEnvironment(
    'PRODUCTION',
    defaultValue: false,
  );
}

// Run with environment
// flutter run --dart-define=API_URL=https://api.prod.com
```

### Build Optimization
```bash
# Production build with optimization
flutter build apk --release --obfuscate --split-debug-info=debug_info

# iOS build
flutter build ios --release --obfuscate --split-debug-info=debug_info
```

## Continuous Integration

### GitHub Actions Example
```yaml
name: Flutter CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.9.2'
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
      - run: flutter build apk --debug
```

## Tools & Extensions

### Recommended VS Code Extensions
- Flutter
- Dart
- Awesome Flutter Snippets
- Error Lens
- GitLens

### Development Tools
- Flutter Inspector
- Dart DevTools
- Network profiler
- Performance overlay

### Code Generation
```bash
# Generate Freezed models
flutter pub run build_runner build --delete-conflicting-outputs

# Watch for changes
flutter pub run build_runner watch
```

---

These standards ensure consistent, maintainable, and scalable Flutter applications following industry best practices.