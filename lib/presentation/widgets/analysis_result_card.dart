import 'package:flutter/material.dart';
import 'package:ai_assistant/l10n/app_localizations.dart';

import 'package:ai_assistant/core/design_system/design_system.dart';
import 'package:ai_assistant/domain/entities/entities.dart';
import 'package:ai_assistant/presentation/widgets/glass_card.dart';

/// Card displaying the analysis results with visual risk indicators
class AnalysisResultCard extends StatelessWidget {
  final MessageAnalysis analysis;

  const AnalysisResultCard({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final riskColor = Color(analysis.riskLevel.colorValue);

    return Column(
      children: [
        // Risk Level Banner
        GlassCard(
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.withAlpha(riskColor, 0.2),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                  border: Border.all(
                    color: AppColors.withAlpha(riskColor, 0.5),
                    width: 2,
                  ),
                ),
                child: Icon(
                  _getRiskIcon(),
                  color: riskColor,
                  size: AppSpacing.iconSize,
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.riskLevel(analysis.riskLevel.getLocalizedName(l10n)),
                      style: AppTypography.h3.copyWith(color: riskColor),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      analysis.riskLevel.getLocalizedDescription(l10n),
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.withAlpha(AppColors.white, 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        // Suggested Action
        GlassCard(
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    analysis.suggestedAction.isUrgent
                        ? Icons.priority_high
                        : Icons.lightbulb_outline,
                    color: analysis.suggestedAction.isUrgent
                        ? AppColors.warning
                        : AppColors.primary,
                    size: AppSpacing.iconSizeSmall,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    _getLocalizedActionTitle(analysis.suggestedAction, l10n),
                    style: AppTypography.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                _getLocalizedActionDescription(analysis.suggestedAction, l10n),
                style: AppTypography.bodySmall,
              ),
              if (analysis.suggestedAction.safeAlternative != null) ...[
                const SizedBox(height: AppSpacing.md),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.withAlpha(AppColors.success, 0.1),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    border: Border.all(
                      color: AppColors.withAlpha(AppColors.success, 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.verified_user,
                        color: AppColors.success,
                        size: AppSpacing.lg,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          _getLocalizedActionAlternative(
                            analysis.suggestedAction,
                            l10n,
                          )!,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.success,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        // Analysis Details
        GlassCard(
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.analysisDetails,
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              _buildDetailRow(
                l10n.detailSentiment,
                '${analysis.sentiment.emoji} ${analysis.sentiment.getLocalizedName(l10n)}',
              ),
              _buildDetailRow(
                l10n.detailIntent,
                '${analysis.intent.icon} ${analysis.intent.getLocalizedName(l10n)}',
              ),
              _buildDetailRow(
                l10n.detailConfidence,
                analysis.confidence.getLocalizedName(l10n),
              ),
              _buildDetailRow(
                l10n.detailSource,
                analysis.isLocalAnalysis ? l10n.sourceLocal : l10n.sourceCloud,
                trailing: analysis.modelName != null
                    ? Tooltip(
                        message: 'Engine: ${analysis.modelName}',
                        child: Icon(
                          Icons.info_outline,
                          size: 14,
                          color: AppColors.withAlpha(AppColors.white, 0.4),
                        ),
                      )
                    : null,
              ),
              if (analysis.detectedKeywords.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                Text(l10n.detectedKeywords, style: AppTypography.caption),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: analysis.detectedKeywords.map((keyword) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: AppSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.withAlpha(riskColor, 0.1),
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusSm,
                        ),
                        border: Border.all(
                          color: AppColors.withAlpha(riskColor, 0.5),
                        ),
                      ),
                      child: Text(
                        keyword,
                        style: AppTypography.caption.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, {Widget? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.withAlpha(AppColors.white, 0.5),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(value, style: AppTypography.bodySmall),
              if (trailing != null) ...[
                const SizedBox(width: AppSpacing.xs),
                trailing,
              ],
            ],
          ),
        ],
      ),
    );
  }

  String _getLocalizedActionTitle(
    SuggestedAction action,
    AppLocalizations l10n,
  ) {
    switch (action.type) {
      case SuggestedActionType.doNotClickLinks:
        return l10n.actionDoNotClickLinksTitle;
      case SuggestedActionType.verifySource:
        return l10n.actionVerifySourceTitle;
      case SuggestedActionType.ignoreMessage:
        return l10n.actionIgnoreMessageTitle;
      case SuggestedActionType.reportFraud:
        return l10n.actionReportFraudTitle;
    }
  }

  String _getLocalizedActionDescription(
    SuggestedAction action,
    AppLocalizations l10n,
  ) {
    switch (action.type) {
      case SuggestedActionType.doNotClickLinks:
        return l10n.actionDoNotClickLinksDesc;
      case SuggestedActionType.verifySource:
        return l10n.actionVerifySourceDesc;
      case SuggestedActionType.ignoreMessage:
        return l10n.actionIgnoreMessageDesc;
      case SuggestedActionType.reportFraud:
        return l10n.actionReportFraudDesc;
    }
  }

  String? _getLocalizedActionAlternative(
    SuggestedAction action,
    AppLocalizations l10n,
  ) {
    switch (action.type) {
      case SuggestedActionType.doNotClickLinks:
        return l10n.actionDoNotClickLinksAlternative;
      case SuggestedActionType.verifySource:
        return l10n.actionVerifySourceAlternative;
      case SuggestedActionType.ignoreMessage:
        return null;
      case SuggestedActionType.reportFraud:
        return l10n.actionReportFraudAlternative;
    }
  }

  IconData _getRiskIcon() {
    switch (analysis.riskLevel) {
      case RiskLevel.low:
        return Icons.check_circle_outline;
      case RiskLevel.medium:
        return Icons.info_outline;
      case RiskLevel.high:
        return Icons.warning_amber;
      case RiskLevel.critical:
        return Icons.dangerous;
    }
  }
}
