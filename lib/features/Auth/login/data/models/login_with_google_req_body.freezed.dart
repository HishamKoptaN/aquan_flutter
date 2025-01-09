// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_with_google_req_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginWithGoogleReqBody _$LoginWithGoogleReqBodyFromJson(
    Map<String, dynamic> json) {
  return _LoginWithGoogleReqBody.fromJson(json);
}

/// @nodoc
mixin _$LoginWithGoogleReqBody {
  @JsonKey(name: "id_token")
  String? get idToken => throw _privateConstructorUsedError;

  /// Serializes this LoginWithGoogleReqBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginWithGoogleReqBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginWithGoogleReqBodyCopyWith<LoginWithGoogleReqBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginWithGoogleReqBodyCopyWith<$Res> {
  factory $LoginWithGoogleReqBodyCopyWith(LoginWithGoogleReqBody value,
          $Res Function(LoginWithGoogleReqBody) then) =
      _$LoginWithGoogleReqBodyCopyWithImpl<$Res, LoginWithGoogleReqBody>;
  @useResult
  $Res call({@JsonKey(name: "id_token") String? idToken});
}

/// @nodoc
class _$LoginWithGoogleReqBodyCopyWithImpl<$Res,
        $Val extends LoginWithGoogleReqBody>
    implements $LoginWithGoogleReqBodyCopyWith<$Res> {
  _$LoginWithGoogleReqBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginWithGoogleReqBody
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
abstract class _$$LoginWithGoogleReqBodyImplCopyWith<$Res>
    implements $LoginWithGoogleReqBodyCopyWith<$Res> {
  factory _$$LoginWithGoogleReqBodyImplCopyWith(
          _$LoginWithGoogleReqBodyImpl value,
          $Res Function(_$LoginWithGoogleReqBodyImpl) then) =
      __$$LoginWithGoogleReqBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "id_token") String? idToken});
}

/// @nodoc
class __$$LoginWithGoogleReqBodyImplCopyWithImpl<$Res>
    extends _$LoginWithGoogleReqBodyCopyWithImpl<$Res,
        _$LoginWithGoogleReqBodyImpl>
    implements _$$LoginWithGoogleReqBodyImplCopyWith<$Res> {
  __$$LoginWithGoogleReqBodyImplCopyWithImpl(
      _$LoginWithGoogleReqBodyImpl _value,
      $Res Function(_$LoginWithGoogleReqBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginWithGoogleReqBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = freezed,
  }) {
    return _then(_$LoginWithGoogleReqBodyImpl(
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginWithGoogleReqBodyImpl implements _LoginWithGoogleReqBody {
  const _$LoginWithGoogleReqBodyImpl({@JsonKey(name: "id_token") this.idToken});

  factory _$LoginWithGoogleReqBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginWithGoogleReqBodyImplFromJson(json);

  @override
  @JsonKey(name: "id_token")
  final String? idToken;

  @override
  String toString() {
    return 'LoginWithGoogleReqBody(idToken: $idToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithGoogleReqBodyImpl &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idToken);

  /// Create a copy of LoginWithGoogleReqBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithGoogleReqBodyImplCopyWith<_$LoginWithGoogleReqBodyImpl>
      get copyWith => __$$LoginWithGoogleReqBodyImplCopyWithImpl<
          _$LoginWithGoogleReqBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginWithGoogleReqBodyImplToJson(
      this,
    );
  }
}

abstract class _LoginWithGoogleReqBody implements LoginWithGoogleReqBody {
  const factory _LoginWithGoogleReqBody(
          {@JsonKey(name: "id_token") final String? idToken}) =
      _$LoginWithGoogleReqBodyImpl;

  factory _LoginWithGoogleReqBody.fromJson(Map<String, dynamic> json) =
      _$LoginWithGoogleReqBodyImpl.fromJson;

  @override
  @JsonKey(name: "id_token")
  String? get idToken;

  /// Create a copy of LoginWithGoogleReqBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginWithGoogleReqBodyImplCopyWith<_$LoginWithGoogleReqBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
