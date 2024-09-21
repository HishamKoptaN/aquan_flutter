import 'dart:convert';

GetWithdrawsApiResModel getWithdrawsApiResModelFromJson(String str) =>
    GetWithdrawsApiResModel.fromJson(json.decode(str));

String getWithdrawsApiResModelToJson(GetWithdrawsApiResModel data) =>
    json.encode(data.toJson());

class GetWithdrawsApiResModel {
  bool status;
  List<Withdraw> withdraws;

  GetWithdrawsApiResModel({
    required this.status,
    required this.withdraws,
  });

  factory GetWithdrawsApiResModel.fromJson(Map<String, dynamic> json) =>
      GetWithdrawsApiResModel(
        status: json["status"],
        withdraws: List<Withdraw>.from(
            json["withdraws"].map((x) => Withdraw.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "withdraws": List<dynamic>.from(withdraws.map((x) => x.toJson())),
      };
}

class Withdraw {
  int id;
  String status;
  int userId;
  int method;
  String receivingAccountNumber;
  double amount;
  String image;
  String comment;
  String createdAt;
  String updatedAt;
  Currency currency;

  Withdraw({
    required this.id,
    required this.status,
    required this.userId,
    required this.method,
    required this.receivingAccountNumber,
    required this.amount,
    required this.image,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.currency,
  });

  factory Withdraw.fromJson(Map<String, dynamic> json) => Withdraw(
        id: json["id"],
        status: json["status"],
        userId: json["user_id"],
        method: json["method"],
        receivingAccountNumber: json["receiving_account_number"],
        amount: json["amount"]?.toDouble(),
        image: json["image"],
        comment: json["comment"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        currency: Currency.fromJson(json["currency"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "user_id": userId,
        "method": method,
        "receiving_account_number": receivingAccountNumber,
        "amount": amount,
        "image": image,
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
