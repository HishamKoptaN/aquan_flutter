// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'username_by_account_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UsernameByAccountResModel _$UsernameByAccountResModelFromJson(
    Map<String, dynamic> json) {
  return _UsernameByAccountResModel.fromJson(json);
}

/// @nodoc
mixin _$UsernameByAccountResModel {
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;

  /// Serializes this UsernameByAccountResModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsernameByAccountResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsernameByAccountResModelCopyWith<UsernameByAccountResModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsernameByAccountResModelCopyWith<$Res> {
  factory $UsernameByAccountResModelCopyWith(UsernameByAccountResModel value,
          $Res Function(UsernameByAccountResModel) then) =
      _$UsernameByAccountResModelCopyWithImpl<$Res, UsernameByAccountResModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName});
}

/// @nodoc
class _$UsernameByAccountResModelCopyWithImpl<$Res,
        $Val extends UsernameByAccountResModel>
    implements $UsernameByAccountResModelCopyWith<$Res> {
  _$UsernameByAccountResModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsernameByAccountResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsernameByAccountResModelImplCopyWith<$Res>
    implements $UsernameByAccountResModelCopyWith<$Res> {
  factory _$$UsernameByAccountResModelImplCopyWith(
          _$UsernameByAccountResModelImpl value,
          $Res Function(_$UsernameByAccountResModelImpl) then) =
      __$$UsernameByAccountResModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName});
}

/// @nodoc
class __$$UsernameByAccountResModelImplCopyWithImpl<$Res>
    extends _$UsernameByAccountResModelCopyWithImpl<$Res,
        _$UsernameByAccountResModelImpl>
    implements _$$UsernameByAccountResModelImplCopyWith<$Res> {
  __$$UsernameByAccountResModelImplCopyWithImpl(
      _$UsernameByAccountResModelImpl _value,
      $Res Function(_$UsernameByAccountResModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsernameByAccountResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_$UsernameByAccountResModelImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsernameByAccountResModelImpl implements _UsernameByAccountResModel {
  const _$UsernameByAccountResModelImpl(
      {@JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName});

  factory _$UsernameByAccountResModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsernameByAccountResModelImplFromJson(json);

  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;

  @override
  String toString() {
    return 'UsernameByAccountResModel(firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsernameByAccountResModelImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName);

  /// Create a copy of UsernameByAccountResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsernameByAccountResModelImplCopyWith<_$UsernameByAccountResModelImpl>
      get copyWith => __$$UsernameByAccountResModelImplCopyWithImpl<
          _$UsernameByAccountResModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsernameByAccountResModelImplToJson(
      this,
    );
  }
}

abstract class _UsernameByAccountResModel implements UsernameByAccountResModel {
  const factory _UsernameByAccountResModel(
          {@JsonKey(name: "first_name") final String? firstName,
          @JsonKey(name: "last_name") final String? lastName}) =
      _$UsernameByAccountResModelImpl;

  factory _UsernameByAccountResModel.fromJson(Map<String, dynamic> json) =
      _$UsernameByAccountResModelImpl.fromJson;

  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;

  /// Create a copy of UsernameByAccountResModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsernameByAccountResModelImplCopyWith<_$UsernameByAccountResModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
