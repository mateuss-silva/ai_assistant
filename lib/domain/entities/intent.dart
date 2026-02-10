import 'package:ai_assistant/l10n/app_localizations.dart';

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
  String getLocalizedName(AppLocalizations l10n) {
    switch (this) {
      case Intent.alert:
        return l10n.intentAlert;
      case Intent.fraud:
        return l10n.intentFraud;
      case Intent.payment:
        return l10n.intentPayment;
      case Intent.info:
        return l10n.intentInfo;
      case Intent.complaint:
        return l10n.intentComplaint;
      case Intent.promotional:
        return l10n.intentPromotional;
      case Intent.unknown:
        return l10n.intentUnknown;
    }
  }

  @Deprecated('Use getLocalizedName instead')
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
