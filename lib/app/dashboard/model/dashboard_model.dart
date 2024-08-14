// To parse this JSON data, do
//
//     final getDashboardApiResModel = getDashboardApiResModelFromJson(jsonString);

import 'dart:convert';

GetDashboardApiResModel getDashboardApiResModelFromJson(String str) =>
    GetDashboardApiResModel.fromJson(json.decode(str));

String getDashboardApiResModelToJson(GetDashboardApiResModel data) =>
    json.encode(data.toJson());

class GetDashboardApiResModel {
  bool? status;
  List<TransactionDashboard>? transactions;
  List<CurrencyDashboard>? currencies;

  GetDashboardApiResModel({
    this.status,
    this.transactions,
    this.currencies,
  });

  factory GetDashboardApiResModel.fromJson(Map<String, dynamic> json) =>
      GetDashboardApiResModel(
        status: json["status"],
        transactions: json["transactions"] == null
            ? []
            : List<TransactionDashboard>.from(json["transactions"]!
                .map((x) => TransactionDashboard.fromJson(x))),
        currencies: json["currencies"] == null
            ? []
            : List<CurrencyDashboard>.from(
                json["currencies"]!.map((x) => CurrencyDashboard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "transactions": transactions == null
            ? []
            : List<dynamic>.from(transactions!.map((x) => x.toJson())),
        "currencies": currencies == null
            ? []
            : List<dynamic>.from(currencies!.map((x) => x.toJson())),
      };
}

class CurrencyDashboard {
  String? name;
  double? sellingRate;
  double? buyingRate;
  String? updatedAt;

  CurrencyDashboard({
    this.name,
    this.sellingRate,
    this.buyingRate,
    this.updatedAt,
  });

  factory CurrencyDashboard.fromJson(Map<String, dynamic> json) =>
      CurrencyDashboard(
        name: json["name"],
        sellingRate: json["selling_rate"]?.toDouble(),
        buyingRate: json["buying_rate"]?.toDouble(),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "selling_rate": sellingRate,
        "buying_rate": buyingRate,
        "updated_at": updatedAt,
      };
}

class TransactionDashboard {
  late int? id;
  late String? status;
  late int? amount;
  late double? rate;
  late String? message;
  late String? image;
  late String? address;
  late int? employeeId;
  late int? userId;
  late int? senderCurrencyId;
  late int? receiverCurrencyId;
  late String? createdAt;
  late String? updatedAt;
  late String? amountFormated;
  late DateTime? createdDate;

  TransactionDashboard({
    this.id,
    this.status,
    this.amount,
    this.rate,
    this.message,
    this.image,
    this.address,
    this.employeeId,
    this.userId,
    this.senderCurrencyId,
    this.receiverCurrencyId,
    this.createdAt,
    this.updatedAt,
    this.amountFormated,
    this.createdDate,
  });

  factory TransactionDashboard.fromJson(Map<String, dynamic> json) =>
      TransactionDashboard(
        id: json["id"],
        status: json["status"],
        amount: json["amount"],
        rate: json["rate"]?.toDouble(),
        message: json["message"],
        image: json["image"],
        address: json["address"],
        employeeId: json["employee_id"],
        userId: json["user_id"],
        senderCurrencyId: json["sender_currency_id"],
        receiverCurrencyId: json["receiver_currency_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        amountFormated: json["amount_formated"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "amount": amount,
        "rate": rate,
        "message": message,
        "image": image,
        "address": address,
        "employee_id": employeeId,
        "user_id": userId,
        "sender_currency_id": senderCurrencyId,
        "receiver_currency_id": receiverCurrencyId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "amount_formated": amountFormated,
        "created_date":
            "${createdDate!.year.toString().padLeft(4, '0')}-${createdDate!.month.toString().padLeft(2, '0')}-${createdDate!.day.toString().padLeft(2, '0')}",
      };
}
