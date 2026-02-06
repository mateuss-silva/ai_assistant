import 'package:ai_assistant/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Full app flow with mocked native channel', (tester) async {
    // 1. Setup Mock Channel
    const channel = MethodChannel('com.ai_assistant/ml_analyzer');

    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, (
      MethodCall methodCall,
    ) async {
      if (methodCall.method == 'isAvailable') {
        return true;
      }
      if (methodCall.method == 'analyzeMessage') {
        return {
          'sentiment': 'positive',
          'intent': 'info',
          'riskLevel': 'low', // Will map to RiskLevel.low
          'confidence': 'high',
          'detectedKeywords': ['seguro'],
          'isLocal': true,
        };
      }
      return null;
    });

    // 2. Launch App
    // We wrap AiAssistantApp in ProviderScope as main() does.
    // Ensure we import main.dart where AiAssistantApp is defined.
    await tester.pumpWidget(const ProviderScope(child: AiAssistantApp()));
    await tester.pumpAndSettle();

    // 3. Verify Initial State
    expect(
      find.text('Cole uma mensagem acima para verificar se é segura'),
      findsOneWidget,
    );

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

    // 7. Verify Success
    // 'Risco' + ' ' + 'Baixo'
    expect(find.text('Risco Baixo'), findsOneWidget);
    expect(find.text('Pode ignorar'), findsOneWidget);

    // Clean up
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      null,
    );
  });
}
