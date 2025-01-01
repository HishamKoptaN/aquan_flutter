// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_rates_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WithdrawRatesResModelImpl _$$WithdrawRatesResModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WithdrawRatesResModelImpl(
      totalWithdrawals: (json['total_withdrawals'] as num?)?.toDouble() ?? 0.0,
      fromBinanceRates: (json['from_binance_rates'] as List<dynamic>?)
              ?.map((e) => FromBinanceRate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WithdrawRatesResModelImplToJson(
        _$WithdrawRatesResModelImpl instance) =>
    <String, dynamic>{
      'total_withdrawals': instance.totalWithdrawals,
      'from_binance_rates': instance.fromBinanceRates,
    };

_$FromBinanceRateImpl _$$FromBinanceRateImplFromJson(
        Map<String, dynamic> json) =>
    _$FromBinanceRateImpl(
      price: (json['price'] as num?)?.toInt() ?? 0,
      updatedAt: json['updated_at'] as String? ?? "",
      currencyName: json['currency_name'] as String? ?? "",
      to: (json['to'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FromBinanceRateImplToJson(
        _$FromBinanceRateImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'updated_at': instance.updatedAt,
      'currency_name': instance.currencyName,
      'to': instance.to,
    };
