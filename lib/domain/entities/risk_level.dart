/// Risk level classification for financial messages
enum RiskLevel { low, medium, high, critical }

extension RiskLevelExtension on RiskLevel {
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
