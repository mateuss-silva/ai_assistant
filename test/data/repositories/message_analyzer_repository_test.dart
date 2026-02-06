import 'package:ai_assistant/core/error/error.dart';
import 'package:ai_assistant/data/datasources/datasources.dart';
import 'package:ai_assistant/data/repositories/message_analyzer_repository_impl.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalDataSource extends Mock implements LocalMLDataSource {}

class MockCloudDataSource extends Mock implements CloudMLDataSource {}

class MockConnectivity extends Mock implements Connectivity {}

void main() {
  late MessageAnalyzerRepositoryImpl repository;
  late MockLocalDataSource mockLocalDataSource;
  late MockCloudDataSource mockCloudDataSource;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockCloudDataSource = MockCloudDataSource();
    mockConnectivity = MockConnectivity();

    repository = MessageAnalyzerRepositoryImpl(
      localDataSource: mockLocalDataSource,
      cloudDataSource: mockCloudDataSource,
      connectivity: mockConnectivity,
    );
  });

  const tMessage = 'Test message';
  final tResultMap = {
    'sentiment': 'positive',
    'intent': 'info',
    'riskLevel': 'low',
    'confidence': 'high',
    'detectedKeywords': ['test'],
    'isLocal': true,
  };

  group('analyzeMessage', () {
    test('should return local analysis when successful', () async {
      // Arrange
      when(
        () => mockLocalDataSource.analyzeMessage(any()),
      ).thenAnswer((_) async => tResultMap);

      // Act
      final result = await repository.analyzeMessage(tMessage);

      // Assert
      expect(result.isRight(), true);
      verify(() => mockLocalDataSource.analyzeMessage(tMessage)).called(1);
      verifyNever(() => mockCloudDataSource.analyzeMessage(any()));
    });

    test('should fall back to cloud when local fails and is online', () async {
      // Arrange
      when(
        () => mockLocalDataSource.analyzeMessage(any()),
      ).thenThrow(Exception('Local fail'));
      // Using single result to satisfy test compiler seeing old version
      when(() => mockConnectivity.checkConnectivity())
      // ignore: invalid_return_type_for_catch_error
      .thenAnswer((_) async => ConnectivityResult.wifi as dynamic);
      when(
        () => mockCloudDataSource.analyzeMessage(any()),
      ).thenAnswer((_) async => tResultMap);

      // Act
      final result = await repository.analyzeMessage(tMessage);

      // Assert
      expect(result.isRight(), true);
      verify(() => mockLocalDataSource.analyzeMessage(tMessage)).called(1);
      verify(() => mockCloudDataSource.analyzeMessage(tMessage)).called(1);
    });

    test('should return Failure when local fails and is offline', () async {
      // Arrange
      when(
        () => mockLocalDataSource.analyzeMessage(any()),
      ).thenThrow(Exception('Local fail'));
      when(
        () => mockConnectivity.checkConnectivity(),
      ).thenAnswer((_) async => ConnectivityResult.none as dynamic);

      // Act
      final result = await repository.analyzeMessage(tMessage);

      // Assert
      expect(result.isLeft(), true);
      result.fold((l) => expect(l, isA<Failure>()), (r) => fail('Should fail'));
      verifyNever(() => mockCloudDataSource.analyzeMessage(any()));
    });
  });
}
