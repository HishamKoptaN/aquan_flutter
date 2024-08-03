// To parse this JSON data, do
//
//     final getPaymentPlanMethodApiResModel = getPaymentPlanMethodApiResModelFromJson(jsonString);

import 'dart:convert';

GetPaymentPlanMethodApiResModel getPaymentPlanMethodApiResModelFromJson(
        String str) =>
    GetPaymentPlanMethodApiResModel.fromJson(json.decode(str));

String getPaymentPlanMethodApiResModelToJson(
        GetPaymentPlanMethodApiResModel data) =>
    json.encode(data.toJson());

class GetPaymentPlanMethodApiResModel {
  bool? status;
  List<AccountInfo>? accountInfo;

  GetPaymentPlanMethodApiResModel({
    this.status,
    this.accountInfo,
  });

  factory GetPaymentPlanMethodApiResModel.fromJson(Map<String, dynamic> json) =>
      GetPaymentPlanMethodApiResModel(
        status: json["status"],
        accountInfo: json["account_info "] == null
            ? []
            : List<AccountInfo>.from(
                json["account_info "]!.map((x) => AccountInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "account_info ": accountInfo == null
            ? []
            : List<dynamic>.from(accountInfo!.map((x) => x.toJson())),
      };
}

class AccountInfo {
  String? currency;
  int? value;

  AccountInfo({
    this.currency,
    this.value,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) => AccountInfo(
        currency: json["currency"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "value": value,
      };
}
