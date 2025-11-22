import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/providers/auth_providers.dart';
import '../../features/social/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/events/presentation/pages/calendar_page.dart';
import '../../features/events/presentation/pages/create_event_page.dart';
import '../../features/events/presentation/pages/event_detail_page.dart';
import '../../features/social/presentation/pages/discover_page.dart';
import '../../features/social/presentation/pages/post_detail_page.dart';
import '../../features/chat/presentation/pages/chat_list_page.dart';
import '../../features/chat/presentation/pages/chat_page.dart';
import '../../shared/widgets/splash_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      // Splash Screen
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      
      // Authentication Routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
      
      // Main App Shell with Bottom Navigation
      ShellRoute(
        builder: (context, state, child) {
          return MainAppShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
          ),
          GoRoute(
            path: '/calendar',
            name: 'calendar',
            builder: (context, state) => const CalendarPage(),
          ),
          GoRoute(
            path: '/events/create',
            name: 'create-event',
            builder: (context, state) => CreateEventPage(
              eventId: state.extra as String?,
            ),
          ),
          GoRoute(
            path: '/events/:id',
            name: 'event-detail',
            builder: (context, state) => EventDetailPage(
              eventId: state.pathParameters['id']!,
            ),
          ),
          GoRoute(
            path: '/discover',
            name: 'discover',
            builder: (context, state) => const DiscoverPage(),
          ),
          GoRoute(
            path: '/posts/:id',
            name: 'post-detail',
            builder: (context, state) => PostDetailPage(
              postId: state.pathParameters['id']!,
            ),
          ),
          GoRoute(
            path: '/chat',
            name: 'chat-list',
            builder: (context, state) => const ChatListPage(),
          ),
          GoRoute(
            path: '/chat/:id',
            name: 'chat',
            builder: (context, state) => ChatPage(
              chatId: state.pathParameters['id']!,
            ),
          ),
        ],
      ),
    ],
    
    // Redirect logic for authentication
    redirect: (context, state) {
      final isAuthenticated = ref.read(isAuthenticatedProvider);
      final location = state.fullPath ?? '/';
      
      // Allow splash screen without authentication check
      if (location == '/splash') {
        return null;
      }
      
      // If not authenticated and trying to access protected routes, redirect to login
      if (!isAuthenticated && !_isAuthRoute(location)) {
        return '/login';
      }
      
      // If authenticated and trying to access auth routes, redirect to home
      if (isAuthenticated && _isAuthRoute(location)) {
        return '/';
      }
      
      return null;
    },
    
    // Error handling
    errorBuilder: (context, state) => Scaffold(
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
              'Page not found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              state.error?.toString() ?? 'Unknown error',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}

bool _isAuthRoute(String location) {
  return location == '/login' || 
         location == '/register' || 
         location == '/splash';
}

class MainAppShell extends StatefulWidget {
  final Widget child;
  
  const MainAppShell({super.key, required this.child});

  @override
  State<MainAppShell> createState() => _MainAppShellState();
}

class _MainAppShellState extends State<MainAppShell> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
          
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/discover');
              break;
            case 2:
              context.go('/chat');
              break;
            case 3:
              context.go('/calendar');
              break;
            case 4:
              context.go('/profile');
              break;
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Discover',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat_bubble),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}