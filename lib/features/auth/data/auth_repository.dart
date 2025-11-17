import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../shared/models/user_model.dart';

part 'auth_repository.g.dart';

abstract class AuthRepository {
  Future<UserModel> signInWithEmailAndPassword(String email, String password);
  Future<UserModel> registerWithEmailAndPassword(String email, String password, String name);
  Future<UserModel> signInWithGoogle();
  Future<void> signOut();
  Future<UserModel?> getCurrentUser();
  Stream<UserModel?> authStateChanges();
}

class MockAuthRepository implements AuthRepository {
  UserModel? _currentUser;
  
  @override
  Future<UserModel> signInWithEmailAndPassword(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    
    if (email == 'test@example.com' && password == 'password123') {
      _currentUser = UserModel(
        id: '1',
        email: 'test@example.com',
        username: 'testuser',
        displayName: 'Test User',
        bio: 'Hello, I\'m a test user!',
        followersCount: 42,
        followingCount: 15,
        postsCount: 8,
        isVerified: false,
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
      );
      return _currentUser!;
    }
    
    throw Exception('Invalid email or password');
  }

  @override
  Future<UserModel> registerWithEmailAndPassword(String email, String password, String name) async {
    await Future.delayed(const Duration(seconds: 2));
    
    _currentUser = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      username: name.toLowerCase().replaceAll(' ', ''),
      displayName: name,
      bio: 'New user on Tryb3!',
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    );
    
    return _currentUser!;
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    await Future.delayed(const Duration(seconds: 2));
    
    _currentUser = UserModel(
      id: '2',
      email: 'google@example.com',
      username: 'googleuser',
      displayName: 'Google User',
      bio: 'Signed in with Google',
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
    );
    
    return _currentUser!;
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    return _currentUser;
  }

  @override
  Stream<UserModel?> authStateChanges() async* {
    yield _currentUser;
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return MockAuthRepository();
}