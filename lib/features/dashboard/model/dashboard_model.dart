import 'dart:convert';

GetDashboardApiResModel getDashboardApiResModelFromJson(String str) =>
    GetDashboardApiResModel.fromJson(json.decode(str));

String getDashboardApiResModelToJson(GetDashboardApiResModel data) =>
    json.encode(data.toJson());

class GetDashboardApiResModel {
  final bool? status;
  final User? user;
  final List<Transfer>? transfers;
  final List<Currency>? exchangeRates;
  final List<SellingRate>? sellingRates;
  final List<BuyingRate>? buyingRates;
  final List<Currency>? currencies;
  final List<Rate>? rates;
  final Plan? plan;
  final int? commission;

  GetDashboardApiResModel({
    this.status,
    this.user,
    this.transfers,
    this.exchangeRates,
    this.sellingRates,
    this.buyingRates,
    this.currencies,
    this.rates,
    this.plan,
    this.commission,
  });

  factory GetDashboardApiResModel.fromJson(Map<String, dynamic> json) =>
      GetDashboardApiResModel(
        status: json["status"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        transfers: json["transfers"] == null
            ? []
            : List<Transfer>.from(
                json["transfers"]!.map((x) => Transfer.fromJson(x))),
        exchangeRates: json["exchange_rates"] == null
            ? []
            : List<Currency>.from(
                json["exchange_rates"]!.map((x) => Currency.fromJson(x))),
        sellingRates: json["selling_rates"] == null
            ? []
            : List<SellingRate>.from(
                json["selling_rates"]!.map((x) => SellingRate.fromJson(x))),
        buyingRates: json["buying_rates"] == null
            ? []
            : List<BuyingRate>.from(
                json["buying_rates"]!.map((x) => BuyingRate.fromJson(x))),
        currencies: json["currencies"] == null
            ? []
            : List<Currency>.from(
                json["currencies"]!.map((x) => Currency.fromJson(x))),
        rates: json["rates"] == null
            ? []
            : List<Rate>.from(json["rates"]!.map((x) => Rate.fromJson(x))),
        plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
        commission: json["commission"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user?.toJson(),
        "transfers": transfers == null
            ? []
            : List<dynamic>.from(transfers!.map((x) => x.toJson())),
        "exchange_rates": exchangeRates == null
            ? []
            : List<dynamic>.from(exchangeRates!.map((x) => x.toJson())),
        "selling_rates": sellingRates == null
            ? []
            : List<dynamic>.from(sellingRates!.map((x) => x.toJson())),
        "buying_rates": buyingRates == null
            ? []
            : List<dynamic>.from(buyingRates!.map((x) => x.toJson())),
        "currencies": currencies == null
            ? []
            : List<dynamic>.from(currencies!.map((x) => x.toJson())),
        "rates": rates == null
            ? []
            : List<dynamic>.from(rates!.map((x) => x.toJson())),
        "plan": plan?.toJson(),
        "commission": commission,
      };
}

class BuyingRate {
  final String? selling;
  final String? updatedAt;
  final int? to;

  BuyingRate({
    this.selling,
    this.updatedAt,
    this.to,
  });

  factory BuyingRate.fromJson(Map<String, dynamic> json) => BuyingRate(
        selling: json["selling"],
        updatedAt: json["updated_at"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "selling": selling,
        "updated_at": updatedAt,
        "to": to,
      };
}

class Currency {
  final int? id;
  final String? status;
  final String? name;
  final String? nameCode;
  final String? comment;
  final String? createdAt;
  final String? updatedAt;

  Currency({
    this.id,
    this.status,
    this.name,
    this.nameCode,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        status: json["status"],
        name: json["name"],
        nameCode: json["name_code"],
        comment: json["comment"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "name": name,
        "name_code": nameCode,
        "comment": comment,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Plan {
  final int? id;
  final String? name;
  final int? amount;
  final int? userAmountPerReferal;
  final int? referedAmount;
  final int? amountAfterCount;
  final int? count;
  final int? transferCommission;
  final int? discount;
  final String? discountType;
  final int? dailyTransferCount;
  final int? monthlyTransferCount;
  final int? maxTransferCount;
  final String? createdAt;
  final String? updatedAt;

  Plan({
    this.id,
    this.name,
    this.amount,
    this.userAmountPerReferal,
    this.referedAmount,
    this.amountAfterCount,
    this.count,
    this.transferCommission,
    this.discount,
    this.discountType,
    this.dailyTransferCount,
    this.monthlyTransferCount,
    this.maxTransferCount,
    this.createdAt,
    this.updatedAt,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        name: json["name"],
        amount: json["amount"],
        userAmountPerReferal: json["user_amount_per_referal"],
        referedAmount: json["refered_amount"],
        amountAfterCount: json["amount_after_count"],
        count: json["count"],
        transferCommission: json["transfer_commission"],
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

class Rate {
  final int? id;
  final bool? status;
  final int? planId;
  final int? from;
  final int? to;
  final String? selling;
  final String? buying;
  final String? createdAt;
  final String? updatedAt;

  Rate({
    this.id,
    this.status,
    this.planId,
    this.from,
    this.to,
    this.selling,
    this.buying,
    this.createdAt,
    this.updatedAt,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        id: json["id"],
        status: json["status"],
        planId: json["plan_id"],
        from: json["from"],
        to: json["to"],
        selling: json["selling"],
        buying: json["buying"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "plan_id": planId,
        "from": from,
        "to": to,
        "selling": selling,
        "buying": buying,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class SellingRate {
  final String? selling;
  final String? updatedAt;
  final int? from;

  SellingRate({
    this.selling,
    this.updatedAt,
    this.from,
  });

  factory SellingRate.fromJson(Map<String, dynamic> json) => SellingRate(
        selling: json["selling"],
        updatedAt: json["updated_at"],
        from: json["from"],
      );

  Map<String, dynamic> toJson() => {
        "selling": selling,
        "updated_at": updatedAt,
        "from": from,
      };
}

class Transfer {
  final int? id;
  final String? status;
  final int? amount;
  final int? netAmount;
  final int? rate;
  final dynamic message;
  final String? image;
  final dynamic address;
  final int? employeeId;
  final int? userId;
  final int? senderCurrencyId;
  final int? receiverCurrencyId;
  final String? receiverAccount;
  final String? createdAt;
  final String? updatedAt;
  final ReceiverCurrency? receiverCurrency;

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
    this.receiverCurrency,
  });

  factory Transfer.fromJson(Map<String, dynamic> json) => Transfer(
        id: json["id"],
        status: json["status"],
        amount: json["amount"],
        netAmount: json["net_amount"],
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
        receiverCurrency: json["receiver_currency"] == null
            ? null
            : ReceiverCurrency.fromJson(json["receiver_currency"]),
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
        "receiver_currency": receiverCurrency?.toJson(),
      };
}

class ReceiverCurrency {
  final String? name;

  ReceiverCurrency({
    this.name,
  });

  factory ReceiverCurrency.fromJson(Map<String, dynamic> json) =>
      ReceiverCurrency(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class User {
  final int? id;
  final String? name;
  final String? image;
  final double? balance;
  final int? planId;

  User({
    this.id,
    this.name,
    this.image,
    this.balance,
    this.planId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        balance: json["balance"]?.toDouble(),
        planId: json["plan_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "balance": balance,
        "plan_id": planId,
      };
}
