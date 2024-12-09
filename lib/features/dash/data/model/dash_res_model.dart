// To parse this JSON data, do
//
//     final dashResModel = dashResModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import '../../../../core/models/currency.dart';

part 'dash_res_model.freezed.dart';
part 'dash_res_model.g.dart';

DashResModel dashResModelFromJson(String str) =>
    DashResModel.fromJson(json.decode(str));

String dashResModelToJson(DashResModel data) => json.encode(data.toJson());

@freezed
class DashResModel with _$DashResModel {
  const factory DashResModel({
    @JsonKey(name: "exchange_rates") List<Currency>? exchangeRates,
    @JsonKey(name: "selling_prices") List<SellingPrice>? sellingPrices,
    @JsonKey(name: "buying_prices") List<BuyingPrice>? buyingPrices,
    @JsonKey(name: "currencies") List<Currency>? currencies,
    @JsonKey(name: "rates") List<Rate>? rates,
    @JsonKey(name: "commission") int? commission,
  }) = _DashResModel;

  factory DashResModel.fromJson(Map<String, dynamic> json) =>
      _$DashResModelFromJson(json);
}

@freezed
class BuyingPrice with _$BuyingPrice {
  const factory BuyingPrice({
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "to") int? to,
  }) = _BuyingPrice;

  factory BuyingPrice.fromJson(Map<String, dynamic> json) =>
      _$BuyingPriceFromJson(json);
}

@freezed
class Rate with _$Rate {
  const factory Rate({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "plan_id") int? planId,
    @JsonKey(name: "from") int? from,
    @JsonKey(name: "to") int? to,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _Rate;

  factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);
}

@freezed
class SellingPrice with _$SellingPrice {
  const factory SellingPrice({
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "from") int? from,
  }) = _SellingPrice;

  factory SellingPrice.fromJson(Map<String, dynamic> json) =>
      _$SellingPriceFromJson(json);
}
