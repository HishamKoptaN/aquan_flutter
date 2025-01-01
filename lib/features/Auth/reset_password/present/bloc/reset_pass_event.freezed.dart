// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_pass_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResetPassEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendOtpReqBodyModel sendOtpReqBodyModel) sendOtp,
    required TResult Function(VerifyOtpReqBodyModel verifyOtpReqBodyModel)
        verifyOtp,
    required TResult Function(ResetPassReqBody resetPassReqBody) resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendOtpReqBodyModel sendOtpReqBodyModel)? sendOtp,
    TResult? Function(VerifyOtpReqBodyModel verifyOtpReqBodyModel)? verifyOtp,
    TResult? Function(ResetPassReqBody resetPassReqBody)? resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendOtpReqBodyModel sendOtpReqBodyModel)? sendOtp,
    TResult Function(VerifyOtpReqBodyModel verifyOtpReqBodyModel)? verifyOtp,
    TResult Function(ResetPassReqBody resetPassReqBody)? resetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetPassword value) resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPassEventCopyWith<$Res> {
  factory $ResetPassEventCopyWith(
          ResetPassEvent value, $Res Function(ResetPassEvent) then) =
      _$ResetPassEventCopyWithImpl<$Res, ResetPassEvent>;
}

/// @nodoc
class _$ResetPassEventCopyWithImpl<$Res, $Val extends ResetPassEvent>
    implements $ResetPassEventCopyWith<$Res> {
  _$ResetPassEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SendOtpImplCopyWith<$Res> {
  factory _$$SendOtpImplCopyWith(
          _$SendOtpImpl value, $Res Function(_$SendOtpImpl) then) =
      __$$SendOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SendOtpReqBodyModel sendOtpReqBodyModel});

  $SendOtpReqBodyModelCopyWith<$Res> get sendOtpReqBodyModel;
}

/// @nodoc
class __$$SendOtpImplCopyWithImpl<$Res>
    extends _$ResetPassEventCopyWithImpl<$Res, _$SendOtpImpl>
    implements _$$SendOtpImplCopyWith<$Res> {
  __$$SendOtpImplCopyWithImpl(
      _$SendOtpImpl _value, $Res Function(_$SendOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendOtpReqBodyModel = null,
  }) {
    return _then(_$SendOtpImpl(
      sendOtpReqBodyModel: null == sendOtpReqBodyModel
          ? _value.sendOtpReqBodyModel
          : sendOtpReqBodyModel // ignore: cast_nullable_to_non_nullable
              as SendOtpReqBodyModel,
    ));
  }

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SendOtpReqBodyModelCopyWith<$Res> get sendOtpReqBodyModel {
    return $SendOtpReqBodyModelCopyWith<$Res>(_value.sendOtpReqBodyModel,
        (value) {
      return _then(_value.copyWith(sendOtpReqBodyModel: value));
    });
  }
}

/// @nodoc

class _$SendOtpImpl implements _SendOtp {
  const _$SendOtpImpl({required this.sendOtpReqBodyModel});

  @override
  final SendOtpReqBodyModel sendOtpReqBodyModel;

  @override
  String toString() {
    return 'ResetPassEvent.sendOtp(sendOtpReqBodyModel: $sendOtpReqBodyModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpImpl &&
            (identical(other.sendOtpReqBodyModel, sendOtpReqBodyModel) ||
                other.sendOtpReqBodyModel == sendOtpReqBodyModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendOtpReqBodyModel);

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
      __$$SendOtpImplCopyWithImpl<_$SendOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendOtpReqBodyModel sendOtpReqBodyModel) sendOtp,
    required TResult Function(VerifyOtpReqBodyModel verifyOtpReqBodyModel)
        verifyOtp,
    required TResult Function(ResetPassReqBody resetPassReqBody) resetPassword,
  }) {
    return sendOtp(sendOtpReqBodyModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendOtpReqBodyModel sendOtpReqBodyModel)? sendOtp,
    TResult? Function(VerifyOtpReqBodyModel verifyOtpReqBodyModel)? verifyOtp,
    TResult? Function(ResetPassReqBody resetPassReqBody)? resetPassword,
  }) {
    return sendOtp?.call(sendOtpReqBodyModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendOtpReqBodyModel sendOtpReqBodyModel)? sendOtp,
    TResult Function(VerifyOtpReqBodyModel verifyOtpReqBodyModel)? verifyOtp,
    TResult Function(ResetPassReqBody resetPassReqBody)? resetPassword,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(sendOtpReqBodyModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) {
    return sendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(this);
    }
    return orElse();
  }
}

abstract class _SendOtp implements ResetPassEvent {
  const factory _SendOtp(
      {required final SendOtpReqBodyModel sendOtpReqBodyModel}) = _$SendOtpImpl;

  SendOtpReqBodyModel get sendOtpReqBodyModel;

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOtpImplCopyWith<$Res> {
  factory _$$VerifyOtpImplCopyWith(
          _$VerifyOtpImpl value, $Res Function(_$VerifyOtpImpl) then) =
      __$$VerifyOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VerifyOtpReqBodyModel verifyOtpReqBodyModel});

  $VerifyOtpReqBodyModelCopyWith<$Res> get verifyOtpReqBodyModel;
}

/// @nodoc
class __$$VerifyOtpImplCopyWithImpl<$Res>
    extends _$ResetPassEventCopyWithImpl<$Res, _$VerifyOtpImpl>
    implements _$$VerifyOtpImplCopyWith<$Res> {
  __$$VerifyOtpImplCopyWithImpl(
      _$VerifyOtpImpl _value, $Res Function(_$VerifyOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verifyOtpReqBodyModel = null,
  }) {
    return _then(_$VerifyOtpImpl(
      verifyOtpReqBodyModel: null == verifyOtpReqBodyModel
          ? _value.verifyOtpReqBodyModel
          : verifyOtpReqBodyModel // ignore: cast_nullable_to_non_nullable
              as VerifyOtpReqBodyModel,
    ));
  }

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerifyOtpReqBodyModelCopyWith<$Res> get verifyOtpReqBodyModel {
    return $VerifyOtpReqBodyModelCopyWith<$Res>(_value.verifyOtpReqBodyModel,
        (value) {
      return _then(_value.copyWith(verifyOtpReqBodyModel: value));
    });
  }
}

/// @nodoc

class _$VerifyOtpImpl implements _VerifyOtp {
  const _$VerifyOtpImpl({required this.verifyOtpReqBodyModel});

  @override
  final VerifyOtpReqBodyModel verifyOtpReqBodyModel;

  @override
  String toString() {
    return 'ResetPassEvent.verifyOtp(verifyOtpReqBodyModel: $verifyOtpReqBodyModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpImpl &&
            (identical(other.verifyOtpReqBodyModel, verifyOtpReqBodyModel) ||
                other.verifyOtpReqBodyModel == verifyOtpReqBodyModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verifyOtpReqBodyModel);

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      __$$VerifyOtpImplCopyWithImpl<_$VerifyOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendOtpReqBodyModel sendOtpReqBodyModel) sendOtp,
    required TResult Function(VerifyOtpReqBodyModel verifyOtpReqBodyModel)
        verifyOtp,
    required TResult Function(ResetPassReqBody resetPassReqBody) resetPassword,
  }) {
    return verifyOtp(verifyOtpReqBodyModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendOtpReqBodyModel sendOtpReqBodyModel)? sendOtp,
    TResult? Function(VerifyOtpReqBodyModel verifyOtpReqBodyModel)? verifyOtp,
    TResult? Function(ResetPassReqBody resetPassReqBody)? resetPassword,
  }) {
    return verifyOtp?.call(verifyOtpReqBodyModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendOtpReqBodyModel sendOtpReqBodyModel)? sendOtp,
    TResult Function(VerifyOtpReqBodyModel verifyOtpReqBodyModel)? verifyOtp,
    TResult Function(ResetPassReqBody resetPassReqBody)? resetPassword,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(verifyOtpReqBodyModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyOtp implements ResetPassEvent {
  const factory _VerifyOtp(
          {required final VerifyOtpReqBodyModel verifyOtpReqBodyModel}) =
      _$VerifyOtpImpl;

  VerifyOtpReqBodyModel get verifyOtpReqBodyModel;

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordImplCopyWith<$Res> {
  factory _$$ResetPasswordImplCopyWith(
          _$ResetPasswordImpl value, $Res Function(_$ResetPasswordImpl) then) =
      __$$ResetPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ResetPassReqBody resetPassReqBody});

  $ResetPassReqBodyCopyWith<$Res> get resetPassReqBody;
}

/// @nodoc
class __$$ResetPasswordImplCopyWithImpl<$Res>
    extends _$ResetPassEventCopyWithImpl<$Res, _$ResetPasswordImpl>
    implements _$$ResetPasswordImplCopyWith<$Res> {
  __$$ResetPasswordImplCopyWithImpl(
      _$ResetPasswordImpl _value, $Res Function(_$ResetPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resetPassReqBody = null,
  }) {
    return _then(_$ResetPasswordImpl(
      resetPassReqBody: null == resetPassReqBody
          ? _value.resetPassReqBody
          : resetPassReqBody // ignore: cast_nullable_to_non_nullable
              as ResetPassReqBody,
    ));
  }

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResetPassReqBodyCopyWith<$Res> get resetPassReqBody {
    return $ResetPassReqBodyCopyWith<$Res>(_value.resetPassReqBody, (value) {
      return _then(_value.copyWith(resetPassReqBody: value));
    });
  }
}

/// @nodoc

class _$ResetPasswordImpl implements _ResetPassword {
  const _$ResetPasswordImpl({required this.resetPassReqBody});

  @override
  final ResetPassReqBody resetPassReqBody;

  @override
  String toString() {
    return 'ResetPassEvent.resetPassword(resetPassReqBody: $resetPassReqBody)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordImpl &&
            (identical(other.resetPassReqBody, resetPassReqBody) ||
                other.resetPassReqBody == resetPassReqBody));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resetPassReqBody);

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
      __$$ResetPasswordImplCopyWithImpl<_$ResetPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendOtpReqBodyModel sendOtpReqBodyModel) sendOtp,
    required TResult Function(VerifyOtpReqBodyModel verifyOtpReqBodyModel)
        verifyOtp,
    required TResult Function(ResetPassReqBody resetPassReqBody) resetPassword,
  }) {
    return resetPassword(resetPassReqBody);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendOtpReqBodyModel sendOtpReqBodyModel)? sendOtp,
    TResult? Function(VerifyOtpReqBodyModel verifyOtpReqBodyModel)? verifyOtp,
    TResult? Function(ResetPassReqBody resetPassReqBody)? resetPassword,
  }) {
    return resetPassword?.call(resetPassReqBody);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendOtpReqBodyModel sendOtpReqBodyModel)? sendOtp,
    TResult Function(VerifyOtpReqBodyModel verifyOtpReqBodyModel)? verifyOtp,
    TResult Function(ResetPassReqBody resetPassReqBody)? resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(resetPassReqBody);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetPassword value) resetPassword,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetPassword value)? resetPassword,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class _ResetPassword implements ResetPassEvent {
  const factory _ResetPassword(
      {required final ResetPassReqBody resetPassReqBody}) = _$ResetPasswordImpl;

  ResetPassReqBody get resetPassReqBody;

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
