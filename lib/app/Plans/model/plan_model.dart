// To parse this JSON data, do
//
//     final getPlansApiResModel = getPlansApiResModelFromJson(jsonString);

import 'dart:convert';

GetPlansApiResModel getPlansApiResModelFromJson(String str) =>
    GetPlansApiResModel.fromJson(json.decode(str));

String getPlansApiResModelToJson(GetPlansApiResModel data) =>
    json.encode(data.toJson());

class GetPlansApiResModel {
  bool? status;
  List<Plan>? plans;

  GetPlansApiResModel({
    this.status,
    this.plans,
  });

  factory GetPlansApiResModel.fromJson(Map<String, dynamic> json) =>
      GetPlansApiResModel(
        status: json["status"],
        plans: json["plans"] == null
            ? []
            : List<Plan>.from(json["plans"]!.map((x) => Plan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "plans": plans == null
            ? []
            : List<dynamic>.from(plans!.map((x) => x.toJson())),
      };
}

class Plan {
  int? id;
  String? name;
  int? amount;
  int? userAmountPerReferal;
  int? referedAmount;
  int? amountAfterCount;
  int? count;
  int? discount;
  String? discountType;
  int? dailyTransferCount;
  int? monthlyTransferCount;
  int? maxTransferCount;
  String? createdAt;
  String? updatedAt;
  String? amountFormated;

  Plan({
    this.id,
    this.name,
    this.amount,
    this.userAmountPerReferal,
    this.referedAmount,
    this.amountAfterCount,
    this.count,
    this.discount,
    this.discountType,
    this.dailyTransferCount,
    this.monthlyTransferCount,
    this.maxTransferCount,
    this.createdAt,
    this.updatedAt,
    this.amountFormated,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        name: json["name"],
        amount: json["amount"],
        userAmountPerReferal: json["user_amount_per_referal"],
        referedAmount: json["refered_amount"],
        amountAfterCount: json["amount_after_count"],
        count: json["count"],
        discount: json["discount"],
        discountType: json["discount_type"],
        dailyTransferCount: json["daily_transfer_count"],
        monthlyTransferCount: json["monthly_transfer_count"],
        maxTransferCount: json["max_transfer_count"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        amountFormated: json["amount_formated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
        "user_amount_per_referal": userAmountPerReferal,
        "refered_amount": referedAmount,
        "amount_after_count": amountAfterCount,
        "count": count,
        "discount": discount,
        "discount_type": discountType,
        "daily_transfer_count": dailyTransferCount,
        "monthly_transfer_count": monthlyTransferCount,
        "max_transfer_count": maxTransferCount,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "amount_formated": amountFormated,
      };
}
