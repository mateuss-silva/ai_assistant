import 'package:flutter/material.dart';

/// App color palette - Design System
abstract final class AppColors {
  // Primary
  static const Color primary = Color(0xFF00d9ff);
  static const Color primaryDark = Color(0xFF0f3460);

  // Background gradients
  static const Color bgDark1 = Color(0xFF1a1a2e);
  static const Color bgDark2 = Color(0xFF16213e);
  static const Color bgDark3 = Color(0xFF0f3460);

  // Semantic colors
  static const Color success = Color(0xFF00ff88);
  static const Color warning = Color(0xFFffb800);
  static const Color error = Color(0xFFff4757);
  static const Color critical = Color(0xFF9b59b6);

  // Neutral
  static const Color white = Colors.white;
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  static const Color textMuted = Colors.white54;

  // Risk level colors
  static const Color riskLow = Color(0xFF00ff88);
  static const Color riskMedium = Color(0xFFffb800);
  static const Color riskHigh = Color(0xFFff4757);
  static const Color riskCritical = Color(0xFF9b59b6);

  /// Glass effect colors
  static Color glassBackground = white.withValues(alpha: 0.1);
  static Color glassBorder = white.withValues(alpha: 0.2);

  /// Get color with opacity
  static Color withAlpha(Color color, double opacity) {
    return color.withValues(alpha: opacity);
  }
}

/// Background gradient for the app
class AppGradients {
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.bgDark1, AppColors.bgDark2, AppColors.bgDark3],
  );
}
