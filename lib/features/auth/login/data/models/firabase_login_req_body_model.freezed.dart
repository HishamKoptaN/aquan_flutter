// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firabase_login_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FirabaseLoginReqBodyModel _$FirabaseLoginReqBodyModelFromJson(
    Map<String, dynamic> json) {
  return _FirabaseLoginReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$FirabaseLoginReqBodyModel {
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  String? get password => throw _privateConstructorUsedError;

  /// Serializes this FirabaseLoginReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FirabaseLoginReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FirabaseLoginReqBodyModelCopyWith<FirabaseLoginReqBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirabaseLoginReqBodyModelCopyWith<$Res> {
  factory $FirabaseLoginReqBodyModelCopyWith(FirabaseLoginReqBodyModel value,
          $Res Function(FirabaseLoginReqBodyModel) then) =
      _$FirabaseLoginReqBodyModelCopyWithImpl<$Res, FirabaseLoginReqBodyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password});
}

/// @nodoc
class _$FirabaseLoginReqBodyModelCopyWithImpl<$Res,
        $Val extends FirabaseLoginReqBodyModel>
    implements $FirabaseLoginReqBodyModelCopyWith<$Res> {
  _$FirabaseLoginReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FirabaseLoginReqBodyModel
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
abstract class _$$FirabaseLoginReqBodyModelImplCopyWith<$Res>
    implements $FirabaseLoginReqBodyModelCopyWith<$Res> {
  factory _$$FirabaseLoginReqBodyModelImplCopyWith(
          _$FirabaseLoginReqBodyModelImpl value,
          $Res Function(_$FirabaseLoginReqBodyModelImpl) then) =
      __$$FirabaseLoginReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password});
}

/// @nodoc
class __$$FirabaseLoginReqBodyModelImplCopyWithImpl<$Res>
    extends _$FirabaseLoginReqBodyModelCopyWithImpl<$Res,
        _$FirabaseLoginReqBodyModelImpl>
    implements _$$FirabaseLoginReqBodyModelImplCopyWith<$Res> {
  __$$FirabaseLoginReqBodyModelImplCopyWithImpl(
      _$FirabaseLoginReqBodyModelImpl _value,
      $Res Function(_$FirabaseLoginReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FirabaseLoginReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$FirabaseLoginReqBodyModelImpl(
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
class _$FirabaseLoginReqBodyModelImpl implements _FirabaseLoginReqBodyModel {
  const _$FirabaseLoginReqBodyModelImpl(
      {@JsonKey(name: "email") this.email,
      @JsonKey(name: "password") this.password});

  factory _$FirabaseLoginReqBodyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirabaseLoginReqBodyModelImplFromJson(json);

  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "password")
  final String? password;

  @override
  String toString() {
    return 'FirabaseLoginReqBodyModel(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirabaseLoginReqBodyModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of FirabaseLoginReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirabaseLoginReqBodyModelImplCopyWith<_$FirabaseLoginReqBodyModelImpl>
      get copyWith => __$$FirabaseLoginReqBodyModelImplCopyWithImpl<
          _$FirabaseLoginReqBodyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirabaseLoginReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _FirabaseLoginReqBodyModel implements FirabaseLoginReqBodyModel {
  const factory _FirabaseLoginReqBodyModel(
          {@JsonKey(name: "email") final String? email,
          @JsonKey(name: "password") final String? password}) =
      _$FirabaseLoginReqBodyModelImpl;

  factory _FirabaseLoginReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$FirabaseLoginReqBodyModelImpl.fromJson;

  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "password")
  String? get password;

  /// Create a copy of FirabaseLoginReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirabaseLoginReqBodyModelImplCopyWith<_$FirabaseLoginReqBodyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
