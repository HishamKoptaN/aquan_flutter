import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'withdraw_rates_res_model.freezed.dart';
part 'withdraw_rates_res_model.g.dart';

@freezed
class WithdrawRatesResModel with _$WithdrawRatesResModel {
  const factory WithdrawRatesResModel({
    @Default(0.0)
    @JsonKey(name: "total_withdrawals")
    double totalWithdrawals, // تعيين القيمة الافتراضية 0.0
    @Default([])
    @JsonKey(name: "from_binance_rates")
    List<FromBinanceRate> fromBinanceRates, // قائمة فارغة كقيمة افتراضية
  }) = _WithdrawRatesResModel;

  factory WithdrawRatesResModel.fromJson(Map<String, dynamic> json) =>
      _$WithdrawRatesResModelFromJson(json);
}

@freezed
class FromBinanceRate with _$FromBinanceRate {
  const factory FromBinanceRate({
    @Default(0.0)
    @JsonKey(name: "price")
    double price, // تعيين القيمة الافتراضية 0.0
    @Default("")
    @JsonKey(name: "updated_at")
    String updatedAt, // سلسلة فارغة كقيمة افتراضية
    @Default("")
    @JsonKey(name: "currency_name")
    String currencyName, // سلسلة فارغة كقيمة افتراضية
    @Default(0) @JsonKey(name: "to") int to, // صفر كقيمة افتراضية
  }) = _FromBinanceRate;

  factory FromBinanceRate.fromJson(Map<String, dynamic> json) =>
      _$FromBinanceRateFromJson(json);
}
