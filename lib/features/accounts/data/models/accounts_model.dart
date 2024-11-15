import 'dart:convert';

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

class Account {
  final int id;
  final int userId;
  final int bankId;
  String accountNumber;
  final String comment;
  final String createdAt;
  final String updatedAt;
  final Currency currency;

  Account({
    required this.id,
    required this.userId,
    required this.bankId,
    required this.accountNumber,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.currency,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        userId: json["user_id"],
        bankId: json["bank_id"],
        accountNumber: json["account_number"],
        comment: json["comment"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        currency: Currency.fromJson(json["currency"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "bank_id": bankId,
        "account_number": accountNumber,
        "comment": comment,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "currency": currency.toJson(),
      };
}

class Currency {
  final String name;

  Currency({
    required this.name,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
