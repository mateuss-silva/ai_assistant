import 'package:flutter/material.dart';

import '../../core/design_system/design_system.dart';

/// Glass morphism card - Design System Component
class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const GlassCard({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.glassBackground,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: child,
    );
  }
}
