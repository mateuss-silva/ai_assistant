import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/entities.dart';
import '../../core/error/error.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

/// Implementation of MessageAnalyzerRepository with offline-first strategy
class MessageAnalyzerRepositoryImpl implements MessageAnalyzerRepository {
  final LocalMLDataSource _localDataSource;
  final CloudMLDataSource _cloudDataSource;
  final Connectivity _connectivity;

  MessageAnalyzerRepositoryImpl({
    required LocalMLDataSource localDataSource,
    required CloudMLDataSource cloudDataSource,
    required Connectivity connectivity,
  }) : _localDataSource = localDataSource,
       _cloudDataSource = cloudDataSource,
       _connectivity = connectivity;

  @override
  Future<Either<Failure, MessageAnalysis>> analyzeMessage(
    String message,
  ) async {
    // Step 1: Try local analysis first
    try {
      final localResult = await _localDataSource.analyzeMessage(message);
      return Right(_mapToMessageAnalysis(message, localResult, isLocal: true));
    } catch (localError) {
      // Local analysis failed, try cloud if online
      final isConnected = await isOnline();

      if (!isConnected) {
        return Left(
          Failure.localAnalysisFailed(
            message: 'Análise local falhou e não há conexão: $localError',
          ),
        );
      }

      // Step 2: Fall back to cloud analysis
      try {
        final cloudResult = await _cloudDataSource.analyzeMessage(message);
        return Right(
          _mapToMessageAnalysis(message, cloudResult, isLocal: false),
        );
      } catch (cloudError) {
        return Left(
          Failure.cloudAnalysisFailed(
            message: 'Falha na análise em nuvem: $cloudError',
          ),
        );
      }
    }
  }

  @override
  Future<bool> isLocalAnalysisAvailable() async {
    return await _localDataSource.isAvailable();
  }

  @override
  Future<bool> isOnline() async {
    final result = await _connectivity.checkConnectivity();
    // Handle both List and single result for compatibility
    if (result is List) {
      final results = result as List<ConnectivityResult>;
      return results.isNotEmpty &&
          !results.every((r) => r == ConnectivityResult.none);
    }
    return result != ConnectivityResult.none;
  }

  /// Maps raw analysis data to MessageAnalysis entity
  MessageAnalysis _mapToMessageAnalysis(
    String originalMessage,
    Map<String, dynamic> data, {
    required bool isLocal,
  }) {
    return MessageAnalysis(
      originalMessage: originalMessage,
      sentiment: _parseSentiment(data['sentiment'] as String?),
      intent: _parseIntent(data['intent'] as String?),
      confidence: _parseConfidence(data['confidence'] as String?),
      riskLevel: _parseRiskLevel(data['riskLevel'] as String?),
      suggestedAction: _getSuggestedAction(
        _parseRiskLevel(data['riskLevel'] as String?),
        _parseIntent(data['intent'] as String?),
      ),
      isLocalAnalysis: isLocal,
      analyzedAt: DateTime.now(),
      detectedKeywords: List<String>.from(data['detectedKeywords'] ?? []),
      modelName: data['model'] as String?,
    );
  }

  Sentiment _parseSentiment(String? value) {
    switch (value) {
      case 'positive':
        return Sentiment.positive;
      case 'negative':
        return Sentiment.negative;
      default:
        return Sentiment.neutral;
    }
  }

  Intent _parseIntent(String? value) {
    switch (value) {
      case 'fraud':
        return Intent.fraud;
      case 'payment':
        return Intent.payment;
      case 'alert':
        return Intent.alert;
      case 'complaint':
        return Intent.complaint;
      case 'promotional':
        return Intent.promotional;
      case 'info':
        return Intent.info;
      default:
        return Intent.unknown;
    }
  }

  Confidence _parseConfidence(String? value) {
    switch (value) {
      case 'high':
        return Confidence.high;
      case 'medium':
        return Confidence.medium;
      default:
        return Confidence.low;
    }
  }

  RiskLevel _parseRiskLevel(String? value) {
    switch (value) {
      case 'critical':
        return RiskLevel.critical;
      case 'high':
        return RiskLevel.high;
      case 'medium':
        return RiskLevel.medium;
      default:
        return RiskLevel.low;
    }
  }

  SuggestedAction _getSuggestedAction(RiskLevel risk, Intent intent) {
    if (intent == Intent.fraud || risk == RiskLevel.critical) {
      return SafeActions.reportFraud;
    }

    if (risk == RiskLevel.high) {
      return SafeActions.doNotClickLinks;
    }

    if (risk == RiskLevel.medium) {
      return SafeActions.verifySource;
    }

    return SafeActions.ignoreMessage;
  }
}
