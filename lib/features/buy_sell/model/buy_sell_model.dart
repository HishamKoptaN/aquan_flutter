import 'dart:convert';

GetBuySellApiRes getBuySellApiResFromJson(String str) =>
    GetBuySellApiRes.fromJson(json.decode(str));

String getBuySellApiResToJson(GetBuySellApiRes data) =>
    json.encode(data.toJson());

class GetBuySellApiRes {
  bool status;
  bool buySellStatus;
  String? buySellMessage;

  int userPlanId;
  List<CurrencyElement> currencies;
  List<Rate> rates;
  List<Account> accounts;

  GetBuySellApiRes({
    required this.status,
    required this.buySellStatus,
    this.buySellMessage,
    required this.userPlanId,
    required this.currencies,
    required this.rates,
    required this.accounts,
  });

  factory GetBuySellApiRes.fromJson(Map<String, dynamic> json) =>
      GetBuySellApiRes(
        status: json["status"],
        buySellStatus: json["buy_sell_status"],
        buySellMessage: json["buy_sell_message"],
        userPlanId: json["user_plan_id"],
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
        "user_plan_id": userPlanId,
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
        "rates": List<dynamic>.from(rates.map((x) => x.toJson())),
        "accounts": List<dynamic>.from(accounts.map((x) => x.toJson())),
      };
}

class Account {
  int id;
  int userId;
  int bankId;
  String accountNumber;
  String comment;
  String createdAt;
  String updatedAt;
  AccountCurrency currency;

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
  int id;
  String name;

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
  int id;
  String name;
  String nameCode;
  String comment;

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
  int id;
  bool status;
  int planId;
  int from;
  int to;
  String selling;
  String buying;
  String createdAt;
  String updatedAt;

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
