import 'dart:convert';

GetTransactionsApiResModel getTransactionsApiResModelFromJson(String str) =>
    GetTransactionsApiResModel.fromJson(json.decode(str));

String getTransactionsApiResModelToJson(GetTransactionsApiResModel data) =>
    json.encode(data.toJson());

class GetTransactionsApiResModel {
  bool? status;
  List<Transfer>? transfers;

  GetTransactionsApiResModel({
    this.status,
    this.transfers,
  });

  factory GetTransactionsApiResModel.fromJson(Map<String, dynamic> json) =>
      GetTransactionsApiResModel(
        status: json["status"],
        transfers: json["transfers"] == null
            ? []
            : List<Transfer>.from(
                json["transfers"]!.map((x) => Transfer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "transfers": transfers == null
            ? []
            : List<dynamic>.from(transfers!.map((x) => x.toJson())),
      };
}

class Transfer {
  int? id;
  String? status;
  int? amount;
  double? netAmount;
  int? rate;
  String? message;
  String? image;
  String? address;
  int? employeeId;
  int? userId;
  int? senderCurrencyId;
  int? receiverCurrencyId;
  String? receiverAccount;
  String? createdAt;
  String? updatedAt;
  ErCurrency? senderCurrency;
  ErCurrency? receiverCurrency;

  Transfer({
    this.id,
    this.status,
    this.amount,
    this.netAmount,
    this.rate,
    this.message,
    this.image,
    this.address,
    this.employeeId,
    this.userId,
    this.senderCurrencyId,
    this.receiverCurrencyId,
    this.receiverAccount,
    this.createdAt,
    this.updatedAt,
    this.senderCurrency,
    this.receiverCurrency,
  });

  factory Transfer.fromJson(Map<String, dynamic> json) => Transfer(
        id: json["id"],
        status: json["status"],
        amount: json["amount"],
        netAmount: json["net_amount"]?.toDouble(),
        rate: json["rate"],
        message: json["message"],
        image: json["image"],
        address: json["address"],
        employeeId: json["employee_id"],
        userId: json["user_id"],
        senderCurrencyId: json["sender_currency_id"],
        receiverCurrencyId: json["receiver_currency_id"],
        receiverAccount: json["receiver_account"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        senderCurrency: json["sender_currency"] == null
            ? null
            : ErCurrency.fromJson(json["sender_currency"]),
        receiverCurrency: json["receiver_currency"] == null
            ? null
            : ErCurrency.fromJson(json["receiver_currency"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "amount": amount,
        "net_amount": netAmount,
        "rate": rate,
        "message": message,
        "image": image,
        "address": address,
        "employee_id": employeeId,
        "user_id": userId,
        "sender_currency_id": senderCurrencyId,
        "receiver_currency_id": receiverCurrencyId,
        "receiver_account": receiverAccount,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "sender_currency": senderCurrency?.toJson(),
        "receiver_currency": receiverCurrency?.toJson(),
      };
}

class ErCurrency {
  String? name;

  ErCurrency({
    this.name,
  });

  factory ErCurrency.fromJson(Map<String, dynamic> json) => ErCurrency(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
