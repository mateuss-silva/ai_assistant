import 'package:ai_assistant/l10n/app_localizations.dart';

/// Risk level classification for financial messages
enum RiskLevel { low, medium, high, critical }

extension RiskLevelExtension on RiskLevel {
  String getLocalizedName(AppLocalizations l10n) {
    switch (this) {
      case RiskLevel.low:
        return l10n.riskLow;
      case RiskLevel.medium:
        return l10n.riskMedium;
      case RiskLevel.high:
        return l10n.riskHigh;
      case RiskLevel.critical:
        return l10n.riskCritical;
    }
  }

  String getLocalizedDescription(AppLocalizations l10n) {
    switch (this) {
      case RiskLevel.low:
        return l10n.riskLowDesc;
      case RiskLevel.medium:
        return l10n.riskMediumDesc;
      case RiskLevel.high:
        return l10n.riskHighDesc;
      case RiskLevel.critical:
        return l10n.riskCriticalDesc;
    }
  }

  @Deprecated('Use getLocalizedName instead')
  String get displayName {
    switch (this) {
      case RiskLevel.low:
        return 'Baixo';
      case RiskLevel.medium:
        return 'Médio';
      case RiskLevel.high:
        return 'Alto';
      case RiskLevel.critical:
        return 'Crítico';
    }
  }

  @Deprecated('Use getLocalizedDescription instead')
  String get description {
    switch (this) {
      case RiskLevel.low:
        return 'Mensagem parece segura.';
      case RiskLevel.medium:
        return 'Verifique a origem antes de agir.';
      case RiskLevel.high:
        return 'Não clique em links. Verifique no app oficial.';
      case RiskLevel.critical:
        return 'Possível golpe! Não forneça dados pessoais.';
    }
  }

  int get colorValue {
    switch (this) {
      case RiskLevel.low:
        return 0xFF4CAF50; // Green
      case RiskLevel.medium:
        return 0xFFFF9800; // Orange
      case RiskLevel.high:
        return 0xFFF44336; // Red
      case RiskLevel.critical:
        return 0xFF9C27B0; // Purple
    }
  }
}
