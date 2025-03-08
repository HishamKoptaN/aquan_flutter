// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignUpResModel _$SignUpResModelFromJson(Map<String, dynamic> json) {
  return _SignUpResModel.fromJson(json);
}

/// @nodoc
mixin _$SignUpResModel {
  @JsonKey(name: "token")
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: "user")
  UserModel? get user => throw _privateConstructorUsedError;

  /// Serializes this SignUpResModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignUpResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpResModelCopyWith<SignUpResModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpResModelCopyWith<$Res> {
  factory $SignUpResModelCopyWith(
          SignUpResModel value, $Res Function(SignUpResModel) then) =
      _$SignUpResModelCopyWithImpl<$Res, SignUpResModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "token") String? token,
      @JsonKey(name: "user") UserModel? user});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$SignUpResModelCopyWithImpl<$Res, $Val extends SignUpResModel>
    implements $SignUpResModelCopyWith<$Res> {
  _$SignUpResModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  /// Create a copy of SignUpResModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignUpResModelImplCopyWith<$Res>
    implements $SignUpResModelCopyWith<$Res> {
  factory _$$SignUpResModelImplCopyWith(_$SignUpResModelImpl value,
          $Res Function(_$SignUpResModelImpl) then) =
      __$$SignUpResModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "token") String? token,
      @JsonKey(name: "user") UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$SignUpResModelImplCopyWithImpl<$Res>
    extends _$SignUpResModelCopyWithImpl<$Res, _$SignUpResModelImpl>
    implements _$$SignUpResModelImplCopyWith<$Res> {
  __$$SignUpResModelImplCopyWithImpl(
      _$SignUpResModelImpl _value, $Res Function(_$SignUpResModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? user = freezed,
  }) {
    return _then(_$SignUpResModelImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpResModelImpl implements _SignUpResModel {
  const _$SignUpResModelImpl(
      {@JsonKey(name: "token") this.token, @JsonKey(name: "user") this.user});

  factory _$SignUpResModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpResModelImplFromJson(json);

  @override
  @JsonKey(name: "token")
  final String? token;
  @override
  @JsonKey(name: "user")
  final UserModel? user;

  @override
  String toString() {
    return 'SignUpResModel(token: $token, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpResModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, user);

  /// Create a copy of SignUpResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpResModelImplCopyWith<_$SignUpResModelImpl> get copyWith =>
      __$$SignUpResModelImplCopyWithImpl<_$SignUpResModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpResModelImplToJson(
      this,
    );
  }
}

abstract class _SignUpResModel implements SignUpResModel {
  const factory _SignUpResModel(
      {@JsonKey(name: "token") final String? token,
      @JsonKey(name: "user") final UserModel? user}) = _$SignUpResModelImpl;

  factory _SignUpResModel.fromJson(Map<String, dynamic> json) =
      _$SignUpResModelImpl.fromJson;

  @override
  @JsonKey(name: "token")
  String? get token;
  @override
  @JsonKey(name: "user")
  UserModel? get user;

  /// Create a copy of SignUpResModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpResModelImplCopyWith<_$SignUpResModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
