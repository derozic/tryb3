import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../shared/models/user_model.dart';
import '../data/auth_repository.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  User? build() {
    _initializeAuth();
    return null;
  }

  void _initializeAuth() async {
    final authRepo = ref.read(authRepositoryProvider);
    final user = await authRepo.getCurrentUser();
    state = user;
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final authRepo = ref.read(authRepositoryProvider);
    final user = await authRepo.signInWithEmailAndPassword(email, password);
    state = user;
  }

  Future<void> registerWithEmailAndPassword(String email, String password, String name) async {
    final authRepo = ref.read(authRepositoryProvider);
    final user = await authRepo.registerWithEmailAndPassword(email, password, name);
    state = user;
  }

  Future<void> signInWithGoogle() async {
    final authRepo = ref.read(authRepositoryProvider);
    final user = await authRepo.signInWithGoogle();
    state = user;
  }

  Future<void> signOut() async {
    final authRepo = ref.read(authRepositoryProvider);
    await authRepo.signOut();
    state = null;
  }
}

@riverpod
bool isAuthenticated(IsAuthenticatedRef ref) {
  final user = ref.watch(authNotifierProvider);
  return user != null;
}

@riverpod
UserModel? currentUser(CurrentUserRef ref) {
  return ref.watch(authNotifierProvider);
}