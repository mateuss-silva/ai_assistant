// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) localAnalysisFailed,
    required TResult Function(String message) cloudAnalysisFailed,
    required TResult Function() noConnection,
    required TResult Function() userDeniedConsent,
    required TResult Function(String reason) invalidMessage,
    required TResult Function(String? message) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? localAnalysisFailed,
    TResult? Function(String message)? cloudAnalysisFailed,
    TResult? Function()? noConnection,
    TResult? Function()? userDeniedConsent,
    TResult? Function(String reason)? invalidMessage,
    TResult? Function(String? message)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? localAnalysisFailed,
    TResult Function(String message)? cloudAnalysisFailed,
    TResult Function()? noConnection,
    TResult Function()? userDeniedConsent,
    TResult Function(String reason)? invalidMessage,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalAnalysisFailed value) localAnalysisFailed,
    required TResult Function(CloudAnalysisFailed value) cloudAnalysisFailed,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(UserDeniedConsent value) userDeniedConsent,
    required TResult Function(InvalidMessage value) invalidMessage,
    required TResult Function(UnknownFailure value) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocalAnalysisFailed value)? localAnalysisFailed,
    TResult? Function(CloudAnalysisFailed value)? cloudAnalysisFailed,
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(UserDeniedConsent value)? userDeniedConsent,
    TResult? Function(InvalidMessage value)? invalidMessage,
    TResult? Function(UnknownFailure value)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalAnalysisFailed value)? localAnalysisFailed,
    TResult Function(CloudAnalysisFailed value)? cloudAnalysisFailed,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(UserDeniedConsent value)? userDeniedConsent,
    TResult Function(InvalidMessage value)? invalidMessage,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LocalAnalysisFailedImplCopyWith<$Res> {
  factory _$$LocalAnalysisFailedImplCopyWith(
    _$LocalAnalysisFailedImpl value,
    $Res Function(_$LocalAnalysisFailedImpl) then,
  ) = __$$LocalAnalysisFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LocalAnalysisFailedImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$LocalAnalysisFailedImpl>
    implements _$$LocalAnalysisFailedImplCopyWith<$Res> {
  __$$LocalAnalysisFailedImplCopyWithImpl(
    _$LocalAnalysisFailedImpl _value,
    $Res Function(_$LocalAnalysisFailedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$LocalAnalysisFailedImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LocalAnalysisFailedImpl implements LocalAnalysisFailed {
  const _$LocalAnalysisFailedImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.localAnalysisFailed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalAnalysisFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalAnalysisFailedImplCopyWith<_$LocalAnalysisFailedImpl> get copyWith =>
      __$$LocalAnalysisFailedImplCopyWithImpl<_$LocalAnalysisFailedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) localAnalysisFailed,
    required TResult Function(String message) cloudAnalysisFailed,
    required TResult Function() noConnection,
    required TResult Function() userDeniedConsent,
    required TResult Function(String reason) invalidMessage,
    required TResult Function(String? message) unknown,
  }) {
    return localAnalysisFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? localAnalysisFailed,
    TResult? Function(String message)? cloudAnalysisFailed,
    TResult? Function()? noConnection,
    TResult? Function()? userDeniedConsent,
    TResult? Function(String reason)? invalidMessage,
    TResult? Function(String? message)? unknown,
  }) {
    return localAnalysisFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? localAnalysisFailed,
    TResult Function(String message)? cloudAnalysisFailed,
    TResult Function()? noConnection,
    TResult Function()? userDeniedConsent,
    TResult Function(String reason)? invalidMessage,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (localAnalysisFailed != null) {
      return localAnalysisFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalAnalysisFailed value) localAnalysisFailed,
    required TResult Function(CloudAnalysisFailed value) cloudAnalysisFailed,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(UserDeniedConsent value) userDeniedConsent,
    required TResult Function(InvalidMessage value) invalidMessage,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return localAnalysisFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocalAnalysisFailed value)? localAnalysisFailed,
    TResult? Function(CloudAnalysisFailed value)? cloudAnalysisFailed,
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(UserDeniedConsent value)? userDeniedConsent,
    TResult? Function(InvalidMessage value)? invalidMessage,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return localAnalysisFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalAnalysisFailed value)? localAnalysisFailed,
    TResult Function(CloudAnalysisFailed value)? cloudAnalysisFailed,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(UserDeniedConsent value)? userDeniedConsent,
    TResult Function(InvalidMessage value)? invalidMessage,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (localAnalysisFailed != null) {
      return localAnalysisFailed(this);
    }
    return orElse();
  }
}

abstract class LocalAnalysisFailed implements Failure {
  const factory LocalAnalysisFailed({required final String message}) =
      _$LocalAnalysisFailedImpl;

  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalAnalysisFailedImplCopyWith<_$LocalAnalysisFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CloudAnalysisFailedImplCopyWith<$Res> {
  factory _$$CloudAnalysisFailedImplCopyWith(
    _$CloudAnalysisFailedImpl value,
    $Res Function(_$CloudAnalysisFailedImpl) then,
  ) = __$$CloudAnalysisFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CloudAnalysisFailedImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CloudAnalysisFailedImpl>
    implements _$$CloudAnalysisFailedImplCopyWith<$Res> {
  __$$CloudAnalysisFailedImplCopyWithImpl(
    _$CloudAnalysisFailedImpl _value,
    $Res Function(_$CloudAnalysisFailedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$CloudAnalysisFailedImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CloudAnalysisFailedImpl implements CloudAnalysisFailed {
  const _$CloudAnalysisFailedImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.cloudAnalysisFailed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloudAnalysisFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CloudAnalysisFailedImplCopyWith<_$CloudAnalysisFailedImpl> get copyWith =>
      __$$CloudAnalysisFailedImplCopyWithImpl<_$CloudAnalysisFailedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) localAnalysisFailed,
    required TResult Function(String message) cloudAnalysisFailed,
    required TResult Function() noConnection,
    required TResult Function() userDeniedConsent,
    required TResult Function(String reason) invalidMessage,
    required TResult Function(String? message) unknown,
  }) {
    return cloudAnalysisFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? localAnalysisFailed,
    TResult? Function(String message)? cloudAnalysisFailed,
    TResult? Function()? noConnection,
    TResult? Function()? userDeniedConsent,
    TResult? Function(String reason)? invalidMessage,
    TResult? Function(String? message)? unknown,
  }) {
    return cloudAnalysisFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? localAnalysisFailed,
    TResult Function(String message)? cloudAnalysisFailed,
    TResult Function()? noConnection,
    TResult Function()? userDeniedConsent,
    TResult Function(String reason)? invalidMessage,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (cloudAnalysisFailed != null) {
      return cloudAnalysisFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalAnalysisFailed value) localAnalysisFailed,
    required TResult Function(CloudAnalysisFailed value) cloudAnalysisFailed,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(UserDeniedConsent value) userDeniedConsent,
    required TResult Function(InvalidMessage value) invalidMessage,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return cloudAnalysisFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocalAnalysisFailed value)? localAnalysisFailed,
    TResult? Function(CloudAnalysisFailed value)? cloudAnalysisFailed,
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(UserDeniedConsent value)? userDeniedConsent,
    TResult? Function(InvalidMessage value)? invalidMessage,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return cloudAnalysisFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalAnalysisFailed value)? localAnalysisFailed,
    TResult Function(CloudAnalysisFailed value)? cloudAnalysisFailed,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(UserDeniedConsent value)? userDeniedConsent,
    TResult Function(InvalidMessage value)? invalidMessage,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (cloudAnalysisFailed != null) {
      return cloudAnalysisFailed(this);
    }
    return orElse();
  }
}

abstract class CloudAnalysisFailed implements Failure {
  const factory CloudAnalysisFailed({required final String message}) =
      _$CloudAnalysisFailedImpl;

  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CloudAnalysisFailedImplCopyWith<_$CloudAnalysisFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoConnectionImplCopyWith<$Res> {
  factory _$$NoConnectionImplCopyWith(
    _$NoConnectionImpl value,
    $Res Function(_$NoConnectionImpl) then,
  ) = __$$NoConnectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoConnectionImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NoConnectionImpl>
    implements _$$NoConnectionImplCopyWith<$Res> {
  __$$NoConnectionImplCopyWithImpl(
    _$NoConnectionImpl _value,
    $Res Function(_$NoConnectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoConnectionImpl implements NoConnection {
  const _$NoConnectionImpl();

  @override
  String toString() {
    return 'Failure.noConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoConnectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) localAnalysisFailed,
    required TResult Function(String message) cloudAnalysisFailed,
    required TResult Function() noConnection,
    required TResult Function() userDeniedConsent,
    required TResult Function(String reason) invalidMessage,
    required TResult Function(String? message) unknown,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? localAnalysisFailed,
    TResult? Function(String message)? cloudAnalysisFailed,
    TResult? Function()? noConnection,
    TResult? Function()? userDeniedConsent,
    TResult? Function(String reason)? invalidMessage,
    TResult? Function(String? message)? unknown,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? localAnalysisFailed,
    TResult Function(String message)? cloudAnalysisFailed,
    TResult Function()? noConnection,
    TResult Function()? userDeniedConsent,
    TResult Function(String reason)? invalidMessage,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalAnalysisFailed value) localAnalysisFailed,
    required TResult Function(CloudAnalysisFailed value) cloudAnalysisFailed,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(UserDeniedConsent value) userDeniedConsent,
    required TResult Function(InvalidMessage value) invalidMessage,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocalAnalysisFailed value)? localAnalysisFailed,
    TResult? Function(CloudAnalysisFailed value)? cloudAnalysisFailed,
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(UserDeniedConsent value)? userDeniedConsent,
    TResult? Function(InvalidMessage value)? invalidMessage,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalAnalysisFailed value)? localAnalysisFailed,
    TResult Function(CloudAnalysisFailed value)? cloudAnalysisFailed,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(UserDeniedConsent value)? userDeniedConsent,
    TResult Function(InvalidMessage value)? invalidMessage,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnection implements Failure {
  const factory NoConnection() = _$NoConnectionImpl;
}

/// @nodoc
abstract class _$$UserDeniedConsentImplCopyWith<$Res> {
  factory _$$UserDeniedConsentImplCopyWith(
    _$UserDeniedConsentImpl value,
    $Res Function(_$UserDeniedConsentImpl) then,
  ) = __$$UserDeniedConsentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserDeniedConsentImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UserDeniedConsentImpl>
    implements _$$UserDeniedConsentImplCopyWith<$Res> {
  __$$UserDeniedConsentImplCopyWithImpl(
    _$UserDeniedConsentImpl _value,
    $Res Function(_$UserDeniedConsentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserDeniedConsentImpl implements UserDeniedConsent {
  const _$UserDeniedConsentImpl();

  @override
  String toString() {
    return 'Failure.userDeniedConsent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserDeniedConsentImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) localAnalysisFailed,
    required TResult Function(String message) cloudAnalysisFailed,
    required TResult Function() noConnection,
    required TResult Function() userDeniedConsent,
    required TResult Function(String reason) invalidMessage,
    required TResult Function(String? message) unknown,
  }) {
    return userDeniedConsent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? localAnalysisFailed,
    TResult? Function(String message)? cloudAnalysisFailed,
    TResult? Function()? noConnection,
    TResult? Function()? userDeniedConsent,
    TResult? Function(String reason)? invalidMessage,
    TResult? Function(String? message)? unknown,
  }) {
    return userDeniedConsent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? localAnalysisFailed,
    TResult Function(String message)? cloudAnalysisFailed,
    TResult Function()? noConnection,
    TResult Function()? userDeniedConsent,
    TResult Function(String reason)? invalidMessage,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (userDeniedConsent != null) {
      return userDeniedConsent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalAnalysisFailed value) localAnalysisFailed,
    required TResult Function(CloudAnalysisFailed value) cloudAnalysisFailed,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(UserDeniedConsent value) userDeniedConsent,
    required TResult Function(InvalidMessage value) invalidMessage,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return userDeniedConsent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocalAnalysisFailed value)? localAnalysisFailed,
    TResult? Function(CloudAnalysisFailed value)? cloudAnalysisFailed,
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(UserDeniedConsent value)? userDeniedConsent,
    TResult? Function(InvalidMessage value)? invalidMessage,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return userDeniedConsent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalAnalysisFailed value)? localAnalysisFailed,
    TResult Function(CloudAnalysisFailed value)? cloudAnalysisFailed,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(UserDeniedConsent value)? userDeniedConsent,
    TResult Function(InvalidMessage value)? invalidMessage,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (userDeniedConsent != null) {
      return userDeniedConsent(this);
    }
    return orElse();
  }
}

abstract class UserDeniedConsent implements Failure {
  const factory UserDeniedConsent() = _$UserDeniedConsentImpl;
}

/// @nodoc
abstract class _$$InvalidMessageImplCopyWith<$Res> {
  factory _$$InvalidMessageImplCopyWith(
    _$InvalidMessageImpl value,
    $Res Function(_$InvalidMessageImpl) then,
  ) = __$$InvalidMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$InvalidMessageImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$InvalidMessageImpl>
    implements _$$InvalidMessageImplCopyWith<$Res> {
  __$$InvalidMessageImplCopyWithImpl(
    _$InvalidMessageImpl _value,
    $Res Function(_$InvalidMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = null}) {
    return _then(
      _$InvalidMessageImpl(
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$InvalidMessageImpl implements InvalidMessage {
  const _$InvalidMessageImpl({required this.reason});

  @override
  final String reason;

  @override
  String toString() {
    return 'Failure.invalidMessage(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidMessageImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidMessageImplCopyWith<_$InvalidMessageImpl> get copyWith =>
      __$$InvalidMessageImplCopyWithImpl<_$InvalidMessageImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) localAnalysisFailed,
    required TResult Function(String message) cloudAnalysisFailed,
    required TResult Function() noConnection,
    required TResult Function() userDeniedConsent,
    required TResult Function(String reason) invalidMessage,
    required TResult Function(String? message) unknown,
  }) {
    return invalidMessage(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? localAnalysisFailed,
    TResult? Function(String message)? cloudAnalysisFailed,
    TResult? Function()? noConnection,
    TResult? Function()? userDeniedConsent,
    TResult? Function(String reason)? invalidMessage,
    TResult? Function(String? message)? unknown,
  }) {
    return invalidMessage?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? localAnalysisFailed,
    TResult Function(String message)? cloudAnalysisFailed,
    TResult Function()? noConnection,
    TResult Function()? userDeniedConsent,
    TResult Function(String reason)? invalidMessage,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (invalidMessage != null) {
      return invalidMessage(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalAnalysisFailed value) localAnalysisFailed,
    required TResult Function(CloudAnalysisFailed value) cloudAnalysisFailed,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(UserDeniedConsent value) userDeniedConsent,
    required TResult Function(InvalidMessage value) invalidMessage,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return invalidMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocalAnalysisFailed value)? localAnalysisFailed,
    TResult? Function(CloudAnalysisFailed value)? cloudAnalysisFailed,
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(UserDeniedConsent value)? userDeniedConsent,
    TResult? Function(InvalidMessage value)? invalidMessage,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return invalidMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalAnalysisFailed value)? localAnalysisFailed,
    TResult Function(CloudAnalysisFailed value)? cloudAnalysisFailed,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(UserDeniedConsent value)? userDeniedConsent,
    TResult Function(InvalidMessage value)? invalidMessage,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (invalidMessage != null) {
      return invalidMessage(this);
    }
    return orElse();
  }
}

abstract class InvalidMessage implements Failure {
  const factory InvalidMessage({required final String reason}) =
      _$InvalidMessageImpl;

  String get reason;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidMessageImplCopyWith<_$InvalidMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownFailureImplCopyWith<$Res> {
  factory _$$UnknownFailureImplCopyWith(
    _$UnknownFailureImpl value,
    $Res Function(_$UnknownFailureImpl) then,
  ) = __$$UnknownFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnknownFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnknownFailureImpl>
    implements _$$UnknownFailureImplCopyWith<$Res> {
  __$$UnknownFailureImplCopyWithImpl(
    _$UnknownFailureImpl _value,
    $Res Function(_$UnknownFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed}) {
    return _then(
      _$UnknownFailureImpl(
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$UnknownFailureImpl implements UnknownFailure {
  const _$UnknownFailureImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      __$$UnknownFailureImplCopyWithImpl<_$UnknownFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) localAnalysisFailed,
    required TResult Function(String message) cloudAnalysisFailed,
    required TResult Function() noConnection,
    required TResult Function() userDeniedConsent,
    required TResult Function(String reason) invalidMessage,
    required TResult Function(String? message) unknown,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? localAnalysisFailed,
    TResult? Function(String message)? cloudAnalysisFailed,
    TResult? Function()? noConnection,
    TResult? Function()? userDeniedConsent,
    TResult? Function(String reason)? invalidMessage,
    TResult? Function(String? message)? unknown,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? localAnalysisFailed,
    TResult Function(String message)? cloudAnalysisFailed,
    TResult Function()? noConnection,
    TResult Function()? userDeniedConsent,
    TResult Function(String reason)? invalidMessage,
    TResult Function(String? message)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalAnalysisFailed value) localAnalysisFailed,
    required TResult Function(CloudAnalysisFailed value) cloudAnalysisFailed,
    required TResult Function(NoConnection value) noConnection,
    required TResult Function(UserDeniedConsent value) userDeniedConsent,
    required TResult Function(InvalidMessage value) invalidMessage,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocalAnalysisFailed value)? localAnalysisFailed,
    TResult? Function(CloudAnalysisFailed value)? cloudAnalysisFailed,
    TResult? Function(NoConnection value)? noConnection,
    TResult? Function(UserDeniedConsent value)? userDeniedConsent,
    TResult? Function(InvalidMessage value)? invalidMessage,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalAnalysisFailed value)? localAnalysisFailed,
    TResult Function(CloudAnalysisFailed value)? cloudAnalysisFailed,
    TResult Function(NoConnection value)? noConnection,
    TResult Function(UserDeniedConsent value)? userDeniedConsent,
    TResult Function(InvalidMessage value)? invalidMessage,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownFailure implements Failure {
  const factory UnknownFailure({final String? message}) = _$UnknownFailureImpl;

  String? get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
