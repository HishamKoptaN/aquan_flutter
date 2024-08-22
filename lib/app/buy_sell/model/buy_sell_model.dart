// To parse this JSON data, do
//
//     final buySellApiRes = buySellApiResFromJson(jsonString);

import 'dart:convert';

BuySellApiRes buySellApiResFromJson(String str) =>
    BuySellApiRes.fromJson(json.decode(str));

String buySellApiResToJson(BuySellApiRes data) => json.encode(data.toJson());

class BuySellApiRes {
  bool? status;
  bool? buySellStatus;
  List<Currency>? currencies;
  List<Rate>? rates;
  List<AccountInfo>? accountInfo;
  int? userPlanId;

  BuySellApiRes({
    this.status,
    this.buySellStatus,
    this.currencies,
    this.rates,
    this.accountInfo,
    this.userPlanId,
  });

  factory BuySellApiRes.fromJson(Map<String, dynamic> json) => BuySellApiRes(
        status: json["status"],
        buySellStatus: json["buy_sell_status"],
        currencies: json["currencies"] == null
            ? []
            : List<Currency>.from(
                json["currencies"]!.map((x) => Currency.fromJson(x))),
        rates: json["rates"] == null
            ? []
            : List<Rate>.from(json["rates"]!.map((x) => Rate.fromJson(x))),
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
        "rates": rates == null
            ? []
            : List<dynamic>.from(rates!.map((x) => x.toJson())),
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
  String? accountHolder;

  AccountInfo({
    this.currency,
    this.value,
    this.comment,
    this.accountHolder,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) => AccountInfo(
        currency: json["currency"],
        value: json["value"],
        comment: json["comment"],
        accountHolder: json["account_holder"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "value": value,
        "comment": comment,
        "account_holder": accountHolder,
      };
}

class Currency {
  int? id;
  String? name;
  String? nameCode;
  String? comment;
  PaymentInfo? paymentInfo;
  dynamic updatedDate;

  Currency({
    this.id,
    this.name,
    this.nameCode,
    this.comment,
    this.paymentInfo,
    this.updatedDate,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        name: json["name"],
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
  int? id;
  bool? status;
  int? planId;
  int? currencyId;
  String? currencyName;
  String? selling;
  String? buying;
  String? createdAt;
  String? updatedAt;
  RateCurrency? currency;

  Rate({
    this.id,
    this.status,
    this.planId,
    this.currencyId,
    this.currencyName,
    this.selling,
    this.buying,
    this.createdAt,
    this.updatedAt,
    this.currency,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        id: json["id"],
        status: json["status"],
        planId: json["plan_id"],
        currencyId: json["currency_id"],
        currencyName: json["currency_name"],
        selling: json["selling"],
        buying: json["buying"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        currency: json["currency"] == null
            ? null
            : RateCurrency.fromJson(json["currency"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "plan_id": planId,
        "currency_id": currencyId,
        "currency_name": currencyName,
        "selling": selling,
        "buying": buying,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "currency": currency?.toJson(),
      };
}

class RateCurrency {
  int? id;
  String? status;
  String? name;
  String? nameCode;
  PaymentInfo? paymentInfo;
  String? comment;
  String? createdAt;
  String? updatedAt;
  DateTime? updatedDate;

  RateCurrency({
    this.id,
    this.status,
    this.name,
    this.nameCode,
    this.paymentInfo,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.updatedDate,
  });

  factory RateCurrency.fromJson(Map<String, dynamic> json) => RateCurrency(
        id: json["id"],
        status: json["status"],
        name: json["name"],
        nameCode: json["name_code"],
        paymentInfo: json["payment_info"] == null
            ? null
            : PaymentInfo.fromJson(json["payment_info"]),
        comment: json["comment"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        updatedDate: json["updated_date"] == null
            ? null
            : DateTime.parse(json["updated_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "name": name,
        "name_code": nameCode,
        "payment_info": paymentInfo?.toJson(),
        "comment": comment,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "updated_date":
            "${updatedDate!.year.toString().padLeft(4, '0')}-${updatedDate!.month.toString().padLeft(2, '0')}-${updatedDate!.day.toString().padLeft(2, '0')}",
      };
}
