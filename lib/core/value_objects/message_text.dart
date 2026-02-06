import 'package:dartz/dartz.dart';

import '../error/error.dart';

/// Value object representing validated message text
class MessageText {
  final String value;

  const MessageText._(this.value);

  /// Minimum message length for analysis
  static const int minLength = 5;

  /// Maximum message length allowed
  static const int maxLength = 5000;

  /// Creates a validated MessageText or returns a Failure
  static Either<Failure, MessageText> create(String input) {
    final trimmed = input.trim();

    if (trimmed.isEmpty) {
      return const Left(
        Failure.invalidMessage(reason: 'A mensagem não pode estar vazia'),
      );
    }

    if (trimmed.length < minLength) {
      return const Left(
        Failure.invalidMessage(reason: 'Mensagem muito curta para análise'),
      );
    }

    if (trimmed.length > maxLength) {
      return const Left(
        Failure.invalidMessage(
          reason: 'Mensagem muito longa (máximo $maxLength caracteres)',
        ),
      );
    }

    return Right(MessageText._(trimmed));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageText &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
