// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_req_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginReqBody _$LoginReqBodyFromJson(Map<String, dynamic> json) {
  return _LoginReqBody.fromJson(json);
}

/// @nodoc
mixin _$LoginReqBody {
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  String? get password => throw _privateConstructorUsedError;

  /// Serializes this LoginReqBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginReqBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginReqBodyCopyWith<LoginReqBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginReqBodyCopyWith<$Res> {
  factory $LoginReqBodyCopyWith(
          LoginReqBody value, $Res Function(LoginReqBody) then) =
      _$LoginReqBodyCopyWithImpl<$Res, LoginReqBody>;
  @useResult
  $Res call(
      {@JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password});
}

/// @nodoc
class _$LoginReqBodyCopyWithImpl<$Res, $Val extends LoginReqBody>
    implements $LoginReqBodyCopyWith<$Res> {
  _$LoginReqBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginReqBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginReqBodyImplCopyWith<$Res>
    implements $LoginReqBodyCopyWith<$Res> {
  factory _$$LoginReqBodyImplCopyWith(
          _$LoginReqBodyImpl value, $Res Function(_$LoginReqBodyImpl) then) =
      __$$LoginReqBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password});
}

/// @nodoc
class __$$LoginReqBodyImplCopyWithImpl<$Res>
    extends _$LoginReqBodyCopyWithImpl<$Res, _$LoginReqBodyImpl>
    implements _$$LoginReqBodyImplCopyWith<$Res> {
  __$$LoginReqBodyImplCopyWithImpl(
      _$LoginReqBodyImpl _value, $Res Function(_$LoginReqBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginReqBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$LoginReqBodyImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginReqBodyImpl implements _LoginReqBody {
  const _$LoginReqBodyImpl(
      {@JsonKey(name: "email") this.email,
      @JsonKey(name: "password") this.password});

  factory _$LoginReqBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginReqBodyImplFromJson(json);

  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "password")
  final String? password;

  @override
  String toString() {
    return 'LoginReqBody(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginReqBodyImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of LoginReqBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginReqBodyImplCopyWith<_$LoginReqBodyImpl> get copyWith =>
      __$$LoginReqBodyImplCopyWithImpl<_$LoginReqBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginReqBodyImplToJson(
      this,
    );
  }
}

abstract class _LoginReqBody implements LoginReqBody {
  const factory _LoginReqBody(
      {@JsonKey(name: "email") final String? email,
      @JsonKey(name: "password") final String? password}) = _$LoginReqBodyImpl;

  factory _LoginReqBody.fromJson(Map<String, dynamic> json) =
      _$LoginReqBodyImpl.fromJson;

  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "password")
  String? get password;

  /// Create a copy of LoginReqBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginReqBodyImplCopyWith<_$LoginReqBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
