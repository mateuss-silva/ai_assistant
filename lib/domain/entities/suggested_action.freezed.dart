// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggested_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SuggestedAction _$SuggestedActionFromJson(Map<String, dynamic> json) {
  return _SuggestedAction.fromJson(json);
}

/// @nodoc
mixin _$SuggestedAction {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isUrgent => throw _privateConstructorUsedError;
  String? get safeAlternative => throw _privateConstructorUsedError;

  /// Serializes this SuggestedAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SuggestedAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuggestedActionCopyWith<SuggestedAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestedActionCopyWith<$Res> {
  factory $SuggestedActionCopyWith(
    SuggestedAction value,
    $Res Function(SuggestedAction) then,
  ) = _$SuggestedActionCopyWithImpl<$Res, SuggestedAction>;
  @useResult
  $Res call({
    String title,
    String description,
    bool isUrgent,
    String? safeAlternative,
  });
}

/// @nodoc
class _$SuggestedActionCopyWithImpl<$Res, $Val extends SuggestedAction>
    implements $SuggestedActionCopyWith<$Res> {
  _$SuggestedActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuggestedAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? isUrgent = null,
    Object? safeAlternative = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            isUrgent: null == isUrgent
                ? _value.isUrgent
                : isUrgent // ignore: cast_nullable_to_non_nullable
                      as bool,
            safeAlternative: freezed == safeAlternative
                ? _value.safeAlternative
                : safeAlternative // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SuggestedActionImplCopyWith<$Res>
    implements $SuggestedActionCopyWith<$Res> {
  factory _$$SuggestedActionImplCopyWith(
    _$SuggestedActionImpl value,
    $Res Function(_$SuggestedActionImpl) then,
  ) = __$$SuggestedActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String description,
    bool isUrgent,
    String? safeAlternative,
  });
}

/// @nodoc
class __$$SuggestedActionImplCopyWithImpl<$Res>
    extends _$SuggestedActionCopyWithImpl<$Res, _$SuggestedActionImpl>
    implements _$$SuggestedActionImplCopyWith<$Res> {
  __$$SuggestedActionImplCopyWithImpl(
    _$SuggestedActionImpl _value,
    $Res Function(_$SuggestedActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SuggestedAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? isUrgent = null,
    Object? safeAlternative = freezed,
  }) {
    return _then(
      _$SuggestedActionImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        isUrgent: null == isUrgent
            ? _value.isUrgent
            : isUrgent // ignore: cast_nullable_to_non_nullable
                  as bool,
        safeAlternative: freezed == safeAlternative
            ? _value.safeAlternative
            : safeAlternative // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestedActionImpl implements _SuggestedAction {
  const _$SuggestedActionImpl({
    required this.title,
    required this.description,
    this.isUrgent = false,
    this.safeAlternative,
  });

  factory _$SuggestedActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestedActionImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey()
  final bool isUrgent;
  @override
  final String? safeAlternative;

  @override
  String toString() {
    return 'SuggestedAction(title: $title, description: $description, isUrgent: $isUrgent, safeAlternative: $safeAlternative)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestedActionImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isUrgent, isUrgent) ||
                other.isUrgent == isUrgent) &&
            (identical(other.safeAlternative, safeAlternative) ||
                other.safeAlternative == safeAlternative));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, isUrgent, safeAlternative);

  /// Create a copy of SuggestedAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestedActionImplCopyWith<_$SuggestedActionImpl> get copyWith =>
      __$$SuggestedActionImplCopyWithImpl<_$SuggestedActionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestedActionImplToJson(this);
  }
}

abstract class _SuggestedAction implements SuggestedAction {
  const factory _SuggestedAction({
    required final String title,
    required final String description,
    final bool isUrgent,
    final String? safeAlternative,
  }) = _$SuggestedActionImpl;

  factory _SuggestedAction.fromJson(Map<String, dynamic> json) =
      _$SuggestedActionImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  bool get isUrgent;
  @override
  String? get safeAlternative;

  /// Create a copy of SuggestedAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestedActionImplCopyWith<_$SuggestedActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
