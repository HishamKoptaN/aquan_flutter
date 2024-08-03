import 'dart:convert';

// To parse this JSON data, do
//
//     final getUserAccounts = getUserAccountsFromJson(jsonString);

GetUserAccounts getUserAccountsFromJson(String str) =>
    GetUserAccounts.fromJson(json.decode(str));

String getUserAccountsToJson(GetUserAccounts data) =>
    json.encode(data.toJson());

class GetUserAccounts {
  bool status;
  List<AccountInfo> accountInfo;

  GetUserAccounts({
    required this.status,
    required this.accountInfo,
  });

  factory GetUserAccounts.fromJson(Map<String, dynamic> json) =>
      GetUserAccounts(
        status: json["status"] ?? false,
        accountInfo: List<AccountInfo>.from(
            json["accountInfo"].map((x) => AccountInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "accountInfo": List<dynamic>.from(accountInfo.map((x) => x.toJson())),
      };
}

class AccountInfo {
  String currency;
  int value;

  AccountInfo({
    required this.currency,
    required this.value,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) => AccountInfo(
        currency: json["currency"].toString(),
        value: int.tryParse(json["value"].toString()) ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "value": value,
      };
}
