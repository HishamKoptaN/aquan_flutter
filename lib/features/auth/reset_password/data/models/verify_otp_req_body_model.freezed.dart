// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyOtpReqBodyModel _$VerifyOtpReqBodyModelFromJson(
    Map<String, dynamic> json) {
  return _VerifyOtpReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpReqBodyModel {
  @JsonKey(name: "otp")
  String? get otp => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this VerifyOtpReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyOtpReqBodyModelCopyWith<VerifyOtpReqBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpReqBodyModelCopyWith<$Res> {
  factory $VerifyOtpReqBodyModelCopyWith(VerifyOtpReqBodyModel value,
          $Res Function(VerifyOtpReqBodyModel) then) =
      _$VerifyOtpReqBodyModelCopyWithImpl<$Res, VerifyOtpReqBodyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "otp") String? otp,
      @JsonKey(name: "email") String? email});
}

/// @nodoc
class _$VerifyOtpReqBodyModelCopyWithImpl<$Res,
        $Val extends VerifyOtpReqBodyModel>
    implements $VerifyOtpReqBodyModelCopyWith<$Res> {
  _$VerifyOtpReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyOtpReqBodyModelImplCopyWith<$Res>
    implements $VerifyOtpReqBodyModelCopyWith<$Res> {
  factory _$$VerifyOtpReqBodyModelImplCopyWith(
          _$VerifyOtpReqBodyModelImpl value,
          $Res Function(_$VerifyOtpReqBodyModelImpl) then) =
      __$$VerifyOtpReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "otp") String? otp,
      @JsonKey(name: "email") String? email});
}

/// @nodoc
class __$$VerifyOtpReqBodyModelImplCopyWithImpl<$Res>
    extends _$VerifyOtpReqBodyModelCopyWithImpl<$Res,
        _$VerifyOtpReqBodyModelImpl>
    implements _$$VerifyOtpReqBodyModelImplCopyWith<$Res> {
  __$$VerifyOtpReqBodyModelImplCopyWithImpl(_$VerifyOtpReqBodyModelImpl _value,
      $Res Function(_$VerifyOtpReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = freezed,
    Object? email = freezed,
  }) {
    return _then(_$VerifyOtpReqBodyModelImpl(
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyOtpReqBodyModelImpl implements _VerifyOtpReqBodyModel {
  const _$VerifyOtpReqBodyModelImpl(
      {@JsonKey(name: "otp") this.otp, @JsonKey(name: "email") this.email});

  factory _$VerifyOtpReqBodyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOtpReqBodyModelImplFromJson(json);

  @override
  @JsonKey(name: "otp")
  final String? otp;
  @override
  @JsonKey(name: "email")
  final String? email;

  @override
  String toString() {
    return 'VerifyOtpReqBodyModel(otp: $otp, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpReqBodyModelImpl &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, otp, email);

  /// Create a copy of VerifyOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpReqBodyModelImplCopyWith<_$VerifyOtpReqBodyModelImpl>
      get copyWith => __$$VerifyOtpReqBodyModelImplCopyWithImpl<
          _$VerifyOtpReqBodyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOtpReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _VerifyOtpReqBodyModel implements VerifyOtpReqBodyModel {
  const factory _VerifyOtpReqBodyModel(
          {@JsonKey(name: "otp") final String? otp,
          @JsonKey(name: "email") final String? email}) =
      _$VerifyOtpReqBodyModelImpl;

  factory _VerifyOtpReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$VerifyOtpReqBodyModelImpl.fromJson;

  @override
  @JsonKey(name: "otp")
  String? get otp;
  @override
  @JsonKey(name: "email")
  String? get email;

  /// Create a copy of VerifyOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpReqBodyModelImplCopyWith<_$VerifyOtpReqBodyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
