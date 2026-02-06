import 'package:flutter/material.dart';

import '../../core/design_system/design_system.dart';
import '../../core/error/error.dart';
import '../providers/analysis_notifier.dart';
import 'analysis_result_card.dart';
import 'glass_card.dart';

/// Displays analysis results based on current state
class ResultsSection extends StatelessWidget {
  final AnalysisState state;

  const ResultsSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.screenPadding),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return switch (state) {
      AnalysisLoading() => _buildLoading(),
      AnalysisError(:final failure) => _buildError(failure),
      AnalysisSuccess(:final analysis) => AnalysisResultCard(
        analysis: analysis,
      ),
      AnalysisInitial() => _buildInitialHint(),
    };
  }

  Widget _buildLoading() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            CircularProgressIndicator(color: AppColors.primary),
            SizedBox(height: AppSpacing.lg),
            Text('Analisando mensagem...', style: AppTypography.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildError(Failure failure) {
    return GlassCard(
      child: Column(
        children: [
          const Icon(Icons.error_outline, color: AppColors.error, size: 48),
          const SizedBox(height: AppSpacing.md),
          Text(
            _getFailureMessage(failure),
            textAlign: TextAlign.center,
            style: AppTypography.bodySmall,
          ),
        ],
      ),
    );
  }

  String _getFailureMessage(Failure failure) {
    return failure.when(
      localAnalysisFailed: (msg) => 'Erro na análise local: $msg',
      cloudAnalysisFailed: (msg) => 'Erro na análise em nuvem: $msg',
      noConnection: () => 'Sem conexão com a internet',
      userDeniedConsent: () => 'Análise em nuvem não autorizada',
      invalidMessage: (reason) => 'Mensagem inválida: $reason',
      unknown: (msg) => msg ?? 'Erro desconhecido',
    );
  }

  Widget _buildInitialHint() {
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
            'Cole uma mensagem acima para verificar se é segura',
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
              'Exemplo: "Detectamos atividade suspeita. Confirme seus dados imediatamente clicando no link."',
              style: AppTypography.captionItalic,
            ),
          ),
        ],
      ),
    );
  }
}
