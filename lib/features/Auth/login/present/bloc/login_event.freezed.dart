// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {
  LoginReqBody get loginReqBody => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginReqBody loginReqBody) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginReqBody loginReqBody)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginReqBody loginReqBody)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginEventCopyWith<LoginEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
  @useResult
  $Res call({LoginReqBody loginReqBody});

  $LoginReqBodyCopyWith<$Res> get loginReqBody;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginReqBody = null,
  }) {
    return _then(_value.copyWith(
      loginReqBody: null == loginReqBody
          ? _value.loginReqBody
          : loginReqBody // ignore: cast_nullable_to_non_nullable
              as LoginReqBody,
    ) as $Val);
  }

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginReqBodyCopyWith<$Res> get loginReqBody {
    return $LoginReqBodyCopyWith<$Res>(_value.loginReqBody, (value) {
      return _then(_value.copyWith(loginReqBody: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoginReqBody loginReqBody});

  @override
  $LoginReqBodyCopyWith<$Res> get loginReqBody;
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginReqBody = null,
  }) {
    return _then(_$LoginImpl(
      loginReqBody: null == loginReqBody
          ? _value.loginReqBody
          : loginReqBody // ignore: cast_nullable_to_non_nullable
              as LoginReqBody,
    ));
  }
}

/// @nodoc

class _$LoginImpl implements _Login {
  const _$LoginImpl({required this.loginReqBody});

  @override
  final LoginReqBody loginReqBody;

  @override
  String toString() {
    return 'LoginEvent.login(loginReqBody: $loginReqBody)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.loginReqBody, loginReqBody) ||
                other.loginReqBody == loginReqBody));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginReqBody);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginReqBody loginReqBody) login,
  }) {
    return login(loginReqBody);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginReqBody loginReqBody)? login,
  }) {
    return login?.call(loginReqBody);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginReqBody loginReqBody)? login,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(loginReqBody);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements LoginEvent {
  const factory _Login({required final LoginReqBody loginReqBody}) =
      _$LoginImpl;

  @override
  LoginReqBody get loginReqBody;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
