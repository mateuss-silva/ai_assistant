import 'package:ai_assistant/domain/entities/entities.dart';
import 'package:ai_assistant/domain/repositories/message_analyzer_repository.dart';
import 'package:ai_assistant/domain/usecases/analyze_message_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMessageAnalyzerRepository extends Mock
    implements MessageAnalyzerRepository {}

void main() {
  late AnalyzeMessageUseCase useCase;
  late MockMessageAnalyzerRepository mockRepository;

  setUp(() {
    mockRepository = MockMessageAnalyzerRepository();
    useCase = AnalyzeMessageUseCase(mockRepository);
  });

  const tMessageContent = 'This is a test message';
  final tAnalysis = MessageAnalysis(
    originalMessage: tMessageContent,
    sentiment: Sentiment.neutral,
    intent: Intent.info,
    riskLevel: RiskLevel.low,
    confidence: Confidence.high,
    isLocalAnalysis: true,
    detectedKeywords: [],
    suggestedAction: const SuggestedAction(
      type: SuggestedActionType.ignoreMessage,
      title: 'Action',
      description: 'Desc',
      isUrgent: false,
    ),
    analyzedAt: DateTime(2023),
  );

  group('AnalyzeMessageUseCase', () {
    test('should delegate analysis to repository for valid message', () async {
      // Arrange
      when(
        () => mockRepository.analyzeMessage(any()),
      ).thenAnswer((_) async => Right(tAnalysis));

      // Act
      final result = await useCase.execute(tMessageContent);

      // Assert
      expect(result, Right(tAnalysis));
      verify(() => mockRepository.analyzeMessage(tMessageContent)).called(1);
    });

    test('should return Failure on empty message', () async {
      // Act
      final result = await useCase.execute('');

      // Assert
      expect(result.isLeft(), true);
      verifyNever(() => mockRepository.analyzeMessage(any()));
    });

    test('should return Failure on short message', () async {
      // Act
      final result = await useCase.execute('Hi');

      // Assert
      expect(result.isLeft(), true);
      verifyNever(() => mockRepository.analyzeMessage(any()));
    });

    test('should return offline status from repository', () async {
      // Arrange
      when(
        () => mockRepository.isLocalAnalysisAvailable(),
      ).thenAnswer((_) async => true);

      // Act
      final result = await useCase.canAnalyzeOffline();

      // Assert
      expect(result, true);
    });
  });
}
