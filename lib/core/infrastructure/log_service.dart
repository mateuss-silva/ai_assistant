import 'package:flutter/foundation.dart';

/// Service for secure logging
///
/// Ensures logs are only printed in debug mode and sensitive data
/// is sanitized before printing.
class LogService {
  static const String _tag = '[AI_Assistant]';

  /// Log info message (debug only)
  static void i(String message) {
    if (kDebugMode) {
      debugPrint('$_tag ℹ️ $message');
    }
  }

  /// Log warning message (debug only)
  static void w(String message) {
    if (kDebugMode) {
      debugPrint('$_tag ⚠️ $message');
    }
  }

  /// Log error message (debug only)
  static void e(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      debugPrint('$_tag ❌ $message');
      if (error != null) debugPrint('Error: $error');
      if (stackTrace != null) debugPrint('Stack: $stackTrace');
    }
  }

  /// Log secure data (sanitized)
  ///
  /// Use this for logging data that might contain PII or sensitive info.
  /// It will mask the content.
  static void secure(String label, String content) {
    if (kDebugMode) {
      final masked = content.length > 4
          ? '${content.substring(0, 2)}***${content.substring(content.length - 2)}'
          : '***';
      debugPrint('$_tag 🔒 $label: $masked');
    }
  }
}
