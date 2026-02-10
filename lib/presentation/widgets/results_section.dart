import 'package:flutter/material.dart';
import 'package:ai_assistant/l10n/app_localizations.dart';

import 'package:ai_assistant/core/design_system/design_system.dart';
import 'package:ai_assistant/core/error/error.dart';
import 'package:ai_assistant/presentation/providers/analysis_notifier.dart';
import 'package:ai_assistant/presentation/widgets/analysis_result_card.dart';
import 'package:ai_assistant/presentation/widgets/glass_card.dart';

/// Displays analysis results based on current state
class ResultsSection extends StatelessWidget {
  final AnalysisState state;

  const ResultsSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.screenPadding),
      child: _buildContent(l10n),
    );
  }

  Widget _buildContent(AppLocalizations l10n) {
    return switch (state) {
      AnalysisLoading() => _buildLoading(l10n),
      AnalysisError(:final failure) => _buildError(failure, l10n),
      AnalysisSuccess(:final analysis) => AnalysisResultCard(
        analysis: analysis,
      ),
      AnalysisInitial() => _buildInitialHint(l10n),
    };
  }

  Widget _buildLoading(AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const CircularProgressIndicator(color: AppColors.primary),
            const SizedBox(height: AppSpacing.lg),
            Text(l10n.loadingMessage, style: AppTypography.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildError(Failure failure, AppLocalizations l10n) {
    return GlassCard(
      child: Column(
        children: [
          const Icon(Icons.error_outline, color: AppColors.error, size: 48),
          const SizedBox(height: AppSpacing.md),
          Text(
            _getFailureMessage(failure, l10n),
            textAlign: TextAlign.center,
            style: AppTypography.bodySmall,
          ),
        ],
      ),
    );
  }

  String _getFailureMessage(Failure failure, AppLocalizations l10n) {
    return failure.when(
      localAnalysisFailed: (msg) =>
          '${l10n.sourceLocal} ${l10n.errorTitle}: $msg',
      cloudAnalysisFailed: (msg) =>
          '${l10n.sourceCloud} ${l10n.errorTitle}: $msg',
      noConnection: () => l10n.errorConnection,
      userDeniedConsent: () => l10n.errorConsent,
      invalidMessage: (reason) => '${l10n.errorInvalid}: $reason',
      unknown: (msg) => msg ?? l10n.errorTitle,
    );
  }

  Widget _buildInitialHint(AppLocalizations l10n) {
    return GlassCard(
      child: Column(
        children: [
          Icon(
            Icons.tips_and_updates_outlined,
            color: AppColors.withAlpha(AppColors.white, 0.5),
            size: 48,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            l10n.initialHint,
            textAlign: TextAlign.center,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.withAlpha(AppColors.white, 0.5),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.withAlpha(AppColors.white, 0.05),
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            ),
            child: Text(
              l10n.initialExample,
              style: AppTypography.captionItalic,
            ),
          ),
        ],
      ),
    );
  }
}
