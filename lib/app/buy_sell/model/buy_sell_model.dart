// To parse this JSON data, do
//
//     final buySellAPiRes = buySellAPiResFromJson(jsonString);

import 'dart:convert';

BuySellAPiRes buySellAPiResFromJson(String str) =>
    BuySellAPiRes.fromJson(json.decode(str));

String buySellAPiResToJson(BuySellAPiRes data) => json.encode(data.toJson());

class BuySellAPiRes {
  bool? status;
  bool? buySellStatus;
  List<Currency>? currencies;
  List<AccountInfo>? accountInfo;
  int? userPlanId;

  BuySellAPiRes({
    this.status,
    this.buySellStatus,
    this.currencies,
    this.accountInfo,
    this.userPlanId,
  });

  factory BuySellAPiRes.fromJson(Map<String, dynamic> json) => BuySellAPiRes(
        status: json["status"],
        buySellStatus: json["buy_sell_status"],
        currencies: json["currencies"] == null
            ? []
            : List<Currency>.from(
                json["currencies"]!.map((x) => Currency.fromJson(x))),
        accountInfo: json["account_info"] == null
            ? []
            : List<AccountInfo>.from(
                json["account_info"]!.map((x) => AccountInfo.fromJson(x))),
        userPlanId: json["user_plan_id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "buy_sell_status": buySellStatus,
        "currencies": currencies == null
            ? []
            : List<dynamic>.from(currencies!.map((x) => x.toJson())),
        "account_info": accountInfo == null
            ? []
            : List<dynamic>.from(accountInfo!.map((x) => x.toJson())),
        "user_plan_id": userPlanId,
      };
}

class AccountInfo {
  String? currency;
  int? value;
  String? comment;

  AccountInfo({
    this.currency,
    this.value,
    this.comment,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) => AccountInfo(
        currency: json["currency"],
        value: json["value"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "value": value,
        "comment": comment,
      };
}

class Currency {
  int? id;
  String? name;
  Map<String, Map<String, Rate>>? rates;
  String? nameCode;
  String? comment;
  PaymentInfo? paymentInfo;
  dynamic updatedDate;

  Currency({
    this.id,
    this.name,
    this.rates,
    this.nameCode,
    this.comment,
    this.paymentInfo,
    this.updatedDate,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        name: json["name"],
        rates: Map.from(json["rates"]!).map((k, v) =>
            MapEntry<String, Map<String, Rate>>(
                k,
                Map.from(v).map(
                    (k, v) => MapEntry<String, Rate>(k, Rate.fromJson(v))))),
        nameCode: json["name_code"],
        comment: json["comment"],
        paymentInfo: json["payment_info"] == null
            ? null
            : PaymentInfo.fromJson(json["payment_info"]),
        updatedDate: json["updated_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rates": Map.from(rates!).map((k, v) => MapEntry<String, dynamic>(
            k,
            Map.from(v)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
        "name_code": nameCode,
        "comment": comment,
        "payment_info": paymentInfo?.toJson(),
        "updated_date": updatedDate,
      };
}

class PaymentInfo {
  String? name;
  String? accountId;

  PaymentInfo({
    this.name,
    this.accountId,
  });

  factory PaymentInfo.fromJson(Map<String, dynamic> json) => PaymentInfo(
        name: json["name"],
        accountId: json["accountId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "accountId": accountId,
      };
}

class Rate {
  String? currencyName;
  String? status;
  double? selling;
  double? buying;

  Rate({
    this.currencyName,
    this.status,
    this.selling,
    this.buying,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        currencyName: json["currency_name"],
        status: json["status"],
        selling: json["selling"]?.toDouble(),
        buying: json["buying"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "currency_name": currencyName,
        "status": status,
        "selling": selling,
        "buying": buying,
      };
}
