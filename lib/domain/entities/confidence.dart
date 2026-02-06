/// Confidence level for analysis results
enum Confidence { low, medium, high }

extension ConfidenceExtension on Confidence {
  String get displayName {
    switch (this) {
      case Confidence.low:
        return 'Baixa';
      case Confidence.medium:
        return 'Média';
      case Confidence.high:
        return 'Alta';
    }
  }

  double get percentage {
    switch (this) {
      case Confidence.low:
        return 0.33;
      case Confidence.medium:
        return 0.66;
      case Confidence.high:
        return 1.0;
    }
  }
}
