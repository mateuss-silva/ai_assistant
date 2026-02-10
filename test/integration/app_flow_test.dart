import 'package:ai_assistant/data/datasources/datasources.dart';
import 'package:ai_assistant/l10n/app_localizations.dart';
import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCloudDataSource implements CloudMLDataSource {
  @override
  Future<Map<String, dynamic>> analyzeMessage(String message) async {
    return {};
  }
}

void main() {
  testWidgets('Full app flow with mocked native channel', (tester) async {
    // 1. Setup Mock Channels
    const mlChannel = MethodChannel('com.ai_assistant/ml_analyzer');
    // Connectivity usually uses 'dev.fluttercommunity.plus/connectivity/status'
    const connectivityChannel = MethodChannel(
      'dev.fluttercommunity.plus/connectivity/status',
    );

    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(mlChannel, (
      MethodCall methodCall,
    ) async {
      if (methodCall.method == 'isAvailable') {
        return true;
      }
      if (methodCall.method == 'analyzeMessage') {
        return {
          'sentiment': 'positive',
          'intent': 'info',
          'riskLevel': 'low',
          'confidence': 'high',
          'detectedKeywords': ['seguro'],
          'isLocal': true,
        };
      }
      return null;
    });

    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      connectivityChannel,
      (MethodCall methodCall) async {
        // Return 'wifi' or 'mobile' or 'none'
        return 'wifi';
      },
    );

    // 2. Launch App (AiAssistantApp includes localization delegates)
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          cloudMLDataSourceProvider.overrideWithValue(MockCloudDataSource()),
        ],
        child: const AiAssistantApp(),
      ),
    );
    await tester.pumpAndSettle();

    // 3. Verify Initial State — use l10n from the widget tree
    final context = tester.element(find.byType(Scaffold));
    final l10n = AppLocalizations.of(context)!;

    expect(find.text(l10n.initialHint), findsOneWidget);

    // 4. Enter Text
    await tester.enterText(
      find.byType(TextFormField),
      'Esta é uma mensagem segura de teste',
    );
    await tester.pump();

    // 5. Tap Analyze
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // Start loading

    // 6. Wait for result
    await tester.pumpAndSettle();

    // 7. Verify Success — use localized strings
    final riskText = l10n.riskLevel(l10n.riskLow);
    final actionText = l10n.actionIgnoreMessageTitle;

    // Debug output if fails
    final textFinder = find.byType(Text);
    if (find.text(riskText).evaluate().isEmpty) {
      print('Debug: Count of Text widgets: ${textFinder.evaluate().length}');
      for (final widget in textFinder.evaluate()) {
        final data = (widget.widget as Text).data;
        print('Debug: Text found: $data');
      }
    }

    expect(find.text(riskText), findsOneWidget);
    expect(find.text(actionText), findsOneWidget);

    // Clean up
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      mlChannel,
      null,
    );
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      connectivityChannel,
      null,
    );
  });
}
