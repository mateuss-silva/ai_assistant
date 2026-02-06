import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../infrastructure/log_service.dart';

/// Environment configuration management
///
/// Loads environment variables from .env file securely.
class EnvConfig {
  static Future<void> init() async {
    try {
      await dotenv.load(fileName: ".env");
      LogService.i('Environment loaded');
    } catch (e) {
      LogService.w('File .env not found. Using default values.');
    }
  }

  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static String get apiUrl =>
      dotenv.env['API_URL'] ?? 'https://api.example.com';

  static bool get isProduction => dotenv.env['ENVIRONMENT'] == 'production';
}
