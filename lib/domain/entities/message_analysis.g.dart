// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageAnalysisImpl _$$MessageAnalysisImplFromJson(
  Map<String, dynamic> json,
) => _$MessageAnalysisImpl(
  originalMessage: json['originalMessage'] as String,
  sentiment: $enumDecode(_$SentimentEnumMap, json['sentiment']),
  intent: $enumDecode(_$IntentEnumMap, json['intent']),
  confidence: $enumDecode(_$ConfidenceEnumMap, json['confidence']),
  riskLevel: $enumDecode(_$RiskLevelEnumMap, json['riskLevel']),
  suggestedAction: SuggestedAction.fromJson(
    json['suggestedAction'] as Map<String, dynamic>,
  ),
  isLocalAnalysis: json['isLocalAnalysis'] as bool? ?? true,
  analyzedAt: DateTime.parse(json['analyzedAt'] as String),
  detectedKeywords:
      (json['detectedKeywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  modelName: json['modelName'] as String?,
);

Map<String, dynamic> _$$MessageAnalysisImplToJson(
  _$MessageAnalysisImpl instance,
) => <String, dynamic>{
  'originalMessage': instance.originalMessage,
  'sentiment': _$SentimentEnumMap[instance.sentiment]!,
  'intent': _$IntentEnumMap[instance.intent]!,
  'confidence': _$ConfidenceEnumMap[instance.confidence]!,
  'riskLevel': _$RiskLevelEnumMap[instance.riskLevel]!,
  'suggestedAction': instance.suggestedAction,
  'isLocalAnalysis': instance.isLocalAnalysis,
  'analyzedAt': instance.analyzedAt.toIso8601String(),
  'detectedKeywords': instance.detectedKeywords,
  'modelName': instance.modelName,
};

const _$SentimentEnumMap = {
  Sentiment.positive: 'positive',
  Sentiment.negative: 'negative',
  Sentiment.neutral: 'neutral',
};

const _$IntentEnumMap = {
  Intent.alert: 'alert',
  Intent.fraud: 'fraud',
  Intent.payment: 'payment',
  Intent.info: 'info',
  Intent.complaint: 'complaint',
  Intent.promotional: 'promotional',
  Intent.unknown: 'unknown',
};

const _$ConfidenceEnumMap = {
  Confidence.low: 'low',
  Confidence.medium: 'medium',
  Confidence.high: 'high',
};

const _$RiskLevelEnumMap = {
  RiskLevel.low: 'low',
  RiskLevel.medium: 'medium',
  RiskLevel.high: 'high',
  RiskLevel.critical: 'critical',
};
