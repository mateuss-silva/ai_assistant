import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/design_system/design_system.dart';
import '../providers/analysis_notifier.dart';

/// App header with logo and connectivity status
class AppHeader extends ConsumerWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOffline = ref.watch(isOfflineAvailableProvider);

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.screenPadding),
      child: Row(
        children: [
          _buildLogo(),
          const SizedBox(width: AppSpacing.lg),
          Expanded(child: _buildTitle(isOffline)),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.glassBackground,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: const Icon(
        Icons.shield_outlined,
        color: AppColors.primary,
        size: AppSpacing.iconSize,
      ),
    );
  }

  Widget _buildTitle(AsyncValue<bool> isOffline) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Assistente Financeiro', style: AppTypography.h2),
        const SizedBox(height: AppSpacing.xs),
        _buildConnectivityStatus(isOffline),
      ],
    );
  }

  Widget _buildConnectivityStatus(AsyncValue<bool> isOffline) {
    return isOffline.when(
      data: (available) => Row(
        children: [
          Icon(
            available ? Icons.offline_bolt : Icons.cloud,
            size: AppSpacing.iconSizeTiny,
            color: available ? AppColors.success : AppColors.textMuted,
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            available ? 'Análise offline disponível' : 'Modo online',
            style: AppTypography.bodySmall,
          ),
        ],
      ),
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}
