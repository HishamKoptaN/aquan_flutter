import 'dart:convert';

GetWithdrawRateApiResModel getWithdrawRateApiResModelFromJson(String str) =>
    GetWithdrawRateApiResModel.fromJson(json.decode(str));

String getWithdrawRateApiResModelToJson(GetWithdrawRateApiResModel data) =>
    json.encode(data.toJson());

class GetWithdrawRateApiResModel {
  final bool? status;
  final int? totalWithdrawals;
  final List<FromBinanceRate>? fromBinanceRates;

  GetWithdrawRateApiResModel({
    this.status,
    this.totalWithdrawals,
    this.fromBinanceRates,
  });

  factory GetWithdrawRateApiResModel.fromJson(Map<String, dynamic> json) =>
      GetWithdrawRateApiResModel(
        status: json["status"],
        totalWithdrawals: json["total_withdrawals"],
        fromBinanceRates: json["from_binance_rates"] == null
            ? []
            : List<FromBinanceRate>.from(json["from_binance_rates"]!
                .map((x) => FromBinanceRate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "total_withdrawals": totalWithdrawals,
        "from_binance_rates": fromBinanceRates == null
            ? []
            : List<dynamic>.from(fromBinanceRates!.map((x) => x.toJson())),
      };
}

class FromBinanceRate {
  final double? price;
  final String? updatedAt;
  final String? currencyName;
  final int? to;

  FromBinanceRate({
    this.price,
    this.updatedAt,
    this.currencyName,
    this.to,
  });

  factory FromBinanceRate.fromJson(Map<String, dynamic> json) =>
      FromBinanceRate(
        price: json["price"],
        updatedAt: json["updated_at"],
        currencyName: json["currency_name"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "updated_at": updatedAt,
        "currency_name": currencyName,
        "to": to,
      };
}
