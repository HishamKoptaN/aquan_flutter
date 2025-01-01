// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraws_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WithdrawImpl _$$WithdrawImplFromJson(Map<String, dynamic> json) =>
    _$WithdrawImpl(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      method: (json['method'] as num?)?.toInt(),
      receivingAccountNumber: json['receiving_account_number'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      image: json['image'] as String?,
      comment: json['comment'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WithdrawImplToJson(_$WithdrawImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'user_id': instance.userId,
      'method': instance.method,
      'receiving_account_number': instance.receivingAccountNumber,
      'amount': instance.amount,
      'image': instance.image,
      'comment': instance.comment,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'currency': instance.currency,
    };
