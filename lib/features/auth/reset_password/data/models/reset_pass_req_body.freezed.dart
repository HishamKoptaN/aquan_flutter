// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_pass_req_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResetPassReqBody _$ResetPassReqBodyFromJson(Map<String, dynamic> json) {
  return _ResetPassReqBody.fromJson(json);
}

/// @nodoc
mixin _$ResetPassReqBody {
  @JsonKey(name: "otp")
  String? get otp => throw _privateConstructorUsedError;
  @JsonKey(name: "new_password")
  String? get newPassword => throw _privateConstructorUsedError;
  @JsonKey(name: "new_password_confirmation")
  String? get newPasswordConfirmation => throw _privateConstructorUsedError;

  /// Serializes this ResetPassReqBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResetPassReqBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPassReqBodyCopyWith<ResetPassReqBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPassReqBodyCopyWith<$Res> {
  factory $ResetPassReqBodyCopyWith(
          ResetPassReqBody value, $Res Function(ResetPassReqBody) then) =
      _$ResetPassReqBodyCopyWithImpl<$Res, ResetPassReqBody>;
  @useResult
  $Res call(
      {@JsonKey(name: "otp") String? otp,
      @JsonKey(name: "new_password") String? newPassword,
      @JsonKey(name: "new_password_confirmation")
      String? newPasswordConfirmation});
}

/// @nodoc
class _$ResetPassReqBodyCopyWithImpl<$Res, $Val extends ResetPassReqBody>
    implements $ResetPassReqBodyCopyWith<$Res> {
  _$ResetPassReqBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPassReqBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
    Object? newPassword = freezed,
    Object? newPasswordConfirmation = freezed,
  }) {
    return _then(_value.copyWith(
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      newPasswordConfirmation: freezed == newPasswordConfirmation
          ? _value.newPasswordConfirmation
          : newPasswordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPassReqBodyImplCopyWith<$Res>
    implements $ResetPassReqBodyCopyWith<$Res> {
  factory _$$ResetPassReqBodyImplCopyWith(_$ResetPassReqBodyImpl value,
          $Res Function(_$ResetPassReqBodyImpl) then) =
      __$$ResetPassReqBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "otp") String? otp,
      @JsonKey(name: "new_password") String? newPassword,
      @JsonKey(name: "new_password_confirmation")
      String? newPasswordConfirmation});
}

/// @nodoc
class __$$ResetPassReqBodyImplCopyWithImpl<$Res>
    extends _$ResetPassReqBodyCopyWithImpl<$Res, _$ResetPassReqBodyImpl>
    implements _$$ResetPassReqBodyImplCopyWith<$Res> {
  __$$ResetPassReqBodyImplCopyWithImpl(_$ResetPassReqBodyImpl _value,
      $Res Function(_$ResetPassReqBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResetPassReqBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
    Object? newPassword = freezed,
    Object? newPasswordConfirmation = freezed,
  }) {
    return _then(_$ResetPassReqBodyImpl(
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      newPasswordConfirmation: freezed == newPasswordConfirmation
          ? _value.newPasswordConfirmation
          : newPasswordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPassReqBodyImpl implements _ResetPassReqBody {
  const _$ResetPassReqBodyImpl(
      {@JsonKey(name: "otp") this.otp,
      @JsonKey(name: "new_password") this.newPassword,
      @JsonKey(name: "new_password_confirmation")
      this.newPasswordConfirmation});

  factory _$ResetPassReqBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPassReqBodyImplFromJson(json);

  @override
  @JsonKey(name: "otp")
  final String? otp;
  @override
  @JsonKey(name: "new_password")
  final String? newPassword;
  @override
  @JsonKey(name: "new_password_confirmation")
  final String? newPasswordConfirmation;

  @override
  String toString() {
    return 'ResetPassReqBody(otp: $otp, newPassword: $newPassword, newPasswordConfirmation: $newPasswordConfirmation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPassReqBodyImpl &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(
                    other.newPasswordConfirmation, newPasswordConfirmation) ||
                other.newPasswordConfirmation == newPasswordConfirmation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, otp, newPassword, newPasswordConfirmation);

  /// Create a copy of ResetPassReqBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPassReqBodyImplCopyWith<_$ResetPassReqBodyImpl> get copyWith =>
      __$$ResetPassReqBodyImplCopyWithImpl<_$ResetPassReqBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPassReqBodyImplToJson(
      this,
    );
  }
}

abstract class _ResetPassReqBody implements ResetPassReqBody {
  const factory _ResetPassReqBody(
      {@JsonKey(name: "otp") final String? otp,
      @JsonKey(name: "new_password") final String? newPassword,
      @JsonKey(name: "new_password_confirmation")
      final String? newPasswordConfirmation}) = _$ResetPassReqBodyImpl;

  factory _ResetPassReqBody.fromJson(Map<String, dynamic> json) =
      _$ResetPassReqBodyImpl.fromJson;

  @override
  @JsonKey(name: "otp")
  String? get otp;
  @override
  @JsonKey(name: "new_password")
  String? get newPassword;
  @override
  @JsonKey(name: "new_password_confirmation")
  String? get newPasswordConfirmation;

  /// Create a copy of ResetPassReqBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPassReqBodyImplCopyWith<_$ResetPassReqBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
