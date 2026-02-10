import 'package:ai_assistant/core/error/error.dart';
import 'package:ai_assistant/domain/entities/entities.dart' as domain;
import 'package:ai_assistant/l10n/app_localizations.dart';
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
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('pt'),
          home: const AnalysisScreen(),
        ),
      ),
    );
  }

  group('AnalysisScreen Widget Tests', () {
    testWidgets('should display initial state correctly', (tester) async {
      // Act
      await pumpAnalysisScreen(tester);
      await tester.pumpAndSettle();

      // Get l10n from the widget tree
      final context = tester.element(find.byType(AnalysisScreen));
      final l10n = AppLocalizations.of(context)!;

      // Assert
      expect(find.byType(AppHeader), findsOneWidget);
      expect(
        find.byType(SelectionArea),
        findsOneWidget,
      ); // Verify text selection enabled
      expect(find.byType(MessageInputCard), findsOneWidget);
      expect(find.text(l10n.initialHint), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('should display loading state', (tester) async {
      // Act
      await pumpAnalysisScreen(tester);
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(AnalysisScreen));
      final l10n = AppLocalizations.of(context)!;

      fakeNotifier.emit(const AnalysisLoading());
      await tester.pump();

      // Assert
      expect(find.text(l10n.loadingMessage), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsAtLeastNWidgets(1));
    });

    testWidgets('should display analysis result on success', (tester) async {
      // Act
      await pumpAnalysisScreen(tester);
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(AnalysisScreen));
      final l10n = AppLocalizations.of(context)!;

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
          type: domain.SuggestedActionType.ignoreMessage,
          title: 'Segura',
          description: 'Go ahead',
          isUrgent: false,
        ),
      );

      fakeNotifier.emit(AnalysisSuccess(tAnalysis));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(ResultsSection), findsOneWidget);
      // Localized risk level
      expect(find.text(l10n.riskLevel(l10n.riskLow)), findsOneWidget);
      // Localized action title (from type, not from the entity's title field)
      expect(find.text(l10n.actionIgnoreMessageTitle), findsOneWidget);
    });

    testWidgets('should display error message on failure', (tester) async {
      // Act
      await pumpAnalysisScreen(tester);
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(AnalysisScreen));
      final l10n = AppLocalizations.of(context)!;

      const tFailure = Failure.cloudAnalysisFailed(message: 'Server failed');
      fakeNotifier.emit(const AnalysisError(tFailure));
      await tester.pumpAndSettle();

      // Assert
      expect(
        find.text('${l10n.sourceCloud} ${l10n.errorTitle}: Server failed'),
        findsOneWidget,
      );
    });
  });
}
