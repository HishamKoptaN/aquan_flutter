// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_verify_email_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendOtpResModel _$SendOtpResModelFromJson(Map<String, dynamic> json) {
  return _SendOtpResModel.fromJson(json);
}

/// @nodoc
mixin _$SendOtpResModel {
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "email_id")
  int? get emailId => throw _privateConstructorUsedError;

  /// Serializes this SendOtpResModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendOtpResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendOtpResModelCopyWith<SendOtpResModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendOtpResModelCopyWith<$Res> {
  factory $SendOtpResModelCopyWith(
          SendOtpResModel value, $Res Function(SendOtpResModel) then) =
      _$SendOtpResModelCopyWithImpl<$Res, SendOtpResModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "email") String? email,
      @JsonKey(name: "email_id") int? emailId});
}

/// @nodoc
class _$SendOtpResModelCopyWithImpl<$Res, $Val extends SendOtpResModel>
    implements $SendOtpResModelCopyWith<$Res> {
  _$SendOtpResModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendOtpResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? emailId = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendOtpResModelImplCopyWith<$Res>
    implements $SendOtpResModelCopyWith<$Res> {
  factory _$$SendOtpResModelImplCopyWith(_$SendOtpResModelImpl value,
          $Res Function(_$SendOtpResModelImpl) then) =
      __$$SendOtpResModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "email") String? email,
      @JsonKey(name: "email_id") int? emailId});
}

/// @nodoc
class __$$SendOtpResModelImplCopyWithImpl<$Res>
    extends _$SendOtpResModelCopyWithImpl<$Res, _$SendOtpResModelImpl>
    implements _$$SendOtpResModelImplCopyWith<$Res> {
  __$$SendOtpResModelImplCopyWithImpl(
      _$SendOtpResModelImpl _value, $Res Function(_$SendOtpResModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendOtpResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? emailId = freezed,
  }) {
    return _then(_$SendOtpResModelImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendOtpResModelImpl implements _SendOtpResModel {
  const _$SendOtpResModelImpl(
      {@JsonKey(name: "email") this.email,
      @JsonKey(name: "email_id") this.emailId});

  factory _$SendOtpResModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendOtpResModelImplFromJson(json);

  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "email_id")
  final int? emailId;

  @override
  String toString() {
    return 'SendOtpResModel(email: $email, emailId: $emailId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpResModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailId, emailId) || other.emailId == emailId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, emailId);

  /// Create a copy of SendOtpResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpResModelImplCopyWith<_$SendOtpResModelImpl> get copyWith =>
      __$$SendOtpResModelImplCopyWithImpl<_$SendOtpResModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendOtpResModelImplToJson(
      this,
    );
  }
}

abstract class _SendOtpResModel implements SendOtpResModel {
  const factory _SendOtpResModel(
      {@JsonKey(name: "email") final String? email,
      @JsonKey(name: "email_id") final int? emailId}) = _$SendOtpResModelImpl;

  factory _SendOtpResModel.fromJson(Map<String, dynamic> json) =
      _$SendOtpResModelImpl.fromJson;

  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "email_id")
  int? get emailId;

  /// Create a copy of SendOtpResModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOtpResModelImplCopyWith<_$SendOtpResModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
