import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

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
/// Uses Google Gemini Pro to provide deep analysis when local engine is insufficient
class CloudMLDataSource {
  final String _apiKey = dotenv.get('GEMINI_API_KEY', fallback: '');

  Future<Map<String, dynamic>> analyzeMessage(String message) async {
    if (_apiKey.isEmpty || _apiKey == 'your_api_key_here') {
      throw Exception('Gemini API Key não configurada no .env');
    }

    try {
      final model = GenerativeModel(
        model: 'gemini-2.5-flash',
        apiKey: _apiKey,
        generationConfig: GenerationConfig(
          responseMimeType: 'application/json',
        ),
      );

      final prompt =
          '''
      Analise esta mensagem financeira e retorne um JSON com os campos:
      - sentiment: "positive", "negative" ou "neutral"
      - intent: "fraud", "payment", "alert" ou "info"
      - riskLevel: "low", "medium", "high" ou "critical"
      - confidence: "low", "medium" ou "high"
      - detectedKeywords: lista de palavras suspeitas ou importantes
      
      Mensagem: "$message"
      ''';

      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      final jsonResponse = jsonDecode(response.text ?? '{}');

      return {
        'sentiment': jsonResponse['sentiment'] ?? 'neutral',
        'intent': jsonResponse['intent'] ?? 'info',
        'riskLevel': jsonResponse['riskLevel'] ?? 'low',
        'confidence': jsonResponse['confidence'] ?? 'medium',
        'detectedKeywords': jsonResponse['detectedKeywords'] ?? [],
        'isLocal': false,
        'model': 'Gemini 2.5 Flash',
      };
    } catch (e) {
      throw Exception('Erro na análise Cloud: $e');
    }
  }
}
