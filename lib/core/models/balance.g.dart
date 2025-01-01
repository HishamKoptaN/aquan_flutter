// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BalanceImpl _$$BalanceImplFromJson(Map<String, dynamic> json) =>
    _$BalanceImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      totalBalance: (json['total_balance'] as num?)?.toInt(),
      availableBalance: json['available_balance'] as String?,
      suspendedBalance: json['suspended_balance'] as String?,
    );

Map<String, dynamic> _$$BalanceImplToJson(_$BalanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'total_balance': instance.totalBalance,
      'available_balance': instance.availableBalance,
      'suspended_balance': instance.suspendedBalance,
    };
