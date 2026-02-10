import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/entities.dart';
import '../../core/error/error.dart';
import 'providers.dart';

/// State for message analysis
sealed class AnalysisState {
  const AnalysisState();
}

class AnalysisInitial extends AnalysisState {
  const AnalysisInitial();
}

class AnalysisLoading extends AnalysisState {
  const AnalysisLoading();
}

class AnalysisSuccess extends AnalysisState {
  final MessageAnalysis analysis;
  const AnalysisSuccess(this.analysis);
}

class AnalysisError extends AnalysisState {
  final Failure failure;
  const AnalysisError(this.failure);
}

/// Notifier for managing analysis state
class AnalysisNotifier extends StateNotifier<AnalysisState> {
  final Ref _ref;

  AnalysisNotifier(this._ref) : super(const AnalysisInitial());

  /// Analyzes a message
  Future<void> analyze(String message) async {
    state = const AnalysisLoading();

    try {
      final useCase = _ref.read(analyzeMessageUseCaseProvider);
      final result = await useCase.execute(message);

      state = result.fold(
        (failure) => AnalysisError(failure),
        (analysis) => AnalysisSuccess(analysis),
      );
    } catch (e) {
      state = AnalysisError(Failure.unknown(message: e.toString()));
    }
  }

  /// Resets to initial state
  void reset() {
    state = const AnalysisInitial();
  }
}

/// Provider for analysis state
final analysisNotifierProvider =
    StateNotifierProvider<AnalysisNotifier, AnalysisState>((ref) {
      return AnalysisNotifier(ref);
    });

/// Provider to check if offline analysis is available
final isOfflineAvailableProvider = FutureProvider<bool>((ref) async {
  final repository = ref.watch(messageAnalyzerRepositoryProvider);
  return repository.isLocalAnalysisAvailable();
});

/// Provider to check connectivity status
final isOnlineProvider = FutureProvider<bool>((ref) async {
  final repository = ref.watch(messageAnalyzerRepositoryProvider);
  return repository.isOnline();
});
