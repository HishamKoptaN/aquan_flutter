// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trans_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransImpl _$$TransImplFromJson(Map<String, dynamic> json) => _$TransImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      status: json['status'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      netAmount: (json['net_amount'] as num?)?.toDouble() ?? 0.0,
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      message: json['message'] as String? ?? '',
      image: json['image'] as String? ?? '',
      address: json['address'] as String? ?? '',
      employeeId: (json['employee_id'] as num?)?.toInt() ?? 0,
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      senderCurrencyId: (json['sender_currency_id'] as num?)?.toInt() ?? 0,
      receiverCurrencyId: (json['receiver_currency_id'] as num?)?.toInt() ?? 0,
      receiverAccount: json['receiver_account'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      senderCurrency: json['sender_currency'] == null
          ? const Currency(name: '')
          : Currency.fromJson(json['sender_currency'] as Map<String, dynamic>),
      receiverCurrency: json['receiver_currency'] == null
          ? const Currency(name: '')
          : Currency.fromJson(
              json['receiver_currency'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransImplToJson(_$TransImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'amount': instance.amount,
      'net_amount': instance.netAmount,
      'rate': instance.rate,
      'message': instance.message,
      'image': instance.image,
      'address': instance.address,
      'employee_id': instance.employeeId,
      'user_id': instance.userId,
      'sender_currency_id': instance.senderCurrencyId,
      'receiver_currency_id': instance.receiverCurrencyId,
      'receiver_account': instance.receiverAccount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'sender_currency': instance.senderCurrency,
      'receiver_currency': instance.receiverCurrency,
    };
