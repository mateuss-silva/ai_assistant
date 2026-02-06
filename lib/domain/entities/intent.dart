/// Intent types for financial message classification
enum Intent {
  /// Bank alerts about account activity
  alert,

  /// Potential fraud or scam attempts
  fraud,

  /// Payment requests or confirmations
  payment,

  /// General informational messages
  info,

  /// Complaints or negative feedback
  complaint,

  /// Promotional messages
  promotional,

  /// Unknown intent
  unknown,
}

extension IntentExtension on Intent {
  String get displayName {
    switch (this) {
      case Intent.alert:
        return 'Alerta';
      case Intent.fraud:
        return 'Possível Fraude';
      case Intent.payment:
        return 'Pagamento';
      case Intent.info:
        return 'Informativo';
      case Intent.complaint:
        return 'Reclamação';
      case Intent.promotional:
        return 'Promocional';
      case Intent.unknown:
        return 'Desconhecido';
    }
  }

  String get icon {
    switch (this) {
      case Intent.alert:
        return '⚠️';
      case Intent.fraud:
        return '🚨';
      case Intent.payment:
        return '💳';
      case Intent.info:
        return 'ℹ️';
      case Intent.complaint:
        return '📝';
      case Intent.promotional:
        return '📢';
      case Intent.unknown:
        return '❓';
    }
  }
}
