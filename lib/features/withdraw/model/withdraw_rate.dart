import 'dart:convert';

GetWithdrawRateApiResModel getWithdrawRateApiResModelFromJson(String str) =>
    GetWithdrawRateApiResModel.fromJson(json.decode(str));

String getWithdrawRateApiResModelToJson(GetWithdrawRateApiResModel data) =>
    json.encode(data.toJson());

class GetWithdrawRateApiResModel {
  bool? status;
  int? totalWithdrawals;
  List<FromBinanceRate>? fromBinanceRates;

  GetWithdrawRateApiResModel({
    this.status,
    this.totalWithdrawals,
    this.fromBinanceRates,
  });
  factory GetWithdrawRateApiResModel.fromJson(Map<String, dynamic> json) =>
      GetWithdrawRateApiResModel(
        status: json["status"],
        totalWithdrawals: json["total_withdrawals"],
        fromBinanceRates: List<FromBinanceRate>.from(
            json["from_binance_rates"].map((x) => FromBinanceRate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "total_withdrawals": totalWithdrawals,
        "from_binance_rates":
            List<dynamic>.from(fromBinanceRates!.map((x) => x.toJson())),
      };
}

class FromBinanceRate {
  String selling;
  String updatedAt;
  String currencyName;
  int to;

  FromBinanceRate({
    required this.selling,
    required this.updatedAt,
    required this.currencyName,
    required this.to,
  });

  factory FromBinanceRate.fromJson(Map<String, dynamic> json) =>
      FromBinanceRate(
        selling: json["selling"],
        updatedAt: json["updated_at"],
        currencyName: json["currency_name"],
        to: json["to"],
      );
  Map<String, dynamic> toJson() => {
        "selling": selling,
        "updated_at": updatedAt,
        "currency_name": currencyName,
        "to": to,
      };
}
