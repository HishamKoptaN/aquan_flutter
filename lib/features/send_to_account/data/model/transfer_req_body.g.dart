// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_req_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferReqBodyImpl _$$TransferReqBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$TransferReqBodyImpl(
      accountNumber: json['account_number'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TransferReqBodyImplToJson(
        _$TransferReqBodyImpl instance) =>
    <String, dynamic>{
      'account_number': instance.accountNumber,
      'amount': instance.amount,
    };
