// To parse this JSON data, do
//
//     final buySellResModel = buySellResModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import '../../../../core/singletons/account.dart';
part 'buy_sell_model.freezed.dart';
part 'buy_sell_model.g.dart';

BuySellResModel buySellResModelFromJson(String str) =>
    BuySellResModel.fromJson(json.decode(str));

String buySellResModelToJson(BuySellResModel data) =>
    json.encode(data.toJson());

@freezed
class BuySellResModel with _$BuySellResModel {
  const factory BuySellResModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "buy_sell_status") bool? buySellStatus,
    @JsonKey(name: "buy_sell_message") String? buySellMessage,
    @JsonKey(name: "total_monthly_transfers") int? totalMonthlyTransfers,
    @JsonKey(name: "total_daily_transfers") int? totalDailyTransfers,
    @JsonKey(name: "user_plan_id") int? userPlanId,
    @JsonKey(name: "max_transfer_count") int? maxTransferCount,
    @JsonKey(name: "monthly_transfer_count") int? monthlyTransferCount,
    @JsonKey(name: "daily_transfer_count") int? dailyTransferCount,
    @JsonKey(name: "currencies") List<CurrencyElement>? currencies,
    @JsonKey(name: "rates") List<Rate>? rates,
    @JsonKey(name: "accounts") List<Account>? accounts,
  }) = _BuySellResModel;

  factory BuySellResModel.fromJson(Map<String, dynamic> json) =>
      _$BuySellResModelFromJson(json);
}

@freezed
class AccountCurrency with _$AccountCurrency {
  const factory AccountCurrency({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
  }) = _AccountCurrency;

  factory AccountCurrency.fromJson(Map<String, dynamic> json) =>
      _$AccountCurrencyFromJson(json);
}

@freezed
class CurrencyElement with _$CurrencyElement {
  const factory CurrencyElement({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "name_code") String? nameCode,
    @JsonKey(name: "comment") String? comment,
  }) = _CurrencyElement;

  factory CurrencyElement.fromJson(Map<String, dynamic> json) =>
      _$CurrencyElementFromJson(json);
}

@freezed
class Rate with _$Rate {
  const factory Rate({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "plan_id") int? planId,
    @JsonKey(name: "from") int? from,
    @JsonKey(name: "to") int? to,
    @JsonKey(name: "price") double? price,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _Rate;

  factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);
}
