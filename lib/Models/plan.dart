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
  String? amountFormated;
  double? sellingPrice;
  double? buyingPrice;
  String? createdAt;
  String? updatedAt;

  Plan(
      {id,
      name,
      amount,
      userAmountPerReferal,
      referedAmount,
      amountAfterCount,
      count,
      discount,
      discountType,
      dailyTransferCount,
      monthlyTransferCount,
      maxTransferCount,
      createdAt,
      updatedAt});

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
    userAmountPerReferal = json['user_amount_per_referal'];
    referedAmount = json['refered_amount'];
    amountAfterCount = json['amount_after_count'];
    count = json['count'];
    discount = json['discount'];
    discountType = json['discount_type'];
    dailyTransferCount = json['daily_transfer_count'];
    monthlyTransferCount = json['monthly_transfer_count'];
    maxTransferCount = json['max_transfer_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    amountFormated = json['amount_formated'];
    sellingPrice = json['selling_price'];
    buyingPrice = json['buying_price'];
  }
}
