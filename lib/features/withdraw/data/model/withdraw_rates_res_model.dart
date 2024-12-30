import 'package:freezed_annotation/freezed_annotation.dart';
part 'withdraw_rates_res_model.freezed.dart';
part 'withdraw_rates_res_model.g.dart';

@freezed
class WithdrawRatesResModel with _$WithdrawRatesResModel {
  const factory WithdrawRatesResModel({
    @Default(0.0) @JsonKey(name: "total_withdrawals") double totalWithdrawals,
    @Default([])
    @JsonKey(name: "from_binance_rates")
    List<FromBinanceRate> fromBinanceRates,
  }) = _WithdrawRatesResModel;

  factory WithdrawRatesResModel.fromJson(Map<String, dynamic> json) =>
      _$WithdrawRatesResModelFromJson(json);
}

@freezed
class FromBinanceRate with _$FromBinanceRate {
  const factory FromBinanceRate({
    @Default(0) @JsonKey(name: "price") int price,
    @Default("") @JsonKey(name: "updated_at") String updatedAt,
    @Default("") @JsonKey(name: "currency_name") String currencyName,
    @Default(0) @JsonKey(name: "to") int to,
  }) = _FromBinanceRate;

  factory FromBinanceRate.fromJson(Map<String, dynamic> json) =>
      _$FromBinanceRateFromJson(json);
}
