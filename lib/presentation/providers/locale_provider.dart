import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider to manage the application locale
final localeProvider = StateProvider<Locale>((ref) {
  // Default to Portuguese (BR) as requested or seen in the project
  return const Locale('pt');
});

/// Extension to easily switch between supported locales
extension LocaleSwitcher on Locale {
  Locale toggle() {
    return languageCode == 'pt' ? const Locale('en') : const Locale('pt');
  }

  String get languageName {
    return languageCode == 'pt' ? 'Português' : 'English';
  }

  String get flag {
    return languageCode == 'pt' ? '🇧🇷' : '🇺🇸';
  }
}
