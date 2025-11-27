import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/services/unified_auth_service.dart';

part 'unified_auth_provider.g.dart';

// Unified Auth Service Provider
@riverpod
UnifiedAuthService unifiedAuthService(Ref ref) {
  return UnifiedAuthService();
}

// Auth State Provider
@riverpod
class AuthState extends _$AuthState {
  late UnifiedAuthService _authService;
  
  @override
  FutureOr<AuthStatus> build() async {
    _authService = ref.watch(unifiedAuthServiceProvider);
    
    // Check if user is already authenticated
    final isAuth = await _authService.isAuthenticated();
    if (isAuth) {
      final user = _authService.currentUser;
      return AuthStatus.authenticated(user: user);
    }
    
    return const AuthStatus.unauthenticated();
  }
  
  Future<void> signInWithGoogle({String? hostedDomain}) async {
    state = const AsyncLoading();
    
    final result = await _authService.signInWithGoogle(hostedDomain: hostedDomain);
    
    if (result['success']) {
      state = AsyncData(AuthStatus.authenticated(user: result['user']));
    } else {
      state = AsyncError(result['error'], StackTrace.current);
    }
  }
  
  Future<void> sendOTP(String phoneNumber) async {
    state = const AsyncLoading();
    
    final result = await _authService.sendOTP(phoneNumber);
    
    if (result['success']) {
      state = AsyncData(AuthStatus.otpSent(phoneNumber: phoneNumber));
    } else {
      state = AsyncError(result['error'], StackTrace.current);
    }
  }
  
  Future<void> verifyOTP(String phoneNumber, String otpCode) async {
    state = const AsyncLoading();
    
    final result = await _authService.verifyOTP(phoneNumber, otpCode);
    
    if (result['success']) {
      state = AsyncData(AuthStatus.authenticated(user: result['user']));
    } else {
      state = AsyncError(result['error'], StackTrace.current);
    }
  }
  
  Future<void> linkGoogleAccount(
    String phoneNumber,
    String otpCode,
    String googleToken,
  ) async {
    state = const AsyncLoading();
    
    final result = await _authService.linkGoogleAccount(
      phoneNumber,
      otpCode,
      googleToken,
    );
    
    if (result['success']) {
      state = AsyncData(AuthStatus.authenticated(user: result['user']));
    } else {
      state = AsyncError(result['error'], StackTrace.current);
    }
  }
  
  Future<void> updateProfile(Map<String, dynamic> updates) async {
    final currentState = state.valueOrNull;
    if (currentState is! AuthStatusAuthenticated) return;
    
    final result = await _authService.updateProfile(updates);
    
    if (result['success']) {
      state = AsyncData(AuthStatus.authenticated(user: result['user']));
    }
  }
  
  Future<void> logout() async {
    await _authService.logout();
    state = const AsyncData(AuthStatus.unauthenticated());
  }
}

// Auth Status sealed class for state management
sealed class AuthStatus {
  const AuthStatus();
  
  const factory AuthStatus.unauthenticated() = AuthStatusUnauthenticated;
  const factory AuthStatus.authenticated({required Map<String, dynamic>? user}) = AuthStatusAuthenticated;
  const factory AuthStatus.otpSent({required String phoneNumber}) = AuthStatusOtpSent;
}

class AuthStatusUnauthenticated extends AuthStatus {
  const AuthStatusUnauthenticated();
}

class AuthStatusAuthenticated extends AuthStatus {
  final Map<String, dynamic>? user;
  
  const AuthStatusAuthenticated({required this.user});
}

class AuthStatusOtpSent extends AuthStatus {
  final String phoneNumber;
  
  const AuthStatusOtpSent({required this.phoneNumber});
}

// Current user provider
@riverpod
Map<String, dynamic>? currentUser(Ref ref) {
  final authState = ref.watch(authStateProvider);
  
  return authState.whenOrNull(
    data: (status) {
      if (status is AuthStatusAuthenticated) {
        return status.user;
      }
      return null;
    },
  );
}

// Is authenticated provider
@riverpod
bool isAuthenticated(Ref ref) {
  final authState = ref.watch(authStateProvider);
  
  return authState.whenOrNull(
    data: (status) => status is AuthStatusAuthenticated,
  ) ?? false;
}