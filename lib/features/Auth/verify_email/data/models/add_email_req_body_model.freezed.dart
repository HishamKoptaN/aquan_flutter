// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_email_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddEmailReqBodyModel _$AddEmailReqBodyModelFromJson(Map<String, dynamic> json) {
  return _AddEmailReqBody.fromJson(json);
}

/// @nodoc
mixin _$AddEmailReqBodyModel {
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this AddEmailReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddEmailReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddEmailReqBodyModelCopyWith<AddEmailReqBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEmailReqBodyModelCopyWith<$Res> {
  factory $AddEmailReqBodyModelCopyWith(AddEmailReqBodyModel value,
          $Res Function(AddEmailReqBodyModel) then) =
      _$AddEmailReqBodyModelCopyWithImpl<$Res, AddEmailReqBodyModel>;
  @useResult
  $Res call({@JsonKey(name: "email") String? email});
}

/// @nodoc
class _$AddEmailReqBodyModelCopyWithImpl<$Res,
        $Val extends AddEmailReqBodyModel>
    implements $AddEmailReqBodyModelCopyWith<$Res> {
  _$AddEmailReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddEmailReqBodyModel
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
abstract class _$$AddEmailReqBodyImplCopyWith<$Res>
    implements $AddEmailReqBodyModelCopyWith<$Res> {
  factory _$$AddEmailReqBodyImplCopyWith(_$AddEmailReqBodyImpl value,
          $Res Function(_$AddEmailReqBodyImpl) then) =
      __$$AddEmailReqBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "email") String? email});
}

/// @nodoc
class __$$AddEmailReqBodyImplCopyWithImpl<$Res>
    extends _$AddEmailReqBodyModelCopyWithImpl<$Res, _$AddEmailReqBodyImpl>
    implements _$$AddEmailReqBodyImplCopyWith<$Res> {
  __$$AddEmailReqBodyImplCopyWithImpl(
      _$AddEmailReqBodyImpl _value, $Res Function(_$AddEmailReqBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddEmailReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$AddEmailReqBodyImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddEmailReqBodyImpl implements _AddEmailReqBody {
  const _$AddEmailReqBodyImpl({@JsonKey(name: "email") this.email});

  factory _$AddEmailReqBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddEmailReqBodyImplFromJson(json);

  @override
  @JsonKey(name: "email")
  final String? email;

  @override
  String toString() {
    return 'AddEmailReqBodyModel(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddEmailReqBodyImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of AddEmailReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddEmailReqBodyImplCopyWith<_$AddEmailReqBodyImpl> get copyWith =>
      __$$AddEmailReqBodyImplCopyWithImpl<_$AddEmailReqBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddEmailReqBodyImplToJson(
      this,
    );
  }
}

abstract class _AddEmailReqBody implements AddEmailReqBodyModel {
  const factory _AddEmailReqBody(
      {@JsonKey(name: "email") final String? email}) = _$AddEmailReqBodyImpl;

  factory _AddEmailReqBody.fromJson(Map<String, dynamic> json) =
      _$AddEmailReqBodyImpl.fromJson;

  @override
  @JsonKey(name: "email")
  String? get email;

  /// Create a copy of AddEmailReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddEmailReqBodyImplCopyWith<_$AddEmailReqBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
