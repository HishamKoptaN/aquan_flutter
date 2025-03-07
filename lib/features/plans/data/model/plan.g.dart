// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanImpl _$$PlanImplFromJson(Map<String, dynamic> json) => _$PlanImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      userAmountPerReferal: (json['user_amount_per_referal'] as num?)?.toInt(),
      referedAmount: (json['refered_amount'] as num?)?.toInt(),
      amountAfterCount: (json['amount_after_count'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
      transferCommission: (json['transfer_commission'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toInt(),
      discountType: json['discount_type'] as String?,
      dailyTransferCount: (json['daily_transfer_count'] as num?)?.toInt(),
      monthlyTransferCount: (json['monthly_transfer_count'] as num?)?.toInt(),
      maxTransferCount: (json['max_transfer_count'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PlanImplToJson(_$PlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'user_amount_per_referal': instance.userAmountPerReferal,
      'refered_amount': instance.referedAmount,
      'amount_after_count': instance.amountAfterCount,
      'count': instance.count,
      'transfer_commission': instance.transferCommission,
      'discount': instance.discount,
      'discount_type': instance.discountType,
      'daily_transfer_count': instance.dailyTransferCount,
      'monthly_transfer_count': instance.monthlyTransferCount,
      'max_transfer_count': instance.maxTransferCount,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
