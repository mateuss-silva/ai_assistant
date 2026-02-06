import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../../core/error/error.dart';

/// Abstract repository interface for message analysis
///
/// Implementations should follow offline-first strategy:
/// 1. Try local ML analysis first
/// 2. Fall back to cloud only with user consent
abstract class MessageAnalyzerRepository {
  /// Analyzes a message using the offline-first strategy
  ///
  /// Returns [Right<MessageAnalysis>] on success
  /// Returns [Left<Failure>] on failure
  Future<Either<Failure, MessageAnalysis>> analyzeMessage(String message);

  /// Checks if local ML analysis is available
  Future<bool> isLocalAnalysisAvailable();

  /// Checks if device is currently online
  Future<bool> isOnline();
}
