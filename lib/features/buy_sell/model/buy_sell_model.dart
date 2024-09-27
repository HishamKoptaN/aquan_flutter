import 'dart:convert';

GetBuySellApiRes getBuySellApiResFromJson(String str) =>
    GetBuySellApiRes.fromJson(json.decode(str));

String getBuySellApiResToJson(GetBuySellApiRes data) =>
    json.encode(data.toJson());

class GetBuySellApiRes {
  final bool status;
  final bool buySellStatus;
  final String buySellMessage;
  final int totalMonthlyTransfers;
  final int totalDailyTransfers;
  final int userPlanId;
  final int maxTransferCount;
  final int monthlyTransferCount;
  final int dailyTransferCount;
  final List<CurrencyElement> currencies;
  final List<Rate> rates;
  final List<Account> accounts;

  GetBuySellApiRes({
    required this.status,
    required this.buySellStatus,
    required this.buySellMessage,
    required this.totalMonthlyTransfers,
    required this.totalDailyTransfers,
    required this.userPlanId,
    required this.maxTransferCount,
    required this.monthlyTransferCount,
    required this.dailyTransferCount,
    required this.currencies,
    required this.rates,
    required this.accounts,
  });

  factory GetBuySellApiRes.fromJson(Map<String, dynamic> json) =>
      GetBuySellApiRes(
        status: json["status"],
        buySellStatus: json["buy_sell_status"],
        buySellMessage: json["buy_sell_message"],
        totalMonthlyTransfers: json["total_monthly_transfers"],
        totalDailyTransfers: json["total_daily_transfers"],
        userPlanId: json["user_plan_id"],
        maxTransferCount: json["max_transfer_count"],
        monthlyTransferCount: json["monthly_transfer_count"],
        dailyTransferCount: json["daily_transfer_count"],
        currencies: List<CurrencyElement>.from(
            json["currencies"].map((x) => CurrencyElement.fromJson(x))),
        rates: List<Rate>.from(json["rates"].map((x) => Rate.fromJson(x))),
        accounts: List<Account>.from(
            json["accounts"].map((x) => Account.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "buy_sell_status": buySellStatus,
        "buy_sell_message": buySellMessage,
        "total_monthly_transfers": totalMonthlyTransfers,
        "total_daily_transfers": totalDailyTransfers,
        "user_plan_id": userPlanId,
        "max_transfer_count": maxTransferCount,
        "monthly_transfer_count": monthlyTransferCount,
        "daily_transfer_count": dailyTransferCount,
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
        "rates": List<dynamic>.from(rates.map((x) => x.toJson())),
        "accounts": List<dynamic>.from(accounts.map((x) => x.toJson())),
      };
}

class Account {
  final int id;
  final int userId;
  final int bankId;
  final String accountNumber;
  final String comment;
  final String createdAt;
  final String updatedAt;
  final AccountCurrency currency;

  Account({
    required this.id,
    required this.userId,
    required this.bankId,
    required this.accountNumber,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.currency,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        userId: json["user_id"],
        bankId: json["bank_id"],
        accountNumber: json["account_number"],
        comment: json["comment"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        currency: AccountCurrency.fromJson(json["currency"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "bank_id": bankId,
        "account_number": accountNumber,
        "comment": comment,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "currency": currency.toJson(),
      };
}

class AccountCurrency {
  final int id;
  final String name;

  AccountCurrency({
    required this.id,
    required this.name,
  });

  factory AccountCurrency.fromJson(Map<String, dynamic> json) =>
      AccountCurrency(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class CurrencyElement {
  final int id;
  final String name;
  final String nameCode;
  final String comment;

  CurrencyElement({
    required this.id,
    required this.name,
    required this.nameCode,
    required this.comment,
  });

  factory CurrencyElement.fromJson(Map<String, dynamic> json) =>
      CurrencyElement(
        id: json["id"],
        name: json["name"],
        nameCode: json["name_code"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_code": nameCode,
        "comment": comment,
      };
}

class Rate {
  final int id;
  final bool status;
  final int planId;
  final int from;
  final int to;
  final String selling;
  final String buying;
  final String createdAt;
  final String updatedAt;

  Rate({
    required this.id,
    required this.status,
    required this.planId,
    required this.from,
    required this.to,
    required this.selling,
    required this.buying,
    required this.createdAt,
    required this.updatedAt,
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
