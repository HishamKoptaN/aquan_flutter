// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_id_token_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthIdTokenReqBodyModel _$AuthIdTokenReqBodyModelFromJson(
    Map<String, dynamic> json) {
  return _AuthIdTokenReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$AuthIdTokenReqBodyModel {
  @JsonKey(name: "id_token")
  String? get idToken => throw _privateConstructorUsedError;

  /// Serializes this AuthIdTokenReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthIdTokenReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthIdTokenReqBodyModelCopyWith<AuthIdTokenReqBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthIdTokenReqBodyModelCopyWith<$Res> {
  factory $AuthIdTokenReqBodyModelCopyWith(AuthIdTokenReqBodyModel value,
          $Res Function(AuthIdTokenReqBodyModel) then) =
      _$AuthIdTokenReqBodyModelCopyWithImpl<$Res, AuthIdTokenReqBodyModel>;
  @useResult
  $Res call({@JsonKey(name: "id_token") String? idToken});
}

/// @nodoc
class _$AuthIdTokenReqBodyModelCopyWithImpl<$Res,
        $Val extends AuthIdTokenReqBodyModel>
    implements $AuthIdTokenReqBodyModelCopyWith<$Res> {
  _$AuthIdTokenReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthIdTokenReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = freezed,
  }) {
    return _then(_value.copyWith(
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthIdTokenReqBodyModelImplCopyWith<$Res>
    implements $AuthIdTokenReqBodyModelCopyWith<$Res> {
  factory _$$AuthIdTokenReqBodyModelImplCopyWith(
          _$AuthIdTokenReqBodyModelImpl value,
          $Res Function(_$AuthIdTokenReqBodyModelImpl) then) =
      __$$AuthIdTokenReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "id_token") String? idToken});
}

/// @nodoc
class __$$AuthIdTokenReqBodyModelImplCopyWithImpl<$Res>
    extends _$AuthIdTokenReqBodyModelCopyWithImpl<$Res,
        _$AuthIdTokenReqBodyModelImpl>
    implements _$$AuthIdTokenReqBodyModelImplCopyWith<$Res> {
  __$$AuthIdTokenReqBodyModelImplCopyWithImpl(
      _$AuthIdTokenReqBodyModelImpl _value,
      $Res Function(_$AuthIdTokenReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthIdTokenReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = freezed,
  }) {
    return _then(_$AuthIdTokenReqBodyModelImpl(
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthIdTokenReqBodyModelImpl implements _AuthIdTokenReqBodyModel {
  const _$AuthIdTokenReqBodyModelImpl(
      {@JsonKey(name: "id_token") this.idToken});

  factory _$AuthIdTokenReqBodyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthIdTokenReqBodyModelImplFromJson(json);

  @override
  @JsonKey(name: "id_token")
  final String? idToken;

  @override
  String toString() {
    return 'AuthIdTokenReqBodyModel(idToken: $idToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthIdTokenReqBodyModelImpl &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idToken);

  /// Create a copy of AuthIdTokenReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthIdTokenReqBodyModelImplCopyWith<_$AuthIdTokenReqBodyModelImpl>
      get copyWith => __$$AuthIdTokenReqBodyModelImplCopyWithImpl<
          _$AuthIdTokenReqBodyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthIdTokenReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _AuthIdTokenReqBodyModel implements AuthIdTokenReqBodyModel {
  const factory _AuthIdTokenReqBodyModel(
          {@JsonKey(name: "id_token") final String? idToken}) =
      _$AuthIdTokenReqBodyModelImpl;

  factory _AuthIdTokenReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$AuthIdTokenReqBodyModelImpl.fromJson;

  @override
  @JsonKey(name: "id_token")
  String? get idToken;

  /// Create a copy of AuthIdTokenReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthIdTokenReqBodyModelImplCopyWith<_$AuthIdTokenReqBodyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
