import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../../core/error/error.dart';
import '../repositories/repositories.dart';

/// Use case for analyzing financial messages
///
/// This is the main entry point for the analysis feature.
/// It validates input and delegates to the repository.
class AnalyzeMessageUseCase {
  final MessageAnalyzerRepository _repository;

  AnalyzeMessageUseCase(this._repository);

  /// Executes the message analysis
  ///
  /// [message] - The financial message to analyze
  ///
  /// Returns [Right<MessageAnalysis>] with analysis results
  /// Returns [Left<Failure>] if validation or analysis fails
  Future<Either<Failure, MessageAnalysis>> execute(String message) async {
    // Validate input
    final trimmedMessage = message.trim();

    if (trimmedMessage.isEmpty) {
      return const Left(
        Failure.invalidMessage(reason: 'A mensagem não pode estar vazia'),
      );
    }

    if (trimmedMessage.length < 5) {
      return const Left(
        Failure.invalidMessage(reason: 'Mensagem muito curta para análise'),
      );
    }

    if (trimmedMessage.length > 500) {
      return const Left(
        Failure.invalidMessage(
          reason: 'Mensagem muito longa (máximo 500 caracteres)',
        ),
      );
    }

    // Delegate to repository
    return _repository.analyzeMessage(trimmedMessage);
  }

  /// Checks if local analysis is available
  Future<bool> canAnalyzeOffline() => _repository.isLocalAnalysisAvailable();

  /// Checks current connectivity
  Future<bool> isOnline() => _repository.isOnline();
}
