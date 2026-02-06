// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_analysis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MessageAnalysis _$MessageAnalysisFromJson(Map<String, dynamic> json) {
  return _MessageAnalysis.fromJson(json);
}

/// @nodoc
mixin _$MessageAnalysis {
  /// The original message that was analyzed
  String get originalMessage => throw _privateConstructorUsedError;

  /// Detected sentiment of the message
  Sentiment get sentiment => throw _privateConstructorUsedError;

  /// Detected intent/purpose of the message
  Intent get intent => throw _privateConstructorUsedError;

  /// Confidence level of the analysis
  Confidence get confidence => throw _privateConstructorUsedError;

  /// Risk level assessment
  RiskLevel get riskLevel => throw _privateConstructorUsedError;

  /// Recommended safe action for the user
  SuggestedAction get suggestedAction => throw _privateConstructorUsedError;

  /// Whether the analysis was performed locally (offline)
  bool get isLocalAnalysis => throw _privateConstructorUsedError;

  /// Timestamp of the analysis
  DateTime get analyzedAt => throw _privateConstructorUsedError;

  /// Additional keywords detected
  List<String> get detectedKeywords => throw _privateConstructorUsedError;

  /// Serializes this MessageAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageAnalysisCopyWith<MessageAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageAnalysisCopyWith<$Res> {
  factory $MessageAnalysisCopyWith(
    MessageAnalysis value,
    $Res Function(MessageAnalysis) then,
  ) = _$MessageAnalysisCopyWithImpl<$Res, MessageAnalysis>;
  @useResult
  $Res call({
    String originalMessage,
    Sentiment sentiment,
    Intent intent,
    Confidence confidence,
    RiskLevel riskLevel,
    SuggestedAction suggestedAction,
    bool isLocalAnalysis,
    DateTime analyzedAt,
    List<String> detectedKeywords,
  });

  $SuggestedActionCopyWith<$Res> get suggestedAction;
}

/// @nodoc
class _$MessageAnalysisCopyWithImpl<$Res, $Val extends MessageAnalysis>
    implements $MessageAnalysisCopyWith<$Res> {
  _$MessageAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalMessage = null,
    Object? sentiment = null,
    Object? intent = null,
    Object? confidence = null,
    Object? riskLevel = null,
    Object? suggestedAction = null,
    Object? isLocalAnalysis = null,
    Object? analyzedAt = null,
    Object? detectedKeywords = null,
  }) {
    return _then(
      _value.copyWith(
            originalMessage: null == originalMessage
                ? _value.originalMessage
                : originalMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            sentiment: null == sentiment
                ? _value.sentiment
                : sentiment // ignore: cast_nullable_to_non_nullable
                      as Sentiment,
            intent: null == intent
                ? _value.intent
                : intent // ignore: cast_nullable_to_non_nullable
                      as Intent,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as Confidence,
            riskLevel: null == riskLevel
                ? _value.riskLevel
                : riskLevel // ignore: cast_nullable_to_non_nullable
                      as RiskLevel,
            suggestedAction: null == suggestedAction
                ? _value.suggestedAction
                : suggestedAction // ignore: cast_nullable_to_non_nullable
                      as SuggestedAction,
            isLocalAnalysis: null == isLocalAnalysis
                ? _value.isLocalAnalysis
                : isLocalAnalysis // ignore: cast_nullable_to_non_nullable
                      as bool,
            analyzedAt: null == analyzedAt
                ? _value.analyzedAt
                : analyzedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            detectedKeywords: null == detectedKeywords
                ? _value.detectedKeywords
                : detectedKeywords // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of MessageAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SuggestedActionCopyWith<$Res> get suggestedAction {
    return $SuggestedActionCopyWith<$Res>(_value.suggestedAction, (value) {
      return _then(_value.copyWith(suggestedAction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageAnalysisImplCopyWith<$Res>
    implements $MessageAnalysisCopyWith<$Res> {
  factory _$$MessageAnalysisImplCopyWith(
    _$MessageAnalysisImpl value,
    $Res Function(_$MessageAnalysisImpl) then,
  ) = __$$MessageAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String originalMessage,
    Sentiment sentiment,
    Intent intent,
    Confidence confidence,
    RiskLevel riskLevel,
    SuggestedAction suggestedAction,
    bool isLocalAnalysis,
    DateTime analyzedAt,
    List<String> detectedKeywords,
  });

  @override
  $SuggestedActionCopyWith<$Res> get suggestedAction;
}

/// @nodoc
class __$$MessageAnalysisImplCopyWithImpl<$Res>
    extends _$MessageAnalysisCopyWithImpl<$Res, _$MessageAnalysisImpl>
    implements _$$MessageAnalysisImplCopyWith<$Res> {
  __$$MessageAnalysisImplCopyWithImpl(
    _$MessageAnalysisImpl _value,
    $Res Function(_$MessageAnalysisImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessageAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalMessage = null,
    Object? sentiment = null,
    Object? intent = null,
    Object? confidence = null,
    Object? riskLevel = null,
    Object? suggestedAction = null,
    Object? isLocalAnalysis = null,
    Object? analyzedAt = null,
    Object? detectedKeywords = null,
  }) {
    return _then(
      _$MessageAnalysisImpl(
        originalMessage: null == originalMessage
            ? _value.originalMessage
            : originalMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        sentiment: null == sentiment
            ? _value.sentiment
            : sentiment // ignore: cast_nullable_to_non_nullable
                  as Sentiment,
        intent: null == intent
            ? _value.intent
            : intent // ignore: cast_nullable_to_non_nullable
                  as Intent,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as Confidence,
        riskLevel: null == riskLevel
            ? _value.riskLevel
            : riskLevel // ignore: cast_nullable_to_non_nullable
                  as RiskLevel,
        suggestedAction: null == suggestedAction
            ? _value.suggestedAction
            : suggestedAction // ignore: cast_nullable_to_non_nullable
                  as SuggestedAction,
        isLocalAnalysis: null == isLocalAnalysis
            ? _value.isLocalAnalysis
            : isLocalAnalysis // ignore: cast_nullable_to_non_nullable
                  as bool,
        analyzedAt: null == analyzedAt
            ? _value.analyzedAt
            : analyzedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        detectedKeywords: null == detectedKeywords
            ? _value._detectedKeywords
            : detectedKeywords // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageAnalysisImpl implements _MessageAnalysis {
  const _$MessageAnalysisImpl({
    required this.originalMessage,
    required this.sentiment,
    required this.intent,
    required this.confidence,
    required this.riskLevel,
    required this.suggestedAction,
    this.isLocalAnalysis = true,
    required this.analyzedAt,
    final List<String> detectedKeywords = const [],
  }) : _detectedKeywords = detectedKeywords;

  factory _$MessageAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageAnalysisImplFromJson(json);

  /// The original message that was analyzed
  @override
  final String originalMessage;

  /// Detected sentiment of the message
  @override
  final Sentiment sentiment;

  /// Detected intent/purpose of the message
  @override
  final Intent intent;

  /// Confidence level of the analysis
  @override
  final Confidence confidence;

  /// Risk level assessment
  @override
  final RiskLevel riskLevel;

  /// Recommended safe action for the user
  @override
  final SuggestedAction suggestedAction;

  /// Whether the analysis was performed locally (offline)
  @override
  @JsonKey()
  final bool isLocalAnalysis;

  /// Timestamp of the analysis
  @override
  final DateTime analyzedAt;

  /// Additional keywords detected
  final List<String> _detectedKeywords;

  /// Additional keywords detected
  @override
  @JsonKey()
  List<String> get detectedKeywords {
    if (_detectedKeywords is EqualUnmodifiableListView)
      return _detectedKeywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detectedKeywords);
  }

  @override
  String toString() {
    return 'MessageAnalysis(originalMessage: $originalMessage, sentiment: $sentiment, intent: $intent, confidence: $confidence, riskLevel: $riskLevel, suggestedAction: $suggestedAction, isLocalAnalysis: $isLocalAnalysis, analyzedAt: $analyzedAt, detectedKeywords: $detectedKeywords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageAnalysisImpl &&
            (identical(other.originalMessage, originalMessage) ||
                other.originalMessage == originalMessage) &&
            (identical(other.sentiment, sentiment) ||
                other.sentiment == sentiment) &&
            (identical(other.intent, intent) || other.intent == intent) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            (identical(other.suggestedAction, suggestedAction) ||
                other.suggestedAction == suggestedAction) &&
            (identical(other.isLocalAnalysis, isLocalAnalysis) ||
                other.isLocalAnalysis == isLocalAnalysis) &&
            (identical(other.analyzedAt, analyzedAt) ||
                other.analyzedAt == analyzedAt) &&
            const DeepCollectionEquality().equals(
              other._detectedKeywords,
              _detectedKeywords,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    originalMessage,
    sentiment,
    intent,
    confidence,
    riskLevel,
    suggestedAction,
    isLocalAnalysis,
    analyzedAt,
    const DeepCollectionEquality().hash(_detectedKeywords),
  );

  /// Create a copy of MessageAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageAnalysisImplCopyWith<_$MessageAnalysisImpl> get copyWith =>
      __$$MessageAnalysisImplCopyWithImpl<_$MessageAnalysisImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageAnalysisImplToJson(this);
  }
}

abstract class _MessageAnalysis implements MessageAnalysis {
  const factory _MessageAnalysis({
    required final String originalMessage,
    required final Sentiment sentiment,
    required final Intent intent,
    required final Confidence confidence,
    required final RiskLevel riskLevel,
    required final SuggestedAction suggestedAction,
    final bool isLocalAnalysis,
    required final DateTime analyzedAt,
    final List<String> detectedKeywords,
  }) = _$MessageAnalysisImpl;

  factory _MessageAnalysis.fromJson(Map<String, dynamic> json) =
      _$MessageAnalysisImpl.fromJson;

  /// The original message that was analyzed
  @override
  String get originalMessage;

  /// Detected sentiment of the message
  @override
  Sentiment get sentiment;

  /// Detected intent/purpose of the message
  @override
  Intent get intent;

  /// Confidence level of the analysis
  @override
  Confidence get confidence;

  /// Risk level assessment
  @override
  RiskLevel get riskLevel;

  /// Recommended safe action for the user
  @override
  SuggestedAction get suggestedAction;

  /// Whether the analysis was performed locally (offline)
  @override
  bool get isLocalAnalysis;

  /// Timestamp of the analysis
  @override
  DateTime get analyzedAt;

  /// Additional keywords detected
  @override
  List<String> get detectedKeywords;

  /// Create a copy of MessageAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageAnalysisImplCopyWith<_$MessageAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
