// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_money_req_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransferMoneyReqmodel _$TransferMoneyReqmodelFromJson(
    Map<String, dynamic> json) {
  return _TransferMoneyReqmodel.fromJson(json);
}

/// @nodoc
mixin _$TransferMoneyReqmodel {
  @JsonKey(name: "sender_currency_id")
  int? get senderCurrencyId => throw _privateConstructorUsedError;
  @JsonKey(name: "receiver_currency_id")
  int? get receiverCurrencyId => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "net_amount")
  int? get netAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "rate")
  int? get rate => throw _privateConstructorUsedError;
  @JsonKey(name: "receiver_account")
  int? get receiverAccount => throw _privateConstructorUsedError;
  @JsonKey(name: "employee_id")
  int? get employeeId => throw _privateConstructorUsedError;

  /// Serializes this TransferMoneyReqmodel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransferMoneyReqmodel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferMoneyReqmodelCopyWith<TransferMoneyReqmodel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferMoneyReqmodelCopyWith<$Res> {
  factory $TransferMoneyReqmodelCopyWith(TransferMoneyReqmodel value,
          $Res Function(TransferMoneyReqmodel) then) =
      _$TransferMoneyReqmodelCopyWithImpl<$Res, TransferMoneyReqmodel>;
  @useResult
  $Res call(
      {@JsonKey(name: "sender_currency_id") int? senderCurrencyId,
      @JsonKey(name: "receiver_currency_id") int? receiverCurrencyId,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "net_amount") int? netAmount,
      @JsonKey(name: "rate") int? rate,
      @JsonKey(name: "receiver_account") int? receiverAccount,
      @JsonKey(name: "employee_id") int? employeeId});
}

/// @nodoc
class _$TransferMoneyReqmodelCopyWithImpl<$Res,
        $Val extends TransferMoneyReqmodel>
    implements $TransferMoneyReqmodelCopyWith<$Res> {
  _$TransferMoneyReqmodelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferMoneyReqmodel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderCurrencyId = freezed,
    Object? receiverCurrencyId = freezed,
    Object? amount = freezed,
    Object? netAmount = freezed,
    Object? rate = freezed,
    Object? receiverAccount = freezed,
    Object? employeeId = freezed,
  }) {
    return _then(_value.copyWith(
      senderCurrencyId: freezed == senderCurrencyId
          ? _value.senderCurrencyId
          : senderCurrencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      receiverCurrencyId: freezed == receiverCurrencyId
          ? _value.receiverCurrencyId
          : receiverCurrencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      netAmount: freezed == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int?,
      receiverAccount: freezed == receiverAccount
          ? _value.receiverAccount
          : receiverAccount // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferMoneyReqmodelImplCopyWith<$Res>
    implements $TransferMoneyReqmodelCopyWith<$Res> {
  factory _$$TransferMoneyReqmodelImplCopyWith(
          _$TransferMoneyReqmodelImpl value,
          $Res Function(_$TransferMoneyReqmodelImpl) then) =
      __$$TransferMoneyReqmodelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "sender_currency_id") int? senderCurrencyId,
      @JsonKey(name: "receiver_currency_id") int? receiverCurrencyId,
      @JsonKey(name: "amount") int? amount,
      @JsonKey(name: "net_amount") int? netAmount,
      @JsonKey(name: "rate") int? rate,
      @JsonKey(name: "receiver_account") int? receiverAccount,
      @JsonKey(name: "employee_id") int? employeeId});
}

/// @nodoc
class __$$TransferMoneyReqmodelImplCopyWithImpl<$Res>
    extends _$TransferMoneyReqmodelCopyWithImpl<$Res,
        _$TransferMoneyReqmodelImpl>
    implements _$$TransferMoneyReqmodelImplCopyWith<$Res> {
  __$$TransferMoneyReqmodelImplCopyWithImpl(_$TransferMoneyReqmodelImpl _value,
      $Res Function(_$TransferMoneyReqmodelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferMoneyReqmodel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderCurrencyId = freezed,
    Object? receiverCurrencyId = freezed,
    Object? amount = freezed,
    Object? netAmount = freezed,
    Object? rate = freezed,
    Object? receiverAccount = freezed,
    Object? employeeId = freezed,
  }) {
    return _then(_$TransferMoneyReqmodelImpl(
      senderCurrencyId: freezed == senderCurrencyId
          ? _value.senderCurrencyId
          : senderCurrencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      receiverCurrencyId: freezed == receiverCurrencyId
          ? _value.receiverCurrencyId
          : receiverCurrencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      netAmount: freezed == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int?,
      receiverAccount: freezed == receiverAccount
          ? _value.receiverAccount
          : receiverAccount // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferMoneyReqmodelImpl implements _TransferMoneyReqmodel {
  const _$TransferMoneyReqmodelImpl(
      {@JsonKey(name: "sender_currency_id") this.senderCurrencyId,
      @JsonKey(name: "receiver_currency_id") this.receiverCurrencyId,
      @JsonKey(name: "amount") this.amount,
      @JsonKey(name: "net_amount") this.netAmount,
      @JsonKey(name: "rate") this.rate,
      @JsonKey(name: "receiver_account") this.receiverAccount,
      @JsonKey(name: "employee_id") this.employeeId});

  factory _$TransferMoneyReqmodelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferMoneyReqmodelImplFromJson(json);

  @override
  @JsonKey(name: "sender_currency_id")
  final int? senderCurrencyId;
  @override
  @JsonKey(name: "receiver_currency_id")
  final int? receiverCurrencyId;
  @override
  @JsonKey(name: "amount")
  final int? amount;
  @override
  @JsonKey(name: "net_amount")
  final int? netAmount;
  @override
  @JsonKey(name: "rate")
  final int? rate;
  @override
  @JsonKey(name: "receiver_account")
  final int? receiverAccount;
  @override
  @JsonKey(name: "employee_id")
  final int? employeeId;

  @override
  String toString() {
    return 'TransferMoneyReqmodel(senderCurrencyId: $senderCurrencyId, receiverCurrencyId: $receiverCurrencyId, amount: $amount, netAmount: $netAmount, rate: $rate, receiverAccount: $receiverAccount, employeeId: $employeeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferMoneyReqmodelImpl &&
            (identical(other.senderCurrencyId, senderCurrencyId) ||
                other.senderCurrencyId == senderCurrencyId) &&
            (identical(other.receiverCurrencyId, receiverCurrencyId) ||
                other.receiverCurrencyId == receiverCurrencyId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.receiverAccount, receiverAccount) ||
                other.receiverAccount == receiverAccount) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, senderCurrencyId,
      receiverCurrencyId, amount, netAmount, rate, receiverAccount, employeeId);

  /// Create a copy of TransferMoneyReqmodel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferMoneyReqmodelImplCopyWith<_$TransferMoneyReqmodelImpl>
      get copyWith => __$$TransferMoneyReqmodelImplCopyWithImpl<
          _$TransferMoneyReqmodelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferMoneyReqmodelImplToJson(
      this,
    );
  }
}

abstract class _TransferMoneyReqmodel implements TransferMoneyReqmodel {
  const factory _TransferMoneyReqmodel(
          {@JsonKey(name: "sender_currency_id") final int? senderCurrencyId,
          @JsonKey(name: "receiver_currency_id") final int? receiverCurrencyId,
          @JsonKey(name: "amount") final int? amount,
          @JsonKey(name: "net_amount") final int? netAmount,
          @JsonKey(name: "rate") final int? rate,
          @JsonKey(name: "receiver_account") final int? receiverAccount,
          @JsonKey(name: "employee_id") final int? employeeId}) =
      _$TransferMoneyReqmodelImpl;

  factory _TransferMoneyReqmodel.fromJson(Map<String, dynamic> json) =
      _$TransferMoneyReqmodelImpl.fromJson;

  @override
  @JsonKey(name: "sender_currency_id")
  int? get senderCurrencyId;
  @override
  @JsonKey(name: "receiver_currency_id")
  int? get receiverCurrencyId;
  @override
  @JsonKey(name: "amount")
  int? get amount;
  @override
  @JsonKey(name: "net_amount")
  int? get netAmount;
  @override
  @JsonKey(name: "rate")
  int? get rate;
  @override
  @JsonKey(name: "receiver_account")
  int? get receiverAccount;
  @override
  @JsonKey(name: "employee_id")
  int? get employeeId;

  /// Create a copy of TransferMoneyReqmodel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferMoneyReqmodelImplCopyWith<_$TransferMoneyReqmodelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
