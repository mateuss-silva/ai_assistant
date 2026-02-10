import 'package:ai_assistant/l10n/app_localizations.dart';

/// Sentiment types for message analysis
enum Sentiment { positive, negative, neutral }

extension SentimentExtension on Sentiment {
  String getLocalizedName(AppLocalizations l10n) {
    switch (this) {
      case Sentiment.positive:
        return l10n.sentimentPositive;
      case Sentiment.negative:
        return l10n.sentimentNegative;
      case Sentiment.neutral:
        return l10n.sentimentNeutral;
    }
  }

  @Deprecated('Use getLocalizedName instead')
  String get displayName {
    switch (this) {
      case Sentiment.positive:
        return 'Positivo';
      case Sentiment.negative:
        return 'Negativo';
      case Sentiment.neutral:
        return 'Neutro';
    }
  }

  String get emoji {
    switch (this) {
      case Sentiment.positive:
        return '😊';
      case Sentiment.negative:
        return '😟';
      case Sentiment.neutral:
        return '😐';
    }
  }
}
