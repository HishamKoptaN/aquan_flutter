// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_sell_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BuySellResModelImpl _$$BuySellResModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BuySellResModelImpl(
      buySellStatus: json['buy_sell_status'] as bool?,
      buySellMessage: json['buy_sell_message'] as String?,
      totalMonthlyTransfers: (json['total_monthly_transfers'] as num?)?.toInt(),
      totalDailyTransfers: (json['total_daily_transfers'] as num?)?.toInt(),
      maxTransferCount: (json['max_transfer_count'] as num?)?.toInt(),
      monthlyTransferCount: (json['monthly_transfer_count'] as num?)?.toInt(),
      dailyTransferCount: (json['daily_transfer_count'] as num?)?.toInt(),
      currencies: (json['currencies'] as List<dynamic>?)
          ?.map((e) => Currency.fromJson(e as Map<String, dynamic>))
          .toList(),
      rates: (json['rates'] as List<dynamic>?)
          ?.map((e) => Rate.fromJson(e as Map<String, dynamic>))
          .toList(),
      accounts: (json['accounts'] as List<dynamic>?)
          ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BuySellResModelImplToJson(
        _$BuySellResModelImpl instance) =>
    <String, dynamic>{
      'buy_sell_status': instance.buySellStatus,
      'buy_sell_message': instance.buySellMessage,
      'total_monthly_transfers': instance.totalMonthlyTransfers,
      'total_daily_transfers': instance.totalDailyTransfers,
      'max_transfer_count': instance.maxTransferCount,
      'monthly_transfer_count': instance.monthlyTransferCount,
      'daily_transfer_count': instance.dailyTransferCount,
      'currencies': instance.currencies,
      'rates': instance.rates,
      'accounts': instance.accounts,
    };

_$AccountCurrencyImpl _$$AccountCurrencyImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountCurrencyImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$AccountCurrencyImplToJson(
        _$AccountCurrencyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$RateImpl _$$RateImplFromJson(Map<String, dynamic> json) => _$RateImpl(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as bool?,
      planId: (json['plan_id'] as num?)?.toInt(),
      from: (json['from'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$RateImplToJson(_$RateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'plan_id': instance.planId,
      'from': instance.from,
      'to': instance.to,
      'price': instance.price,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
