// To parse this JSON data, do
//
//     final getDepositsApiResModel = getDepositsApiResModelFromJson(jsonString);

import 'dart:convert';

GetDepositsApiResModel getDepositsApiResModelFromJson(String str) =>
    GetDepositsApiResModel.fromJson(json.decode(str));

String getDepositsApiResModelToJson(GetDepositsApiResModel data) =>
    json.encode(data.toJson());

class GetDepositsApiResModel {
  bool status;
  List<Deposit> deposits;

  GetDepositsApiResModel({
    required this.status,
    required this.deposits,
  });

  factory GetDepositsApiResModel.fromJson(Map<String, dynamic> json) =>
      GetDepositsApiResModel(
        status: json["status"],
        deposits: List<Deposit>.from(
            json["deposits"].map((x) => Deposit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "deposits": List<dynamic>.from(deposits.map((x) => x.toJson())),
      };
}

class Deposit {
  int id;
  String status;
  int userId;
  int employeeId;
  int amount;
  int method;
  String image;
  String comment;
  String createdAt;
  String updatedAt;
  Currency currency;

  Deposit({
    required this.id,
    required this.status,
    required this.userId,
    required this.employeeId,
    required this.amount,
    required this.method,
    required this.image,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.currency,
  });

  factory Deposit.fromJson(Map<String, dynamic> json) => Deposit(
        id: json["id"],
        status: json["status"],
        userId: json["user_id"],
        employeeId: json["employee_id"],
        amount: json["amount"],
        method: json["method"],
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
        "employee_id": employeeId,
        "amount": amount,
        "method": method,
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
