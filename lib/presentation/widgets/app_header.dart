import 'package:ai_assistant/presentation/providers/analysis_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_assistant/l10n/app_localizations.dart';

import 'package:ai_assistant/core/design_system/design_system.dart';
import 'package:ai_assistant/presentation/providers/locale_provider.dart';

/// App header with logo and connectivity status
class AppHeader extends ConsumerWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOffline = ref.watch(isOfflineAvailableProvider);
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = ref.watch(localeProvider);

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.screenPadding),
      child: Row(
        children: [
          _buildLogo(),
          const SizedBox(width: AppSpacing.lg),
          Expanded(child: _buildTitle(isOffline, l10n)),
          _buildLanguageToggle(ref, currentLocale),
        ],
      ),
    );
  }

  Widget _buildLanguageToggle(WidgetRef ref, Locale currentLocale) {
    return InkWell(
      onTap: () =>
          ref.read(localeProvider.notifier).state = currentLocale.toggle(),
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: AppColors.glassBackground,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(color: AppColors.glassBorder),
        ),
        child: Row(
          children: [
            Text(currentLocale.flag, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: AppSpacing.sm),
            Text(
              currentLocale.languageCode.toUpperCase(),
              style: AppTypography.button.copyWith(fontSize: 12),
            ),
          ],
        ),
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

  Widget _buildTitle(AsyncValue<bool> isOffline, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.appTitle, style: AppTypography.h2),
        const SizedBox(height: AppSpacing.xs),
        _buildConnectivityStatus(isOffline, l10n),
      ],
    );
  }

  Widget _buildConnectivityStatus(
    AsyncValue<bool> isOffline,
    AppLocalizations l10n,
  ) {
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
            available ? l10n.offlineAvailable : l10n.onlineMode,
            style: AppTypography.bodySmall,
          ),
        ],
      ),
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}
