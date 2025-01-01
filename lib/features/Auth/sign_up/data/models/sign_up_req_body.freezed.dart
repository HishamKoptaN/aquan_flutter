// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_req_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignUpReqBody _$SignUpReqBodyFromJson(Map<String, dynamic> json) {
  return _SignUpReqBody.fromJson(json);
}

/// @nodoc
mixin _$SignUpReqBody {
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: "password_confirmation")
  String? get passwordConfirmation => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "country_code")
  String? get countryCode => throw _privateConstructorUsedError;

  /// Serializes this SignUpReqBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignUpReqBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpReqBodyCopyWith<SignUpReqBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpReqBodyCopyWith<$Res> {
  factory $SignUpReqBodyCopyWith(
          SignUpReqBody value, $Res Function(SignUpReqBody) then) =
      _$SignUpReqBodyCopyWithImpl<$Res, SignUpReqBody>;
  @useResult
  $Res call(
      {@JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password,
      @JsonKey(name: "password_confirmation") String? passwordConfirmation,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "country_code") String? countryCode});
}

/// @nodoc
class _$SignUpReqBodyCopyWithImpl<$Res, $Val extends SignUpReqBody>
    implements $SignUpReqBodyCopyWith<$Res> {
  _$SignUpReqBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpReqBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordConfirmation: freezed == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpReqBodyImplCopyWith<$Res>
    implements $SignUpReqBodyCopyWith<$Res> {
  factory _$$SignUpReqBodyImplCopyWith(
          _$SignUpReqBodyImpl value, $Res Function(_$SignUpReqBodyImpl) then) =
      __$$SignUpReqBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password,
      @JsonKey(name: "password_confirmation") String? passwordConfirmation,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "country_code") String? countryCode});
}

/// @nodoc
class __$$SignUpReqBodyImplCopyWithImpl<$Res>
    extends _$SignUpReqBodyCopyWithImpl<$Res, _$SignUpReqBodyImpl>
    implements _$$SignUpReqBodyImplCopyWith<$Res> {
  __$$SignUpReqBodyImplCopyWithImpl(
      _$SignUpReqBodyImpl _value, $Res Function(_$SignUpReqBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpReqBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_$SignUpReqBodyImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordConfirmation: freezed == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpReqBodyImpl implements _SignUpReqBody {
  const _$SignUpReqBodyImpl(
      {@JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "password") this.password,
      @JsonKey(name: "password_confirmation") this.passwordConfirmation,
      @JsonKey(name: "address") this.address,
      @JsonKey(name: "phone") this.phone,
      @JsonKey(name: "country_code") this.countryCode});

  factory _$SignUpReqBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpReqBodyImplFromJson(json);

  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "password")
  final String? password;
  @override
  @JsonKey(name: "password_confirmation")
  final String? passwordConfirmation;
  @override
  @JsonKey(name: "address")
  final String? address;
  @override
  @JsonKey(name: "phone")
  final String? phone;
  @override
  @JsonKey(name: "country_code")
  final String? countryCode;

  @override
  String toString() {
    return 'SignUpReqBody(firstName: $firstName, lastName: $lastName, email: $email, password: $password, passwordConfirmation: $passwordConfirmation, address: $address, phone: $phone, countryCode: $countryCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpReqBodyImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, email,
      password, passwordConfirmation, address, phone, countryCode);

  /// Create a copy of SignUpReqBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpReqBodyImplCopyWith<_$SignUpReqBodyImpl> get copyWith =>
      __$$SignUpReqBodyImplCopyWithImpl<_$SignUpReqBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpReqBodyImplToJson(
      this,
    );
  }
}

abstract class _SignUpReqBody implements SignUpReqBody {
  const factory _SignUpReqBody(
          {@JsonKey(name: "first_name") final String? firstName,
          @JsonKey(name: "last_name") final String? lastName,
          @JsonKey(name: "email") final String? email,
          @JsonKey(name: "password") final String? password,
          @JsonKey(name: "password_confirmation")
          final String? passwordConfirmation,
          @JsonKey(name: "address") final String? address,
          @JsonKey(name: "phone") final String? phone,
          @JsonKey(name: "country_code") final String? countryCode}) =
      _$SignUpReqBodyImpl;

  factory _SignUpReqBody.fromJson(Map<String, dynamic> json) =
      _$SignUpReqBodyImpl.fromJson;

  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "password")
  String? get password;
  @override
  @JsonKey(name: "password_confirmation")
  String? get passwordConfirmation;
  @override
  @JsonKey(name: "address")
  String? get address;
  @override
  @JsonKey(name: "phone")
  String? get phone;
  @override
  @JsonKey(name: "country_code")
  String? get countryCode;

  /// Create a copy of SignUpReqBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpReqBodyImplCopyWith<_$SignUpReqBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
