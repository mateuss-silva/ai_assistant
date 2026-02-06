import 'package:freezed_annotation/freezed_annotation.dart';

import 'sentiment.dart';
import 'intent.dart';
import 'confidence.dart';
import 'risk_level.dart';
import 'suggested_action.dart';

part 'message_analysis.freezed.dart';
part 'message_analysis.g.dart';

/// Main entity representing the complete analysis of a financial message
@freezed
class MessageAnalysis with _$MessageAnalysis {
  const factory MessageAnalysis({
    /// The original message that was analyzed
    required String originalMessage,

    /// Detected sentiment of the message
    required Sentiment sentiment,

    /// Detected intent/purpose of the message
    required Intent intent,

    /// Confidence level of the analysis
    required Confidence confidence,

    /// Risk level assessment
    required RiskLevel riskLevel,

    /// Recommended safe action for the user
    required SuggestedAction suggestedAction,

    /// Whether the analysis was performed locally (offline)
    @Default(true) bool isLocalAnalysis,

    /// Timestamp of the analysis
    required DateTime analyzedAt,

    /// Additional keywords detected
    @Default([]) List<String> detectedKeywords,
  }) = _MessageAnalysis;

  factory MessageAnalysis.fromJson(Map<String, dynamic> json) =>
      _$MessageAnalysisFromJson(json);
}
