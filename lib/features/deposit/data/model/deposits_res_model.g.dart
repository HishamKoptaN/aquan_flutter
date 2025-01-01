// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposits_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepositsResModelImpl _$$DepositsResModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DepositsResModelImpl(
      deposits: (json['deposits'] as List<dynamic>?)
          ?.map((e) => Deposit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DepositsResModelImplToJson(
        _$DepositsResModelImpl instance) =>
    <String, dynamic>{
      'deposits': instance.deposits,
    };

_$DepositImpl _$$DepositImplFromJson(Map<String, dynamic> json) =>
    _$DepositImpl(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      employeeId: (json['employee_id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
      method: (json['method'] as num?)?.toInt(),
      image: json['image'] as String?,
      comment: json['comment'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      currency: json['currency'] == null
          ? null
          : DepositCurrency.fromJson(json['currency'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DepositImplToJson(_$DepositImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'user_id': instance.userId,
      'employee_id': instance.employeeId,
      'amount': instance.amount,
      'method': instance.method,
      'image': instance.image,
      'comment': instance.comment,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'currency': instance.currency,
    };

_$CurrencyImpl _$$CurrencyImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$CurrencyImplToJson(_$CurrencyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
