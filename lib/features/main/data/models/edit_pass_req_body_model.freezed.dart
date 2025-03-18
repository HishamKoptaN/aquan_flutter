// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_pass_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditPassReqBodyModel _$EditPassReqBodyModelFromJson(Map<String, dynamic> json) {
  return _EditPassReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$EditPassReqBodyModel {
  String? get currentPassword => throw _privateConstructorUsedError;
  String? get newPassword => throw _privateConstructorUsedError;
  String? get newPasswordConfirmation => throw _privateConstructorUsedError;

  /// Serializes this EditPassReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EditPassReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditPassReqBodyModelCopyWith<EditPassReqBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditPassReqBodyModelCopyWith<$Res> {
  factory $EditPassReqBodyModelCopyWith(EditPassReqBodyModel value,
          $Res Function(EditPassReqBodyModel) then) =
      _$EditPassReqBodyModelCopyWithImpl<$Res, EditPassReqBodyModel>;
  @useResult
  $Res call(
      {String? currentPassword,
      String? newPassword,
      String? newPasswordConfirmation});
}

/// @nodoc
class _$EditPassReqBodyModelCopyWithImpl<$Res,
        $Val extends EditPassReqBodyModel>
    implements $EditPassReqBodyModelCopyWith<$Res> {
  _$EditPassReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditPassReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = freezed,
    Object? newPassword = freezed,
    Object? newPasswordConfirmation = freezed,
  }) {
    return _then(_value.copyWith(
      currentPassword: freezed == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      newPasswordConfirmation: freezed == newPasswordConfirmation
          ? _value.newPasswordConfirmation
          : newPasswordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditPassReqBodyModelImplCopyWith<$Res>
    implements $EditPassReqBodyModelCopyWith<$Res> {
  factory _$$EditPassReqBodyModelImplCopyWith(_$EditPassReqBodyModelImpl value,
          $Res Function(_$EditPassReqBodyModelImpl) then) =
      __$$EditPassReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? currentPassword,
      String? newPassword,
      String? newPasswordConfirmation});
}

/// @nodoc
class __$$EditPassReqBodyModelImplCopyWithImpl<$Res>
    extends _$EditPassReqBodyModelCopyWithImpl<$Res, _$EditPassReqBodyModelImpl>
    implements _$$EditPassReqBodyModelImplCopyWith<$Res> {
  __$$EditPassReqBodyModelImplCopyWithImpl(_$EditPassReqBodyModelImpl _value,
      $Res Function(_$EditPassReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditPassReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = freezed,
    Object? newPassword = freezed,
    Object? newPasswordConfirmation = freezed,
  }) {
    return _then(_$EditPassReqBodyModelImpl(
      currentPassword: freezed == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      newPasswordConfirmation: freezed == newPasswordConfirmation
          ? _value.newPasswordConfirmation
          : newPasswordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditPassReqBodyModelImpl implements _EditPassReqBodyModel {
  const _$EditPassReqBodyModelImpl(
      {this.currentPassword, this.newPassword, this.newPasswordConfirmation});

  factory _$EditPassReqBodyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditPassReqBodyModelImplFromJson(json);

  @override
  final String? currentPassword;
  @override
  final String? newPassword;
  @override
  final String? newPasswordConfirmation;

  @override
  String toString() {
    return 'EditPassReqBodyModel(currentPassword: $currentPassword, newPassword: $newPassword, newPasswordConfirmation: $newPasswordConfirmation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditPassReqBodyModelImpl &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(
                    other.newPasswordConfirmation, newPasswordConfirmation) ||
                other.newPasswordConfirmation == newPasswordConfirmation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPassword, newPassword, newPasswordConfirmation);

  /// Create a copy of EditPassReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditPassReqBodyModelImplCopyWith<_$EditPassReqBodyModelImpl>
      get copyWith =>
          __$$EditPassReqBodyModelImplCopyWithImpl<_$EditPassReqBodyModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditPassReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _EditPassReqBodyModel implements EditPassReqBodyModel {
  const factory _EditPassReqBodyModel(
      {final String? currentPassword,
      final String? newPassword,
      final String? newPasswordConfirmation}) = _$EditPassReqBodyModelImpl;

  factory _EditPassReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$EditPassReqBodyModelImpl.fromJson;

  @override
  String? get currentPassword;
  @override
  String? get newPassword;
  @override
  String? get newPasswordConfirmation;

  /// Create a copy of EditPassReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditPassReqBodyModelImplCopyWith<_$EditPassReqBodyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
