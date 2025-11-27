import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/unified_auth_provider.dart';
import '../screens/login_screen.dart';

class AuthWrapper extends ConsumerWidget {
  final Widget child;
  
  const AuthWrapper({
    super.key,
    required this.child,
  });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    
    return authState.when(
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stack) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                'Authentication Error',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(authStateProvider);
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      data: (status) {
        if (status is AuthStatusAuthenticated) {
          return child;
        }
        return const LoginScreen();
      },
    );
  }
}