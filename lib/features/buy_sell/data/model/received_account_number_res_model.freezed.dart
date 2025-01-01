// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'received_account_number_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReceivedAccountNumberResModel _$ReceivedAccountNumberResModelFromJson(
    Map<String, dynamic> json) {
  return _ReceivedAccountNumberResModel.fromJson(json);
}

/// @nodoc
mixin _$ReceivedAccountNumberResModel {
  @JsonKey(name: "status")
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "account")
  Account? get account => throw _privateConstructorUsedError;

  /// Serializes this ReceivedAccountNumberResModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceivedAccountNumberResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceivedAccountNumberResModelCopyWith<ReceivedAccountNumberResModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceivedAccountNumberResModelCopyWith<$Res> {
  factory $ReceivedAccountNumberResModelCopyWith(
          ReceivedAccountNumberResModel value,
          $Res Function(ReceivedAccountNumberResModel) then) =
      _$ReceivedAccountNumberResModelCopyWithImpl<$Res,
          ReceivedAccountNumberResModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "account") Account? account});

  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class _$ReceivedAccountNumberResModelCopyWithImpl<$Res,
        $Val extends ReceivedAccountNumberResModel>
    implements $ReceivedAccountNumberResModelCopyWith<$Res> {
  _$ReceivedAccountNumberResModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceivedAccountNumberResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? account = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
    ) as $Val);
  }

  /// Create a copy of ReceivedAccountNumberResModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReceivedAccountNumberResModelImplCopyWith<$Res>
    implements $ReceivedAccountNumberResModelCopyWith<$Res> {
  factory _$$ReceivedAccountNumberResModelImplCopyWith(
          _$ReceivedAccountNumberResModelImpl value,
          $Res Function(_$ReceivedAccountNumberResModelImpl) then) =
      __$$ReceivedAccountNumberResModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "account") Account? account});

  @override
  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class __$$ReceivedAccountNumberResModelImplCopyWithImpl<$Res>
    extends _$ReceivedAccountNumberResModelCopyWithImpl<$Res,
        _$ReceivedAccountNumberResModelImpl>
    implements _$$ReceivedAccountNumberResModelImplCopyWith<$Res> {
  __$$ReceivedAccountNumberResModelImplCopyWithImpl(
      _$ReceivedAccountNumberResModelImpl _value,
      $Res Function(_$ReceivedAccountNumberResModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceivedAccountNumberResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? account = freezed,
  }) {
    return _then(_$ReceivedAccountNumberResModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceivedAccountNumberResModelImpl
    implements _ReceivedAccountNumberResModel {
  const _$ReceivedAccountNumberResModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "account") this.account});

  factory _$ReceivedAccountNumberResModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReceivedAccountNumberResModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final bool? status;
  @override
  @JsonKey(name: "account")
  final Account? account;

  @override
  String toString() {
    return 'ReceivedAccountNumberResModel(status: $status, account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceivedAccountNumberResModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.account, account) || other.account == account));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, account);

  /// Create a copy of ReceivedAccountNumberResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceivedAccountNumberResModelImplCopyWith<
          _$ReceivedAccountNumberResModelImpl>
      get copyWith => __$$ReceivedAccountNumberResModelImplCopyWithImpl<
          _$ReceivedAccountNumberResModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceivedAccountNumberResModelImplToJson(
      this,
    );
  }
}

abstract class _ReceivedAccountNumberResModel
    implements ReceivedAccountNumberResModel {
  const factory _ReceivedAccountNumberResModel(
          {@JsonKey(name: "status") final bool? status,
          @JsonKey(name: "account") final Account? account}) =
      _$ReceivedAccountNumberResModelImpl;

  factory _ReceivedAccountNumberResModel.fromJson(Map<String, dynamic> json) =
      _$ReceivedAccountNumberResModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  bool? get status;
  @override
  @JsonKey(name: "account")
  Account? get account;

  /// Create a copy of ReceivedAccountNumberResModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceivedAccountNumberResModelImplCopyWith<
          _$ReceivedAccountNumberResModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
