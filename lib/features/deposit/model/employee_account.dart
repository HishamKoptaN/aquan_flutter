import 'dart:convert';

GetEmployeeAccountApiResModel getEmployeeAccountApiResModelFromJson(
        String str) =>
    GetEmployeeAccountApiResModel.fromJson(json.decode(str));

String getEmployeeAccountApiResModelToJson(
        GetEmployeeAccountApiResModel data) =>
    json.encode(data.toJson());

class GetEmployeeAccountApiResModel {
  bool status;
  int userPlan;
  int? employeeId;
  List<AccountInfo> accountInfo;
  List<ToBinanceRate> toBinanceRates;

  GetEmployeeAccountApiResModel({
    required this.status,
    required this.userPlan,
    required this.employeeId,
    required this.accountInfo,
    required this.toBinanceRates,
  });

  factory GetEmployeeAccountApiResModel.fromJson(Map<String, dynamic> json) =>
      GetEmployeeAccountApiResModel(
        status: json["status"],
        userPlan: json["user_plan"],
        employeeId: json["employee_id"],
        accountInfo: List<AccountInfo>.from(
            json["account_info"].map((x) => AccountInfo.fromJson(x))),
        toBinanceRates: List<ToBinanceRate>.from(
            json["to_binance_rates"].map((x) => ToBinanceRate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user_plan": userPlan,
        "employee_id": employeeId,
        "account_info": List<dynamic>.from(accountInfo.map((x) => x.toJson())),
        "to_binance_rates":
            List<dynamic>.from(toBinanceRates.map((x) => x.toJson())),
      };
}

class AccountInfo {
  int id;
  int userId;
  int bankId;
  String accountNumber;
  String comment;
  String createdAt;
  String updatedAt;
  Currency currency;

  AccountInfo({
    required this.id,
    required this.userId,
    required this.bankId,
    required this.accountNumber,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.currency,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) => AccountInfo(
        id: json["id"],
        userId: json["user_id"],
        bankId: json["bank_id"],
        accountNumber: json["account_number"] ?? "",
        comment: json["comment"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        currency: Currency.fromJson(json["currency"]),
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

class Currency {
  String name;

  Currency({
    required this.name,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class ToBinanceRate {
  String selling;
  String updatedAt;
  String currencyName;
  int from;

  ToBinanceRate({
    required this.selling,
    required this.updatedAt,
    required this.currencyName,
    required this.from,
  });

  factory ToBinanceRate.fromJson(Map<String, dynamic> json) => ToBinanceRate(
        selling: json["selling"],
        updatedAt: json["updated_at"],
        currencyName: json["currency_name"],
        from: json["from"],
      );

  Map<String, dynamic> toJson() => {
        "selling": selling,
        "updated_at": updatedAt,
        "currency_name": currencyName,
        "from": from,
      };
}
