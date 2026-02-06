import 'package:ai_assistant/core/error/error.dart';
import 'package:ai_assistant/domain/entities/entities.dart' as domain;
import 'package:ai_assistant/presentation/providers/analysis_notifier.dart';
import 'package:ai_assistant/presentation/screens/analysis_screen.dart';
import 'package:ai_assistant/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeAnalysisNotifier extends StateNotifier<AnalysisState>
    implements AnalysisNotifier {
  FakeAnalysisNotifier() : super(const AnalysisInitial());

  void emit(AnalysisState newState) {
    state = newState;
  }

  @override
  Future<void> analyze(String message) async {}

  @override
  void reset() {
    state = const AnalysisInitial();
  }
}

void main() {
  late FakeAnalysisNotifier fakeNotifier;

  setUp(() {
    fakeNotifier = FakeAnalysisNotifier();
  });

  Future<void> pumpAnalysisScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          analysisNotifierProvider.overrideWith((ref) => fakeNotifier),
          isOfflineAvailableProvider.overrideWith((ref) => Future.value(true)),
          isOnlineProvider.overrideWith((ref) => Future.value(true)),
        ],
        child: const MaterialApp(home: AnalysisScreen()),
      ),
    );
  }

  group('AnalysisScreen Widget Tests', () {
    testWidgets('should display initial state correctly', (tester) async {
      // Act
      await pumpAnalysisScreen(tester);
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(AppHeader), findsOneWidget);
      expect(
        find.byType(SelectionArea),
        findsOneWidget,
      ); // Verify text selection enabled
      expect(find.byType(MessageInputCard), findsOneWidget);
      // Correct text for initial state
      expect(
        find.text('Cole uma mensagem acima para verificar se é segura'),
        findsOneWidget,
      );
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('should display loading state', (tester) async {
      // Act
      await pumpAnalysisScreen(tester);
      fakeNotifier.emit(const AnalysisLoading());
      await tester.pump();

      // Assert
      // Look for the specific loader in the results section content
      expect(find.text('Analisando mensagem...'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsAtLeastNWidgets(1));
    });

    testWidgets('should display analysis result on success', (tester) async {
      // Act
      await pumpAnalysisScreen(tester);

      final tAnalysis = domain.MessageAnalysis(
        originalMessage: 'Test message',
        sentiment: domain.Sentiment.positive,
        intent: domain.Intent.info,
        riskLevel: domain.RiskLevel.low,
        confidence: domain.Confidence.high,
        isLocalAnalysis: true,
        detectedKeywords: ['test'],
        analyzedAt: DateTime.now(),
        suggestedAction: const domain.SuggestedAction(
          title: 'Segura',
          description: 'Go ahead',
          isUrgent: false,
        ),
      );

      fakeNotifier.emit(AnalysisSuccess(tAnalysis));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(ResultsSection), findsOneWidget);
      // 'Risco' + ' ' + 'Baixo'
      expect(find.text('Risco Baixo'), findsOneWidget);
      // Action title
      expect(find.text('Segura'), findsOneWidget);
    });

    testWidgets('should display error message on failure', (tester) async {
      // Act
      await pumpAnalysisScreen(tester);

      const tFailure = Failure.cloudAnalysisFailed(message: 'Server failed');
      fakeNotifier.emit(const AnalysisError(tFailure));
      await tester.pumpAndSettle();

      // Assert
      expect(
        find.text('Erro na análise em nuvem: Server failed'),
        findsOneWidget,
      );
    });
  });
}
