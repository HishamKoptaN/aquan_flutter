// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_pass_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResetPassReqBodyModel _$ResetPassReqBodyModelFromJson(
    Map<String, dynamic> json) {
  return _ResetPassReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$ResetPassReqBodyModel {
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this ResetPassReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResetPassReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPassReqBodyModelCopyWith<ResetPassReqBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPassReqBodyModelCopyWith<$Res> {
  factory $ResetPassReqBodyModelCopyWith(ResetPassReqBodyModel value,
          $Res Function(ResetPassReqBodyModel) then) =
      _$ResetPassReqBodyModelCopyWithImpl<$Res, ResetPassReqBodyModel>;
  @useResult
  $Res call({@JsonKey(name: "email") String? email});
}

/// @nodoc
class _$ResetPassReqBodyModelCopyWithImpl<$Res,
        $Val extends ResetPassReqBodyModel>
    implements $ResetPassReqBodyModelCopyWith<$Res> {
  _$ResetPassReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPassReqBodyModel
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
abstract class _$$ResetPassReqBodyModelImplCopyWith<$Res>
    implements $ResetPassReqBodyModelCopyWith<$Res> {
  factory _$$ResetPassReqBodyModelImplCopyWith(
          _$ResetPassReqBodyModelImpl value,
          $Res Function(_$ResetPassReqBodyModelImpl) then) =
      __$$ResetPassReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "email") String? email});
}

/// @nodoc
class __$$ResetPassReqBodyModelImplCopyWithImpl<$Res>
    extends _$ResetPassReqBodyModelCopyWithImpl<$Res,
        _$ResetPassReqBodyModelImpl>
    implements _$$ResetPassReqBodyModelImplCopyWith<$Res> {
  __$$ResetPassReqBodyModelImplCopyWithImpl(_$ResetPassReqBodyModelImpl _value,
      $Res Function(_$ResetPassReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResetPassReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$ResetPassReqBodyModelImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPassReqBodyModelImpl implements _ResetPassReqBodyModel {
  const _$ResetPassReqBodyModelImpl({@JsonKey(name: "email") this.email});

  factory _$ResetPassReqBodyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPassReqBodyModelImplFromJson(json);

  @override
  @JsonKey(name: "email")
  final String? email;

  @override
  String toString() {
    return 'ResetPassReqBodyModel(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPassReqBodyModelImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ResetPassReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPassReqBodyModelImplCopyWith<_$ResetPassReqBodyModelImpl>
      get copyWith => __$$ResetPassReqBodyModelImplCopyWithImpl<
          _$ResetPassReqBodyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPassReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _ResetPassReqBodyModel implements ResetPassReqBodyModel {
  const factory _ResetPassReqBodyModel(
          {@JsonKey(name: "email") final String? email}) =
      _$ResetPassReqBodyModelImpl;

  factory _ResetPassReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$ResetPassReqBodyModelImpl.fromJson;

  @override
  @JsonKey(name: "email")
  String? get email;

  /// Create a copy of ResetPassReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPassReqBodyModelImplCopyWith<_$ResetPassReqBodyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
