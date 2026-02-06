import 'package:flutter/material.dart';

import 'app_colors.dart';

/// App typography - Design System
abstract final class AppTypography {
  // Headings
  static const TextStyle h1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Body
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 15,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
  );

  // Caption
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.textMuted,
  );

  static const TextStyle captionItalic = TextStyle(
    fontSize: 12,
    color: AppColors.textMuted,
    fontStyle: FontStyle.italic,
  );

  // Button
  static const TextStyle button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
}
