// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_money_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferMoneyReqmodelImpl _$$TransferMoneyReqmodelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransferMoneyReqmodelImpl(
      senderCurrencyId: (json['sender_currency_id'] as num?)?.toInt(),
      receiverCurrencyId: (json['receiver_currency_id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      netAmount: (json['net_amount'] as num?)?.toInt(),
      rate: (json['rate'] as num?)?.toInt(),
      receiverAccount: (json['receiver_account'] as num?)?.toInt(),
      employeeId: (json['employee_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TransferMoneyReqmodelImplToJson(
        _$TransferMoneyReqmodelImpl instance) =>
    <String, dynamic>{
      'sender_currency_id': instance.senderCurrencyId,
      'receiver_currency_id': instance.receiverCurrencyId,
      'amount': instance.amount,
      'net_amount': instance.netAmount,
      'rate': instance.rate,
      'receiver_account': instance.receiverAccount,
      'employee_id': instance.employeeId,
    };
