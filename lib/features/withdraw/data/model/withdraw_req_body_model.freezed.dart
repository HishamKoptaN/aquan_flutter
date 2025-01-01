// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraw_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WithdrawReqBodyModel _$WithdrawReqBodyModelFromJson(Map<String, dynamic> json) {
  return _WithdrawReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$WithdrawReqBodyModel {
  @JsonKey(name: "amount")
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "method")
  int? get method => throw _privateConstructorUsedError;
  @JsonKey(name: "receiving_account_number")
  int? get receivingAccountNumber => throw _privateConstructorUsedError;

  /// Serializes this WithdrawReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WithdrawReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WithdrawReqBodyModelCopyWith<WithdrawReqBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawReqBodyModelCopyWith<$Res> {
  factory $WithdrawReqBodyModelCopyWith(WithdrawReqBodyModel value,
          $Res Function(WithdrawReqBodyModel) then) =
      _$WithdrawReqBodyModelCopyWithImpl<$Res, WithdrawReqBodyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "amount") int? amount,
      @JsonKey(name: "method") int? method,
      @JsonKey(name: "receiving_account_number") int? receivingAccountNumber});
}

/// @nodoc
class _$WithdrawReqBodyModelCopyWithImpl<$Res,
        $Val extends WithdrawReqBodyModel>
    implements $WithdrawReqBodyModelCopyWith<$Res> {
  _$WithdrawReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WithdrawReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? method = freezed,
    Object? receivingAccountNumber = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as int?,
      receivingAccountNumber: freezed == receivingAccountNumber
          ? _value.receivingAccountNumber
          : receivingAccountNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WithdrawReqBodyModelImplCopyWith<$Res>
    implements $WithdrawReqBodyModelCopyWith<$Res> {
  factory _$$WithdrawReqBodyModelImplCopyWith(_$WithdrawReqBodyModelImpl value,
          $Res Function(_$WithdrawReqBodyModelImpl) then) =
      __$$WithdrawReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "amount") int? amount,
      @JsonKey(name: "method") int? method,
      @JsonKey(name: "receiving_account_number") int? receivingAccountNumber});
}

/// @nodoc
class __$$WithdrawReqBodyModelImplCopyWithImpl<$Res>
    extends _$WithdrawReqBodyModelCopyWithImpl<$Res, _$WithdrawReqBodyModelImpl>
    implements _$$WithdrawReqBodyModelImplCopyWith<$Res> {
  __$$WithdrawReqBodyModelImplCopyWithImpl(_$WithdrawReqBodyModelImpl _value,
      $Res Function(_$WithdrawReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WithdrawReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? method = freezed,
    Object? receivingAccountNumber = freezed,
  }) {
    return _then(_$WithdrawReqBodyModelImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as int?,
      receivingAccountNumber: freezed == receivingAccountNumber
          ? _value.receivingAccountNumber
          : receivingAccountNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WithdrawReqBodyModelImpl implements _WithdrawReqBodyModel {
  const _$WithdrawReqBodyModelImpl(
      {@JsonKey(name: "amount") this.amount,
      @JsonKey(name: "method") this.method,
      @JsonKey(name: "receiving_account_number") this.receivingAccountNumber});

  factory _$WithdrawReqBodyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WithdrawReqBodyModelImplFromJson(json);

  @override
  @JsonKey(name: "amount")
  final int? amount;
  @override
  @JsonKey(name: "method")
  final int? method;
  @override
  @JsonKey(name: "receiving_account_number")
  final int? receivingAccountNumber;

  @override
  String toString() {
    return 'WithdrawReqBodyModel(amount: $amount, method: $method, receivingAccountNumber: $receivingAccountNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawReqBodyModelImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.receivingAccountNumber, receivingAccountNumber) ||
                other.receivingAccountNumber == receivingAccountNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, method, receivingAccountNumber);

  /// Create a copy of WithdrawReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawReqBodyModelImplCopyWith<_$WithdrawReqBodyModelImpl>
      get copyWith =>
          __$$WithdrawReqBodyModelImplCopyWithImpl<_$WithdrawReqBodyModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WithdrawReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _WithdrawReqBodyModel implements WithdrawReqBodyModel {
  const factory _WithdrawReqBodyModel(
      {@JsonKey(name: "amount") final int? amount,
      @JsonKey(name: "method") final int? method,
      @JsonKey(name: "receiving_account_number")
      final int? receivingAccountNumber}) = _$WithdrawReqBodyModelImpl;

  factory _WithdrawReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$WithdrawReqBodyModelImpl.fromJson;

  @override
  @JsonKey(name: "amount")
  int? get amount;
  @override
  @JsonKey(name: "method")
  int? get method;
  @override
  @JsonKey(name: "receiving_account_number")
  int? get receivingAccountNumber;

  /// Create a copy of WithdrawReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WithdrawReqBodyModelImplCopyWith<_$WithdrawReqBodyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
