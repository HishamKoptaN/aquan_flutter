// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanRateImpl _$$PlanRateImplFromJson(Map<String, dynamic> json) =>
    _$PlanRateImpl(
      employeeId: (json['employee_id'] as num?)?.toInt() ?? 0,
      accountInfo: (json['account_info'] as List<dynamic>?)
              ?.map((e) => AccountInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      toBinanceRates: (json['to_binance_rates'] as List<dynamic>?)
              ?.map((e) => ToBinanceRate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PlanRateImplToJson(_$PlanRateImpl instance) =>
    <String, dynamic>{
      'employee_id': instance.employeeId,
      'account_info': instance.accountInfo,
      'to_binance_rates': instance.toBinanceRates,
    };

_$AccountInfoImpl _$$AccountInfoImplFromJson(Map<String, dynamic> json) =>
    _$AccountInfoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      bankId: (json['currency_id'] as num?)?.toInt() ?? 0,
      accountNumber: json['account_number'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      currency: json['currency'] == null
          ? const Currency()
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AccountInfoImplToJson(_$AccountInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'currency_id': instance.bankId,
      'account_number': instance.accountNumber,
      'comment': instance.comment,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'currency': instance.currency,
    };

_$ToBinanceRateImpl _$$ToBinanceRateImplFromJson(Map<String, dynamic> json) =>
    _$ToBinanceRateImpl(
      price: (json['price'] as num?)?.toInt() ?? 0,
      updatedAt: json['updated_at'] as String? ?? '',
      currencyName: json['currency_name'] as String? ?? '',
      from: (json['from'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ToBinanceRateImplToJson(_$ToBinanceRateImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'updated_at': instance.updatedAt,
      'currency_name': instance.currencyName,
      'from': instance.from,
    };
