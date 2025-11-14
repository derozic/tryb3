import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tryb3/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: Tryb3App(),
      ),
    );

    // Verify that the app launches without errors
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // Verify splash screen is shown initially
    expect(find.text('Tryb3'), findsOneWidget);
    expect(find.text('Modern social networking reimagined'), findsOneWidget);
  });
}
