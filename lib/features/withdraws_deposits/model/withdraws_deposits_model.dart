// To parse this JSON data, do
//
//     final getWithdrawDepositsApiResModel = getWithdrawDepositsApiResModelFromJson(jsonString);

import 'dart:convert';

GetWithdrawDepositsApiResModel getWithdrawDepositsApiResModelFromJson(
        String str) =>
    GetWithdrawDepositsApiResModel.fromJson(json.decode(str));

String getWithdrawDepositsApiResModelToJson(
        GetWithdrawDepositsApiResModel data) =>
    json.encode(data.toJson());

class GetWithdrawDepositsApiResModel {
  bool status;
  List<WithdrawsDeposit> withdrawsDeposits;

  GetWithdrawDepositsApiResModel({
    required this.status,
    required this.withdrawsDeposits,
  });

  factory GetWithdrawDepositsApiResModel.fromJson(Map<String, dynamic> json) =>
      GetWithdrawDepositsApiResModel(
        status: json["status"],
        withdrawsDeposits: List<WithdrawsDeposit>.from(
            json["withdraws_deposits"]
                .map((x) => WithdrawsDeposit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "withdraws_deposits":
            List<dynamic>.from(withdrawsDeposits.map((x) => x.toJson())),
      };
}

class WithdrawsDeposit {
  int id;
  String status;
  int userId;
  int method;
  String? receivingAccountNumber;
  double amount;
  String image;
  String comment;
  String createdAt;
  String updatedAt;
  String type;
  Currency currency;
  int? employeeId;

  WithdrawsDeposit({
    required this.id,
    required this.status,
    required this.userId,
    required this.method,
    this.receivingAccountNumber,
    required this.amount,
    required this.image,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
    required this.currency,
    this.employeeId,
  });

  factory WithdrawsDeposit.fromJson(Map<String, dynamic> json) =>
      WithdrawsDeposit(
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
        type: json["type"],
        currency: Currency.fromJson(json["currency"]),
        employeeId: json["employee_id"],
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
        "type": type,
        "currency": currency.toJson(),
        "employee_id": employeeId,
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
