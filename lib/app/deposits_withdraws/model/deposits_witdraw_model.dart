import 'dart:convert';

GetWithdrawDepositsApiResModel getWithdrawDepositsApiResModelFromJson(
        String str) =>
    GetWithdrawDepositsApiResModel.fromJson(json.decode(str));

String getWithdrawDepositsApiResModelToJson(
        GetWithdrawDepositsApiResModel data) =>
    json.encode(data.toJson());

class GetWithdrawDepositsApiResModel {
  bool? status;
  List<Invoice>? invoices;

  GetWithdrawDepositsApiResModel({
    this.status,
    this.invoices,
  });

  factory GetWithdrawDepositsApiResModel.fromJson(Map<String, dynamic> json) =>
      GetWithdrawDepositsApiResModel(
        status: json["status"],
        invoices: json["invoices"] == null
            ? []
            : List<Invoice>.from(
                json["invoices"]!.map((x) => Invoice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "invoices": invoices == null
            ? []
            : List<dynamic>.from(invoices!.map((x) => x.toJson())),
      };
}

class Invoice {
  int? id;
  String? status;
  String? image;
  int? planId;
  String? type;
  double? amount;
  String? message;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? amountFormatted;
  DateTime? createdDate;

  Invoice({
    this.id,
    this.status,
    this.image,
    this.planId,
    this.type,
    this.amount,
    this.message,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.amountFormatted,
    this.createdDate,
  });
  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        id: json["id"] is int ? json["id"] : int.tryParse(json["id"] ?? "0"),
        status: json["status"] ?? "",
        image: json["image"] ?? "",
        planId: json["plan_id"] is int
            ? json["plan_id"]
            : int.tryParse(json["plan_id"] ?? "0"),
        type: json["type"] ?? "",
        amount: json["amount"] is double
            ? json["amount"].toDouble()
            : double.tryParse(json["amount"]?.toString() ?? "0.0"),
        message: json["message"] ?? "",
        userId: json["user_id"] is int
            ? json["user_id"]
            : int.tryParse(json["user_id"] ?? "0"),
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        amountFormatted: json["amount_formatted"] ?? "",
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "image": image,
        "plan_id": planId,
        "type": type,
        "amount": amount,
        "message": message,
        "user_id": userId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "amount_formatted": amountFormatted,
        "created_date":
            "${createdDate!.year.toString().padLeft(4, '0')}-${createdDate!.month.toString().padLeft(2, '0')}-${createdDate!.day.toString().padLeft(2, '0')}",
      };
}
