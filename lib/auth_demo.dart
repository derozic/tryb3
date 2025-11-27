import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/auth/providers/unified_auth_provider.dart';

void main() {
  runApp(const ProviderScope(child: AuthDemoApp()));
}

class AuthDemoApp extends StatelessWidget {
  const AuthDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRYB3 Auth Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const AuthDemoScreen(),
    );
  }
}

class AuthDemoScreen extends ConsumerWidget {
  const AuthDemoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    
    return authState.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(authStateProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      data: (status) {
        return status.when(
          unknown: () => const LoginScreen(),
          authenticated: (userId, token, refreshToken, expiresAt) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('TRYB3 - Authenticated'),
                actions: [
                  IconButton(
                    onPressed: () async {
                      await ref.read(authStateProvider.notifier).logout();
                    },
                    icon: const Icon(Icons.logout),
                  ),
                ],
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.check_circle, 
                      size: 100, 
                      color: Colors.green
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Welcome!',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'User ID: $userId',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Token: ${token.substring(0, 20)}...',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 32),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Text(
                              'Authentication Features',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildFeatureRow(Icons.login, 'Google Sign-In'),
                            _buildFeatureRow(Icons.phone, 'Phone OTP'),
                            _buildFeatureRow(Icons.refresh, 'Auto Token Refresh'),
                            _buildFeatureRow(Icons.storage, 'Session Persistence'),
                            _buildFeatureRow(Icons.sync, 'Offline Sync'),
                            _buildFeatureRow(Icons.person, 'User Profiles'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          unauthenticated: (reason) => const LoginScreen(),
          authenticating: () => const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Authenticating...'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  
  Widget _buildFeatureRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 16),
          Text(text),
        ],
      ),
    );
  }
}