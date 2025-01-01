// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received_account_number_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceivedAccountNumberResModelImpl
    _$$ReceivedAccountNumberResModelImplFromJson(Map<String, dynamic> json) =>
        _$ReceivedAccountNumberResModelImpl(
          status: json['status'] as bool?,
          account: json['account'] == null
              ? null
              : Account.fromJson(json['account'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ReceivedAccountNumberResModelImplToJson(
        _$ReceivedAccountNumberResModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'account': instance.account,
    };
