class UserPlan {
  final String message;
  final Data data;
  final bool status;

  UserPlan({
    required this.message,
    required this.data,
    required this.status,
  });

  UserPlan copyWith({
    String? message,
    Data? data,
    bool? status,
  }) =>
      UserPlan(
        message: message ?? this.message,
        data: data ?? this.data,
        status: status ?? this.status,
      );
}

class Data {
  final int id;
  final int userId;
  final int planId;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Plan plan;

  Data({
    required this.id,
    required this.userId,
    required this.planId,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.plan,
  });

  Data copyWith({
    int? id,
    int? userId,
    int? planId,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    Plan? plan,
  }) =>
      Data(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        planId: planId ?? this.planId,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        plan: plan ?? this.plan,
      );
}

class Plan {
  final int id;
  final String name;
  final int amount;
  final int userAmountPerReferal;
  final int referedAmount;
  final int amountAfterCount;
  final int count;
  final int discount;
  final String discountType;
  final int dailyTransferCount;
  final int monthlyTransferCount;
  final int maxTransferCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String amountFormated;

  Plan({
    required this.id,
    required this.name,
    required this.amount,
    required this.userAmountPerReferal,
    required this.referedAmount,
    required this.amountAfterCount,
    required this.count,
    required this.discount,
    required this.discountType,
    required this.dailyTransferCount,
    required this.monthlyTransferCount,
    required this.maxTransferCount,
    required this.createdAt,
    required this.updatedAt,
    required this.amountFormated,
  });

  Plan copyWith({
    int? id,
    String? name,
    int? amount,
    int? userAmountPerReferal,
    int? referedAmount,
    int? amountAfterCount,
    int? count,
    int? discount,
    String? discountType,
    int? dailyTransferCount,
    int? monthlyTransferCount,
    int? maxTransferCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? amountFormated,
  }) =>
      Plan(
        id: id ?? this.id,
        name: name ?? this.name,
        amount: amount ?? this.amount,
        userAmountPerReferal: userAmountPerReferal ?? this.userAmountPerReferal,
        referedAmount: referedAmount ?? this.referedAmount,
        amountAfterCount: amountAfterCount ?? this.amountAfterCount,
        count: count ?? this.count,
        discount: discount ?? this.discount,
        discountType: discountType ?? this.discountType,
        dailyTransferCount: dailyTransferCount ?? this.dailyTransferCount,
        monthlyTransferCount: monthlyTransferCount ?? this.monthlyTransferCount,
        maxTransferCount: maxTransferCount ?? this.maxTransferCount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        amountFormated: amountFormated ?? this.amountFormated,
      );
}
