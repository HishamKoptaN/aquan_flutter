import 'dart:convert';

GetUserAccounts getUserAccountsFromJson(String str) =>
    GetUserAccounts.fromJson(json.decode(str));

String getUserAccountsToJson(GetUserAccounts data) =>
    json.encode(data.toJson());

class GetUserAccounts {
  bool status;
  List<Account> accounts;

  GetUserAccounts({
    required this.status,
    required this.accounts,
  });

  factory GetUserAccounts.fromJson(Map<String, dynamic> json) =>
      GetUserAccounts(
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
  int id;
  int userId;
  int bankId;
  dynamic accountNumber;
  String comment;
  String createdAt;
  String updatedAt;
  Currency currency;

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
  String name;

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
