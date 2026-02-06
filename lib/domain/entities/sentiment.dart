/// Sentiment types for message analysis
enum Sentiment { positive, negative, neutral }

extension SentimentExtension on Sentiment {
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
