import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/datasources.dart';
import '../../data/repositories/repositories.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

/// Connectivity provider
final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});

/// Local ML DataSource provider
final localMLDataSourceProvider = Provider<LocalMLDataSource>((ref) {
  return LocalMLDataSource();
});

/// Cloud ML DataSource provider
final cloudMLDataSourceProvider = Provider<CloudMLDataSource>((ref) {
  return CloudMLDataSource();
});

/// Message Analyzer Repository provider
final messageAnalyzerRepositoryProvider = Provider<MessageAnalyzerRepository>((
  ref,
) {
  return MessageAnalyzerRepositoryImpl(
    localDataSource: ref.watch(localMLDataSourceProvider),
    cloudDataSource: ref.watch(cloudMLDataSourceProvider),
    connectivity: ref.watch(connectivityProvider),
  );
});

/// Analyze Message UseCase provider
final analyzeMessageUseCaseProvider = Provider<AnalyzeMessageUseCase>((ref) {
  return AnalyzeMessageUseCase(ref.watch(messageAnalyzerRepositoryProvider));
});
