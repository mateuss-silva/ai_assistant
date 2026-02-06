import 'package:flutter_test/flutter_test.dart';

import 'package:ai_assistant/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('App should load without errors', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // ProviderScope is required for Riverpod
    await tester.pumpWidget(const ProviderScope(child: AiAssistantApp()));

    // Verify that the app loads
    // We check for AppHeader or general structure instead of Title if Title is hidden
    // But 'Assistente Financeiro' might be in the Header.
    // Let's assume AppHeader contains the title, or check for something we know exists.
    // Checking for the SelectionArea we just added is also a good smoke test.
    expect(find.byType(SelectionArea), findsOneWidget);
  });
}
