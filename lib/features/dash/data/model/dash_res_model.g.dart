// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashResModelImpl _$$DashResModelImplFromJson(Map<String, dynamic> json) =>
    _$DashResModelImpl(
      exchangeRates: (json['exchange_rates'] as List<dynamic>?)
          ?.map((e) => Currency.fromJson(e as Map<String, dynamic>))
          .toList(),
      sellingPrices: (json['selling_prices'] as List<dynamic>?)
          ?.map((e) => SellingPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
      buyingPrices: (json['buying_prices'] as List<dynamic>?)
          ?.map((e) => BuyingPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
      currencies: (json['currencies'] as List<dynamic>?)
          ?.map((e) => Currency.fromJson(e as Map<String, dynamic>))
          .toList(),
      rates: (json['rates'] as List<dynamic>?)
          ?.map((e) => Rate.fromJson(e as Map<String, dynamic>))
          .toList(),
      commission: (json['commission'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DashResModelImplToJson(_$DashResModelImpl instance) =>
    <String, dynamic>{
      'exchange_rates': instance.exchangeRates,
      'selling_prices': instance.sellingPrices,
      'buying_prices': instance.buyingPrices,
      'currencies': instance.currencies,
      'rates': instance.rates,
      'commission': instance.commission,
    };

_$BuyingPriceImpl _$$BuyingPriceImplFromJson(Map<String, dynamic> json) =>
    _$BuyingPriceImpl(
      price: (json['price'] as num?)?.toInt(),
      updatedAt: json['updated_at'] as String?,
      to: (json['to'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BuyingPriceImplToJson(_$BuyingPriceImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'updated_at': instance.updatedAt,
      'to': instance.to,
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

_$SellingPriceImpl _$$SellingPriceImplFromJson(Map<String, dynamic> json) =>
    _$SellingPriceImpl(
      price: (json['price'] as num?)?.toInt(),
      updatedAt: json['updated_at'] as String?,
      from: (json['from'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SellingPriceImplToJson(_$SellingPriceImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'updated_at': instance.updatedAt,
      'from': instance.from,
    };
