import 'dart:convert';

GetPlansApiResModel getPlansApiResModelFromJson(String str) =>
    GetPlansApiResModel.fromJson(json.decode(str));

String getPlansApiResModelToJson(GetPlansApiResModel data) =>
    json.encode(data.toJson());

class GetPlansApiResModel {
  bool status;
  List<Plan> plans;

  GetPlansApiResModel({
    required this.status,
    required this.plans,
  });

  factory GetPlansApiResModel.fromJson(Map<String, dynamic> json) =>
      GetPlansApiResModel(
        status: json["status"],
        plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
      };
}

class Plan {
  int id;
  String name;
  double amount;
  int userAmountPerReferal;
  int referedAmount;
  int amountAfterCount;
  int count;
  double transferCommission;
  int discount;
  String? discountType;
  int dailyTransferCount;
  int monthlyTransferCount;
  int maxTransferCount;
  String createdAt;
  String updatedAt;

  Plan({
    required this.id,
    required this.name,
    required this.amount,
    required this.userAmountPerReferal,
    required this.referedAmount,
    required this.amountAfterCount,
    required this.count,
    required this.transferCommission,
    required this.discount,
    required this.discountType,
    required this.dailyTransferCount,
    required this.monthlyTransferCount,
    required this.maxTransferCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        name: json["name"],
        amount: json["amount"]?.toDouble(),
        userAmountPerReferal: json["user_amount_per_referal"],
        referedAmount: json["refered_amount"],
        amountAfterCount: json["amount_after_count"],
        count: json["count"],
        transferCommission: json["transfer_commission"]?.toDouble(),
        discount: json["discount"],
        discountType: json["discount_type"],
        dailyTransferCount: json["daily_transfer_count"],
        monthlyTransferCount: json["monthly_transfer_count"],
        maxTransferCount: json["max_transfer_count"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
        "user_amount_per_referal": userAmountPerReferal,
        "refered_amount": referedAmount,
        "amount_after_count": amountAfterCount,
        "count": count,
        "transfer_commission": transferCommission,
        "discount": discount,
        "discount_type": discountType,
        "daily_transfer_count": dailyTransferCount,
        "monthly_transfer_count": monthlyTransferCount,
        "max_transfer_count": maxTransferCount,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
