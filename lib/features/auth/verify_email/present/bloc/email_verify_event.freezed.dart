// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_verify_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerifyEmailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendEmailOtp,
    required TResult Function(
            VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel)
        verifyEmailOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendEmailOtp,
    TResult? Function(VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel)?
        verifyEmailOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendEmailOtp,
    TResult Function(VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel)?
        verifyEmailOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendEmailOtp value) sendEmailOtp,
    required TResult Function(_VerifyEmailOtp value) verifyEmailOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendEmailOtp value)? sendEmailOtp,
    TResult? Function(_VerifyEmailOtp value)? verifyEmailOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendEmailOtp value)? sendEmailOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyEmailEventCopyWith<$Res> {
  factory $VerifyEmailEventCopyWith(
          VerifyEmailEvent value, $Res Function(VerifyEmailEvent) then) =
      _$VerifyEmailEventCopyWithImpl<$Res, VerifyEmailEvent>;
}

/// @nodoc
class _$VerifyEmailEventCopyWithImpl<$Res, $Val extends VerifyEmailEvent>
    implements $VerifyEmailEventCopyWith<$Res> {
  _$VerifyEmailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyEmailEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SendEmailOtpImplCopyWith<$Res> {
  factory _$$SendEmailOtpImplCopyWith(
          _$SendEmailOtpImpl value, $Res Function(_$SendEmailOtpImpl) then) =
      __$$SendEmailOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendEmailOtpImplCopyWithImpl<$Res>
    extends _$VerifyEmailEventCopyWithImpl<$Res, _$SendEmailOtpImpl>
    implements _$$SendEmailOtpImplCopyWith<$Res> {
  __$$SendEmailOtpImplCopyWithImpl(
      _$SendEmailOtpImpl _value, $Res Function(_$SendEmailOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyEmailEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendEmailOtpImpl implements _SendEmailOtp {
  const _$SendEmailOtpImpl();

  @override
  String toString() {
    return 'VerifyEmailEvent.sendEmailOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendEmailOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendEmailOtp,
    required TResult Function(
            VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel)
        verifyEmailOtp,
  }) {
    return sendEmailOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendEmailOtp,
    TResult? Function(VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel)?
        verifyEmailOtp,
  }) {
    return sendEmailOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendEmailOtp,
    TResult Function(VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel)?
        verifyEmailOtp,
    required TResult orElse(),
  }) {
    if (sendEmailOtp != null) {
      return sendEmailOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendEmailOtp value) sendEmailOtp,
    required TResult Function(_VerifyEmailOtp value) verifyEmailOtp,
  }) {
    return sendEmailOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendEmailOtp value)? sendEmailOtp,
    TResult? Function(_VerifyEmailOtp value)? verifyEmailOtp,
  }) {
    return sendEmailOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendEmailOtp value)? sendEmailOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    required TResult orElse(),
  }) {
    if (sendEmailOtp != null) {
      return sendEmailOtp(this);
    }
    return orElse();
  }
}

abstract class _SendEmailOtp implements VerifyEmailEvent {
  const factory _SendEmailOtp() = _$SendEmailOtpImpl;
}

/// @nodoc
abstract class _$$VerifyEmailOtpImplCopyWith<$Res> {
  factory _$$VerifyEmailOtpImplCopyWith(_$VerifyEmailOtpImpl value,
          $Res Function(_$VerifyEmailOtpImpl) then) =
      __$$VerifyEmailOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel});

  $VerifyEmailOtpReqBodyModelCopyWith<$Res> get verifyEmailOtpReqBodyModel;
}

/// @nodoc
class __$$VerifyEmailOtpImplCopyWithImpl<$Res>
    extends _$VerifyEmailEventCopyWithImpl<$Res, _$VerifyEmailOtpImpl>
    implements _$$VerifyEmailOtpImplCopyWith<$Res> {
  __$$VerifyEmailOtpImplCopyWithImpl(
      _$VerifyEmailOtpImpl _value, $Res Function(_$VerifyEmailOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyEmailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verifyEmailOtpReqBodyModel = null,
  }) {
    return _then(_$VerifyEmailOtpImpl(
      verifyEmailOtpReqBodyModel: null == verifyEmailOtpReqBodyModel
          ? _value.verifyEmailOtpReqBodyModel
          : verifyEmailOtpReqBodyModel // ignore: cast_nullable_to_non_nullable
              as VerifyEmailOtpReqBodyModel,
    ));
  }

  /// Create a copy of VerifyEmailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerifyEmailOtpReqBodyModelCopyWith<$Res> get verifyEmailOtpReqBodyModel {
    return $VerifyEmailOtpReqBodyModelCopyWith<$Res>(
        _value.verifyEmailOtpReqBodyModel, (value) {
      return _then(_value.copyWith(verifyEmailOtpReqBodyModel: value));
    });
  }
}

/// @nodoc

class _$VerifyEmailOtpImpl implements _VerifyEmailOtp {
  const _$VerifyEmailOtpImpl({required this.verifyEmailOtpReqBodyModel});

  @override
  final VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel;

  @override
  String toString() {
    return 'VerifyEmailEvent.verifyEmailOtp(verifyEmailOtpReqBodyModel: $verifyEmailOtpReqBodyModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyEmailOtpImpl &&
            (identical(other.verifyEmailOtpReqBodyModel,
                    verifyEmailOtpReqBodyModel) ||
                other.verifyEmailOtpReqBodyModel ==
                    verifyEmailOtpReqBodyModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verifyEmailOtpReqBodyModel);

  /// Create a copy of VerifyEmailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyEmailOtpImplCopyWith<_$VerifyEmailOtpImpl> get copyWith =>
      __$$VerifyEmailOtpImplCopyWithImpl<_$VerifyEmailOtpImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendEmailOtp,
    required TResult Function(
            VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel)
        verifyEmailOtp,
  }) {
    return verifyEmailOtp(verifyEmailOtpReqBodyModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendEmailOtp,
    TResult? Function(VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel)?
        verifyEmailOtp,
  }) {
    return verifyEmailOtp?.call(verifyEmailOtpReqBodyModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendEmailOtp,
    TResult Function(VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel)?
        verifyEmailOtp,
    required TResult orElse(),
  }) {
    if (verifyEmailOtp != null) {
      return verifyEmailOtp(verifyEmailOtpReqBodyModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendEmailOtp value) sendEmailOtp,
    required TResult Function(_VerifyEmailOtp value) verifyEmailOtp,
  }) {
    return verifyEmailOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendEmailOtp value)? sendEmailOtp,
    TResult? Function(_VerifyEmailOtp value)? verifyEmailOtp,
  }) {
    return verifyEmailOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendEmailOtp value)? sendEmailOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    required TResult orElse(),
  }) {
    if (verifyEmailOtp != null) {
      return verifyEmailOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyEmailOtp implements VerifyEmailEvent {
  const factory _VerifyEmailOtp(
      {required final VerifyEmailOtpReqBodyModel
          verifyEmailOtpReqBodyModel}) = _$VerifyEmailOtpImpl;

  VerifyEmailOtpReqBodyModel get verifyEmailOtpReqBodyModel;

  /// Create a copy of VerifyEmailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyEmailOtpImplCopyWith<_$VerifyEmailOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
