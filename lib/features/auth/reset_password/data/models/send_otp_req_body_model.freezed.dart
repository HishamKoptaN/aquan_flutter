// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendOtpReqBodyModel _$SendOtpReqBodyModelFromJson(Map<String, dynamic> json) {
  return _SendOtpReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$SendOtpReqBodyModel {
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this SendOtpReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendOtpReqBodyModelCopyWith<SendOtpReqBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendOtpReqBodyModelCopyWith<$Res> {
  factory $SendOtpReqBodyModelCopyWith(
          SendOtpReqBodyModel value, $Res Function(SendOtpReqBodyModel) then) =
      _$SendOtpReqBodyModelCopyWithImpl<$Res, SendOtpReqBodyModel>;
  @useResult
  $Res call({@JsonKey(name: "email") String? email});
}

/// @nodoc
class _$SendOtpReqBodyModelCopyWithImpl<$Res, $Val extends SendOtpReqBodyModel>
    implements $SendOtpReqBodyModelCopyWith<$Res> {
  _$SendOtpReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendOtpReqBodyModel
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
abstract class _$$SendOtpReqBodyModelImplCopyWith<$Res>
    implements $SendOtpReqBodyModelCopyWith<$Res> {
  factory _$$SendOtpReqBodyModelImplCopyWith(_$SendOtpReqBodyModelImpl value,
          $Res Function(_$SendOtpReqBodyModelImpl) then) =
      __$$SendOtpReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "email") String? email});
}

/// @nodoc
class __$$SendOtpReqBodyModelImplCopyWithImpl<$Res>
    extends _$SendOtpReqBodyModelCopyWithImpl<$Res, _$SendOtpReqBodyModelImpl>
    implements _$$SendOtpReqBodyModelImplCopyWith<$Res> {
  __$$SendOtpReqBodyModelImplCopyWithImpl(_$SendOtpReqBodyModelImpl _value,
      $Res Function(_$SendOtpReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$SendOtpReqBodyModelImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendOtpReqBodyModelImpl implements _SendOtpReqBodyModel {
  const _$SendOtpReqBodyModelImpl({@JsonKey(name: "email") this.email});

  factory _$SendOtpReqBodyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendOtpReqBodyModelImplFromJson(json);

  @override
  @JsonKey(name: "email")
  final String? email;

  @override
  String toString() {
    return 'SendOtpReqBodyModel(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpReqBodyModelImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of SendOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpReqBodyModelImplCopyWith<_$SendOtpReqBodyModelImpl> get copyWith =>
      __$$SendOtpReqBodyModelImplCopyWithImpl<_$SendOtpReqBodyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendOtpReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _SendOtpReqBodyModel implements SendOtpReqBodyModel {
  const factory _SendOtpReqBodyModel(
          {@JsonKey(name: "email") final String? email}) =
      _$SendOtpReqBodyModelImpl;

  factory _SendOtpReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$SendOtpReqBodyModelImpl.fromJson;

  @override
  @JsonKey(name: "email")
  String? get email;

  /// Create a copy of SendOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOtpReqBodyModelImplCopyWith<_$SendOtpReqBodyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
