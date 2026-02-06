import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Base failure class for error handling across the app
@freezed
sealed class Failure with _$Failure {
  /// Analysis failed on local ML engine
  const factory Failure.localAnalysisFailed({required String message}) =
      LocalAnalysisFailed;

  /// Analysis failed on cloud service
  const factory Failure.cloudAnalysisFailed({required String message}) =
      CloudAnalysisFailed;

  /// No internet connection available
  const factory Failure.noConnection() = NoConnection;

  /// User denied cloud consent
  const factory Failure.userDeniedConsent() = UserDeniedConsent;

  /// Invalid or empty message
  const factory Failure.invalidMessage({required String reason}) =
      InvalidMessage;

  /// Unknown error
  const factory Failure.unknown({String? message}) = UnknownFailure;
}

/// Extension methods for Failure
extension FailureX on Failure {
  /// Returns a user-friendly error message
  String get userMessage {
    return when(
      localAnalysisFailed: (msg) => 'Erro na análise local: $msg',
      cloudAnalysisFailed: (msg) => 'Erro na análise em nuvem: $msg',
      noConnection: () => 'Sem conexão com a internet',
      userDeniedConsent: () => 'Análise em nuvem não autorizada',
      invalidMessage: (reason) => 'Mensagem inválida: $reason',
      unknown: (msg) => msg ?? 'Erro desconhecido',
    );
  }
}
