// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_otp_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyEmailOtpReqBodyModel _$VerifyEmailOtpReqBodyModelFromJson(
    Map<String, dynamic> json) {
  return _VerifyEmailOtpReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$VerifyEmailOtpReqBodyModel {
  @JsonKey(name: "otp")
  String? get otp => throw _privateConstructorUsedError;
  @JsonKey(name: "email_id")
  int? get emailId => throw _privateConstructorUsedError;

  /// Serializes this VerifyEmailOtpReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyEmailOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyEmailOtpReqBodyModelCopyWith<VerifyEmailOtpReqBodyModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyEmailOtpReqBodyModelCopyWith<$Res> {
  factory $VerifyEmailOtpReqBodyModelCopyWith(VerifyEmailOtpReqBodyModel value,
          $Res Function(VerifyEmailOtpReqBodyModel) then) =
      _$VerifyEmailOtpReqBodyModelCopyWithImpl<$Res,
          VerifyEmailOtpReqBodyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "otp") String? otp,
      @JsonKey(name: "email_id") int? emailId});
}

/// @nodoc
class _$VerifyEmailOtpReqBodyModelCopyWithImpl<$Res,
        $Val extends VerifyEmailOtpReqBodyModel>
    implements $VerifyEmailOtpReqBodyModelCopyWith<$Res> {
  _$VerifyEmailOtpReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyEmailOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
    Object? emailId = freezed,
  }) {
    return _then(_value.copyWith(
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyEmailOtpReqBodyModelImplCopyWith<$Res>
    implements $VerifyEmailOtpReqBodyModelCopyWith<$Res> {
  factory _$$VerifyEmailOtpReqBodyModelImplCopyWith(
          _$VerifyEmailOtpReqBodyModelImpl value,
          $Res Function(_$VerifyEmailOtpReqBodyModelImpl) then) =
      __$$VerifyEmailOtpReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "otp") String? otp,
      @JsonKey(name: "email_id") int? emailId});
}

/// @nodoc
class __$$VerifyEmailOtpReqBodyModelImplCopyWithImpl<$Res>
    extends _$VerifyEmailOtpReqBodyModelCopyWithImpl<$Res,
        _$VerifyEmailOtpReqBodyModelImpl>
    implements _$$VerifyEmailOtpReqBodyModelImplCopyWith<$Res> {
  __$$VerifyEmailOtpReqBodyModelImplCopyWithImpl(
      _$VerifyEmailOtpReqBodyModelImpl _value,
      $Res Function(_$VerifyEmailOtpReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyEmailOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
    Object? emailId = freezed,
  }) {
    return _then(_$VerifyEmailOtpReqBodyModelImpl(
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
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
class _$VerifyEmailOtpReqBodyModelImpl implements _VerifyEmailOtpReqBodyModel {
  const _$VerifyEmailOtpReqBodyModelImpl(
      {@JsonKey(name: "otp") this.otp,
      @JsonKey(name: "email_id") this.emailId});

  factory _$VerifyEmailOtpReqBodyModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VerifyEmailOtpReqBodyModelImplFromJson(json);

  @override
  @JsonKey(name: "otp")
  final String? otp;
  @override
  @JsonKey(name: "email_id")
  final int? emailId;

  @override
  String toString() {
    return 'VerifyEmailOtpReqBodyModel(otp: $otp, emailId: $emailId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyEmailOtpReqBodyModelImpl &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.emailId, emailId) || other.emailId == emailId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, otp, emailId);

  /// Create a copy of VerifyEmailOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyEmailOtpReqBodyModelImplCopyWith<_$VerifyEmailOtpReqBodyModelImpl>
      get copyWith => __$$VerifyEmailOtpReqBodyModelImplCopyWithImpl<
          _$VerifyEmailOtpReqBodyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyEmailOtpReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _VerifyEmailOtpReqBodyModel
    implements VerifyEmailOtpReqBodyModel {
  const factory _VerifyEmailOtpReqBodyModel(
          {@JsonKey(name: "otp") final String? otp,
          @JsonKey(name: "email_id") final int? emailId}) =
      _$VerifyEmailOtpReqBodyModelImpl;

  factory _VerifyEmailOtpReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$VerifyEmailOtpReqBodyModelImpl.fromJson;

  @override
  @JsonKey(name: "otp")
  String? get otp;
  @override
  @JsonKey(name: "email_id")
  int? get emailId;

  /// Create a copy of VerifyEmailOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyEmailOtpReqBodyModelImplCopyWith<_$VerifyEmailOtpReqBodyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
