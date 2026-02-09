import 'package:flutter/material.dart';

import '../../core/design_system/design_system.dart';
import '../../domain/entities/entities.dart';
import 'glass_card.dart';

/// Card displaying the analysis results with visual risk indicators
class AnalysisResultCard extends StatelessWidget {
  final MessageAnalysis analysis;

  const AnalysisResultCard({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
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
                      'Risco ${analysis.riskLevel.displayName}',
                      style: AppTypography.h3.copyWith(color: riskColor),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      analysis.riskLevel.description,
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
                    analysis.suggestedAction.title,
                    style: AppTypography.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                analysis.suggestedAction.description,
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
                          analysis.suggestedAction.safeAlternative!,
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
                'Detalhes da Análise',
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              _buildDetailRow(
                'Sentimento',
                '${analysis.sentiment.emoji} ${analysis.sentiment.displayName}',
              ),
              _buildDetailRow(
                'Intenção',
                '${analysis.intent.icon} ${analysis.intent.displayName}',
              ),
              _buildDetailRow('Precisão', analysis.confidence.displayName),
              _buildDetailRow(
                'Análise',
                analysis.isLocalAnalysis ? '📱 Local (offline)' : '☁️ Nuvem',
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
                const Text(
                  'Palavras-chave detectadas:',
                  style: AppTypography.caption,
                ),
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
