// To parse this JSON data, do
//
//     final dashResModel = dashResModelFromJson(jsonString);
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'dash_res_model.freezed.dart';
part 'dash_res_model.g.dart';

DashResModel dashResModelFromJson(String str) =>
    DashResModel.fromJson(json.decode(str));

String dashResModelToJson(DashResModel data) => json.encode(data.toJson());

@freezed
class DashResModel with _$DashResModel {
  const factory DashResModel({
    @JsonKey(name: "exchange_rates") @Default([]) List<Currency> exchangeRates,
    @JsonKey(name: "selling_prices")
    @Default([])
    List<SellingPrice> sellingPrices,
    @JsonKey(name: "buying_prices") @Default([]) List<BuyingPrice> buyingPrices,
    @JsonKey(name: "currencies") @Default([]) List<Currency> currencies,
    @JsonKey(name: "rates") @Default([]) List<Rate> rates,
    @JsonKey(name: "commission") @Default(0) int commission,
  }) = _DashResModel;

  factory DashResModel.fromJson(Map<String, dynamic> json) =>
      _$DashResModelFromJson(json);
}

@freezed
class BuyingPrice with _$BuyingPrice {
  const factory BuyingPrice({
    @JsonKey(name: "price") @Default(0.0) double price,
    @JsonKey(name: "updated_at") @Default("") String updatedAt,
    @JsonKey(name: "to") @Default(0) int to,
  }) = _BuyingPrice;

  factory BuyingPrice.fromJson(Map<String, dynamic> json) =>
      _$BuyingPriceFromJson(json);
}

@freezed
class Currency with _$Currency {
  const factory Currency({
    @JsonKey(name: "id") @Default(0) int id,
    @JsonKey(name: "status") @Default("") String status,
    @JsonKey(name: "name") @Default("") String name,
    @JsonKey(name: "name_code") @Default("") String nameCode,
    @JsonKey(name: "comment") @Default("") String comment,
    @JsonKey(name: "created_at") @Default("") String createdAt,
    @JsonKey(name: "updated_at") @Default("") String updatedAt,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}

@freezed
class Rate with _$Rate {
  const factory Rate({
    @JsonKey(name: "id") @Default(0) int id,
    @JsonKey(name: "status") @Default(false) bool status,
    @JsonKey(name: "plan_id") @Default(0) int planId,
    @JsonKey(name: "from") @Default(0) int from,
    @JsonKey(name: "to") @Default(0) int to,
    @JsonKey(name: "price") @Default(0.0) double price,
    @JsonKey(name: "created_at") @Default("") String createdAt,
    @JsonKey(name: "updated_at") @Default("") String updatedAt,
  }) = _Rate;

  factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);
}

@freezed
class SellingPrice with _$SellingPrice {
  const factory SellingPrice({
    @JsonKey(name: "price") @Default(0.0) double price,
    @JsonKey(name: "updated_at") @Default("") String updatedAt,
    @JsonKey(name: "from") @Default(0) int from,
  }) = _SellingPrice;

  factory SellingPrice.fromJson(Map<String, dynamic> json) =>
      _$SellingPriceFromJson(json);
}
