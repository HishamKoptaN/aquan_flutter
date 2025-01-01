// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_req_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WithdrawReqBodyModelImpl _$$WithdrawReqBodyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WithdrawReqBodyModelImpl(
      amount: (json['amount'] as num?)?.toInt(),
      method: (json['method'] as num?)?.toInt(),
      receivingAccountNumber:
          (json['receiving_account_number'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WithdrawReqBodyModelImplToJson(
        _$WithdrawReqBodyModelImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'method': instance.method,
      'receiving_account_number': instance.receivingAccountNumber,
    };
