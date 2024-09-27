import 'dart:convert';

ReceivedAccountNumberApiRes receivedAccountNumberApiResFromJson(String str) =>
    ReceivedAccountNumberApiRes.fromJson(json.decode(str));

String receivedAccountNumberApiResToJson(ReceivedAccountNumberApiRes data) =>
    json.encode(data.toJson());

class ReceivedAccountNumberApiRes {
  bool? status;
  Account? account;

  ReceivedAccountNumberApiRes({
    this.status,
    this.account,
  });

  factory ReceivedAccountNumberApiRes.fromJson(Map<String, dynamic> json) =>
      ReceivedAccountNumberApiRes(
        status: json["status"],
        account:
            json["account"] == null ? null : Account.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "account": account?.toJson(),
      };
}

class Account {
  int? id;
  int? userId;
  int? bankId;
  String? accountNumber;
  String? comment;
  String? createdAt;
  String? updatedAt;
  Currency? currency;

  Account({
    this.id,
    this.userId,
    this.bankId,
    this.accountNumber,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.currency,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        userId: json["user_id"],
        bankId: json["bank_id"],
        accountNumber: json["account_number"],
        comment: json["comment"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        currency: json["currency"] == null
            ? null
            : Currency.fromJson(json["currency"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "bank_id": bankId,
        "account_number": accountNumber,
        "comment": comment,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "currency": currency?.toJson(),
      };
}

class Currency {
  int? id;
  String? name;

  Currency({
    this.id,
    this.name,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
