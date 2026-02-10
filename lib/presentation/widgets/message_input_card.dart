import 'package:flutter/material.dart';
import 'package:ai_assistant/l10n/app_localizations.dart';

import 'package:ai_assistant/core/design_system/design_system.dart';
import 'package:ai_assistant/presentation/widgets/glass_card.dart';

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
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: GlassCard(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.inputLabel, style: AppTypography.bodyLarge),
              const SizedBox(height: AppSpacing.xs),
              Text(
                l10n.inputHint,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.withAlpha(AppColors.white, 0.5),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              _buildTextField(l10n),
              const SizedBox(height: AppSpacing.lg),
              _buildActionButtons(l10n),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(AppLocalizations l10n) {
    return TextFormField(
      controller: controller,
      maxLines: 7,
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
      decoration: AppInputs.textField(hint: l10n.inputHint),
      validator: (value) => _validateMessage(value, l10n),
    );
  }

  String? _validateMessage(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) {
      return l10n.inputError;
    }
    if (value.trim().length < 5) {
      return l10n.inputError; // Simplified for now
    }
    return null;
  }

  Widget _buildActionButtons(AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onClear,
            style: AppButtons.secondary,
            child: Text(l10n.clear),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: isLoading ? null : onAnalyze,
            style: AppButtons.primary,
            child: isLoading
                ? _buildLoadingIndicator()
                : _buildAnalyzeLabel(l10n),
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

  Widget _buildAnalyzeLabel(AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.security, size: AppSpacing.iconSizeSmall),
        const SizedBox(width: AppSpacing.sm),
        Text(l10n.analyze, style: AppTypography.button),
      ],
    );
  }
}
