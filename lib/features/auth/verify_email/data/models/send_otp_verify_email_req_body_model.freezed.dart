// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_verify_email_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendEmailOtpReqBodyModel _$SendEmailOtpReqBodyModelFromJson(
    Map<String, dynamic> json) {
  return _SendEmailOtpReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$SendEmailOtpReqBodyModel {
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this SendEmailOtpReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendEmailOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendEmailOtpReqBodyModelCopyWith<SendEmailOtpReqBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendEmailOtpReqBodyModelCopyWith<$Res> {
  factory $SendEmailOtpReqBodyModelCopyWith(SendEmailOtpReqBodyModel value,
          $Res Function(SendEmailOtpReqBodyModel) then) =
      _$SendEmailOtpReqBodyModelCopyWithImpl<$Res, SendEmailOtpReqBodyModel>;
  @useResult
  $Res call({@JsonKey(name: "email") String? email});
}

/// @nodoc
class _$SendEmailOtpReqBodyModelCopyWithImpl<$Res,
        $Val extends SendEmailOtpReqBodyModel>
    implements $SendEmailOtpReqBodyModelCopyWith<$Res> {
  _$SendEmailOtpReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendEmailOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendEmailOtpReqBodyModelImplCopyWith<$Res>
    implements $SendEmailOtpReqBodyModelCopyWith<$Res> {
  factory _$$SendEmailOtpReqBodyModelImplCopyWith(
          _$SendEmailOtpReqBodyModelImpl value,
          $Res Function(_$SendEmailOtpReqBodyModelImpl) then) =
      __$$SendEmailOtpReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "email") String? email});
}

/// @nodoc
class __$$SendEmailOtpReqBodyModelImplCopyWithImpl<$Res>
    extends _$SendEmailOtpReqBodyModelCopyWithImpl<$Res,
        _$SendEmailOtpReqBodyModelImpl>
    implements _$$SendEmailOtpReqBodyModelImplCopyWith<$Res> {
  __$$SendEmailOtpReqBodyModelImplCopyWithImpl(
      _$SendEmailOtpReqBodyModelImpl _value,
      $Res Function(_$SendEmailOtpReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendEmailOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$SendEmailOtpReqBodyModelImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendEmailOtpReqBodyModelImpl implements _SendEmailOtpReqBodyModel {
  const _$SendEmailOtpReqBodyModelImpl({@JsonKey(name: "email") this.email});

  factory _$SendEmailOtpReqBodyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendEmailOtpReqBodyModelImplFromJson(json);

  @override
  @JsonKey(name: "email")
  final String? email;

  @override
  String toString() {
    return 'SendEmailOtpReqBodyModel(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendEmailOtpReqBodyModelImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of SendEmailOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendEmailOtpReqBodyModelImplCopyWith<_$SendEmailOtpReqBodyModelImpl>
      get copyWith => __$$SendEmailOtpReqBodyModelImplCopyWithImpl<
          _$SendEmailOtpReqBodyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendEmailOtpReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _SendEmailOtpReqBodyModel implements SendEmailOtpReqBodyModel {
  const factory _SendEmailOtpReqBodyModel(
          {@JsonKey(name: "email") final String? email}) =
      _$SendEmailOtpReqBodyModelImpl;

  factory _SendEmailOtpReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$SendEmailOtpReqBodyModelImpl.fromJson;

  @override
  @JsonKey(name: "email")
  String? get email;

  /// Create a copy of SendEmailOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendEmailOtpReqBodyModelImplCopyWith<_$SendEmailOtpReqBodyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
