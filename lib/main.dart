import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/constants/app_constants.dart';
import 'core/services/firebase_service.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Initialize Firebase
  final firebaseService = FirebaseService();
  await firebaseService.initialize();
  
  // Initialize Sentry for error tracking
  await SentryFlutter.init(
    (options) {
      options.dsn = 'YOUR_SENTRY_DSN_HERE'; // TODO: Add your Sentry DSN
      options.environment = const String.fromEnvironment('ENVIRONMENT', defaultValue: 'development');
      options.enableAutoSessionTracking = true;
      options.attachScreenshot = true;
      options.attachViewHierarchy = true;
    },
    appRunner: () => runApp(
      ProviderScope(
        child: const Tryb3App(),
      ),
    ),
  );
}

class Tryb3App extends ConsumerWidget {
  const Tryb3App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
      builder: (context, child) {
        return MediaQuery(
          // Prevent text scaling beyond reasonable limits
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.3),
          ),
          child: child!,
        );
      },
    );
  }
}
