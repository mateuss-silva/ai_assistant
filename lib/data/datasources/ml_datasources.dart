import 'package:flutter/services.dart';

/// Data source for local ML analysis via platform channels
///
/// Communicates with native Android (TFLite) and iOS (CoreML) implementations
class LocalMLDataSource {
  static const _channel = MethodChannel('com.ai_assistant/ml_analyzer');

  /// Analyzes a message using the native ML engine
  ///
  /// Returns a map with analysis results or throws an exception
  Future<Map<String, dynamic>> analyzeMessage(String message) async {
    try {
      final result = await _channel.invokeMethod<Map<dynamic, dynamic>>(
        'analyzeMessage',
        {'message': message},
      );

      if (result == null) {
        throw Exception('Null response from native ML engine');
      }

      return Map<String, dynamic>.from(result);
    } on PlatformException catch (e) {
      throw Exception('Platform error: ${e.message}');
    } on MissingPluginException {
      throw Exception('ML plugin not available on this platform');
    }
  }

  /// Checks if the ML engine is ready
  Future<bool> isAvailable() async {
    try {
      final result = await _channel.invokeMethod<bool>('isAvailable');
      return result ?? false;
    } catch (_) {
      return false;
    }
  }
}

/// Data source for fallback cloud analysis
///
/// Only used when local analysis fails and user consents
class CloudMLDataSource {
  // In production, this would call an actual API
  // For now, it's a mock that simulates cloud analysis

  Future<Map<String, dynamic>> analyzeMessage(String message) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock cloud analysis - in production, call real API
    return _performMockAnalysis(message);
  }

  Map<String, dynamic> _performMockAnalysis(String message) {
    final lowerMessage = message.toLowerCase();

    // Simple keyword-based analysis (same as native, for consistency)
    final fraudKeywords = [
      'urgente',
      'imediato',
      'confirme',
      'clique',
      'link',
      'senha',
      'suspeita',
    ];
    final paymentKeywords = [
      'pagamento',
      'pix',
      'transferência',
      'boleto',
      'fatura',
    ];
    final alertKeywords = ['alerta', 'aviso', 'atenção', 'detectamos'];

    int fraudScore = 0;
    int paymentScore = 0;
    int alertScore = 0;
    List<String> detectedKeywords = [];

    for (final keyword in fraudKeywords) {
      if (lowerMessage.contains(keyword)) {
        fraudScore++;
        detectedKeywords.add(keyword);
      }
    }

    for (final keyword in paymentKeywords) {
      if (lowerMessage.contains(keyword)) {
        paymentScore++;
        detectedKeywords.add(keyword);
      }
    }

    for (final keyword in alertKeywords) {
      if (lowerMessage.contains(keyword)) {
        alertScore++;
        detectedKeywords.add(keyword);
      }
    }

    // Determine intent
    String intent;
    if (fraudScore >= 2) {
      intent = 'fraud';
    } else if (paymentScore > 0) {
      intent = 'payment';
    } else if (alertScore > 0) {
      intent = 'alert';
    } else {
      intent = 'info';
    }

    // Determine sentiment
    final negativeWords = [
      'suspeita',
      'urgente',
      'problema',
      'bloqueado',
      'negado',
    ];
    final positiveWords = ['aprovado', 'sucesso', 'confirmado', 'parabéns'];

    int negativeScore = negativeWords
        .where((w) => lowerMessage.contains(w))
        .length;
    int positiveScore = positiveWords
        .where((w) => lowerMessage.contains(w))
        .length;

    String sentiment;
    if (negativeScore > positiveScore) {
      sentiment = 'negative';
    } else if (positiveScore > negativeScore) {
      sentiment = 'positive';
    } else {
      sentiment = 'neutral';
    }

    // Determine risk level
    String riskLevel;
    if (fraudScore >= 3) {
      riskLevel = 'critical';
    } else if (fraudScore >= 2) {
      riskLevel = 'high';
    } else if (fraudScore >= 1 || alertScore >= 2) {
      riskLevel = 'medium';
    } else {
      riskLevel = 'low';
    }

    // Determine confidence
    String confidence;
    int totalKeywords = detectedKeywords.length;
    if (totalKeywords >= 4) {
      confidence = 'high';
    } else if (totalKeywords >= 2) {
      confidence = 'medium';
    } else {
      confidence = 'low';
    }

    return {
      'sentiment': sentiment,
      'intent': intent,
      'riskLevel': riskLevel,
      'confidence': confidence,
      'detectedKeywords': detectedKeywords,
      'isLocal': false,
    };
  }
}
