import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/design_system/design_system.dart';
import '../providers/analysis_notifier.dart';
import '../widgets/app_header.dart';
import '../widgets/message_input_card.dart';
import '../widgets/results_section.dart';

/// Main screen for message analysis
class AnalysisScreen extends ConsumerStatefulWidget {
  const AnalysisScreen({super.key});

  @override
  ConsumerState<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends ConsumerState<AnalysisScreen> {
  final _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _analyze() {
    if (_formKey.currentState?.validate() ?? false) {
      ref
          .read(analysisNotifierProvider.notifier)
          .analyze(_messageController.text);
    }
  }

  void _clear() {
    _messageController.clear();
    ref.read(analysisNotifierProvider.notifier).reset();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(analysisNotifierProvider);
    final isLoading = state is AnalysisLoading;

    return Scaffold(
      body: SelectionArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.backgroundGradient,
          ),
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                _buildConstrainedSliver(const AppHeader()),
                _buildConstrainedSliver(
                  MessageInputCard(
                    controller: _messageController,
                    formKey: _formKey,
                    onAnalyze: _analyze,
                    onClear: _clear,
                    isLoading: isLoading,
                  ),
                ),
                _buildConstrainedSliver(ResultsSection(state: state)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConstrainedSliver(Widget child) {
    return SliverToBoxAdapter(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 850),
          child: child,
        ),
      ),
    );
  }
}
