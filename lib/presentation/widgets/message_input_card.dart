import 'package:flutter/material.dart';

import '../../core/design_system/design_system.dart';
import 'glass_card.dart';

/// Card with message input form and action buttons
class MessageInputCard extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final VoidCallback onAnalyze;
  final VoidCallback onClear;
  final bool isLoading;

  const MessageInputCard({
    super.key,
    required this.controller,
    required this.formKey,
    required this.onAnalyze,
    required this.onClear,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: GlassCard(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cole a mensagem financeira',
                style: AppTypography.bodyLarge,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'SMS, email ou notificação do banco',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.withAlpha(AppColors.white, 0.5),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              _buildTextField(),
              const SizedBox(height: AppSpacing.lg),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      controller: controller,
      maxLines: 5,
      maxLength: 500, // Limit input length for security/performance
      buildCounter:
          (context, {required currentLength, required isFocused, maxLength}) {
            return isFocused
                ? Text(
                    '$currentLength/$maxLength',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.withAlpha(AppColors.white, 0.5),
                    ),
                  )
                : null;
          },
      style: AppTypography.body,
      decoration: AppInputs.textField(
        hint: 'Ex: Detectamos atividade suspeita em sua conta...',
      ),
      validator: _validateMessage,
    );
  }

  String? _validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, insira uma mensagem';
    }
    if (value.trim().length < 5) {
      return 'Mensagem muito curta';
    }
    return null;
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onClear,
            style: AppButtons.secondary,
            child: const Text('Limpar'),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: isLoading ? null : onAnalyze,
            style: AppButtons.primary,
            child: isLoading ? _buildLoadingIndicator() : _buildAnalyzeLabel(),
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingIndicator() {
    return const SizedBox(
      height: AppSpacing.iconSizeSmall,
      width: AppSpacing.iconSizeSmall,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: AppColors.bgDark1,
      ),
    );
  }

  Widget _buildAnalyzeLabel() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.security, size: AppSpacing.iconSizeSmall),
        SizedBox(width: AppSpacing.sm),
        Text('Analisar', style: AppTypography.button),
      ],
    );
  }
}
