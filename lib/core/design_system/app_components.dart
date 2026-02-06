import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';

/// Reusable button styles - Design System
abstract final class AppButtons {
  /// Primary action button style
  static ButtonStyle primary = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.bgDark1,
    padding: const EdgeInsets.symmetric(vertical: AppSpacing.buttonPadding),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
    ),
  );

  /// Secondary/outline button style
  static ButtonStyle secondary = OutlinedButton.styleFrom(
    foregroundColor: AppColors.textSecondary,
    side: BorderSide(color: AppColors.withAlpha(AppColors.white, 0.2)),
    padding: const EdgeInsets.symmetric(vertical: AppSpacing.buttonPadding),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
    ),
  );
}

/// Reusable input decoration - Design System
abstract final class AppInputs {
  /// Standard text field decoration
  static InputDecoration textField({required String hint}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: AppColors.withAlpha(AppColors.white, 0.3)),
      filled: true,
      fillColor: AppColors.withAlpha(AppColors.white, 0.05),
      border: _border(0.1),
      enabledBorder: _border(0.1),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
    );
  }

  static OutlineInputBorder _border(double opacity) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      borderSide: BorderSide(
        color: AppColors.withAlpha(AppColors.white, opacity),
      ),
    );
  }
}
