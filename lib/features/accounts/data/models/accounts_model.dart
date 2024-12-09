import 'dart:convert';

import '../../../../core/models/currency.dart';
import '../../../../core/singletons/account.dart';

GetBuySellApiRes getBuySellApiResFromJson(String str) =>
    GetBuySellApiRes.fromJson(json.decode(str));

String getBuySellApiResToJson(GetBuySellApiRes data) =>
    json.encode(data.toJson());

class GetBuySellApiRes {
  final bool status;
  final List<Account> accounts;

  GetBuySellApiRes({
    required this.status,
    required this.accounts,
  });

  factory GetBuySellApiRes.fromJson(Map<String, dynamic> json) =>
      GetBuySellApiRes(
        status: json["status"],
        accounts: List<Account>.from(
            json["accounts"].map((x) => Account.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "accounts": List<dynamic>.from(accounts.map((x) => x.toJson())),
      };
}
