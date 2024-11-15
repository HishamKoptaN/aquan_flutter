import 'dart:convert';

GetEmployeeAccountApiResModel getEmployeeAccountApiResModelFromJson(
        String str) =>
    GetEmployeeAccountApiResModel.fromJson(json.decode(str));

String getEmployeeAccountApiResModelToJson(
        GetEmployeeAccountApiResModel data) =>
    json.encode(data.toJson());

class GetEmployeeAccountApiResModel {
  final bool? status;
  final int? userPlan;
  final int? employeeId;
  final List<AccountInfo>? accountInfo;
  final List<ToBinanceRate>? toBinanceRates;

  GetEmployeeAccountApiResModel({
    this.status,
    this.userPlan,
    this.employeeId,
    this.accountInfo,
    this.toBinanceRates,
  });

  factory GetEmployeeAccountApiResModel.fromJson(Map<String, dynamic> json) =>
      GetEmployeeAccountApiResModel(
        status: json["status"],
        userPlan: json["user_plan"],
        employeeId: json["employee_id"],
        accountInfo: json["account_info"] == null
            ? []
            : List<AccountInfo>.from(
                json["account_info"]!.map((x) => AccountInfo.fromJson(x))),
        toBinanceRates: json["to_binance_rates"] == null
            ? []
            : List<ToBinanceRate>.from(json["to_binance_rates"]!
                .map((x) => ToBinanceRate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user_plan": userPlan,
        "employee_id": employeeId,
        "account_info": accountInfo == null
            ? []
            : List<dynamic>.from(accountInfo!.map((x) => x.toJson())),
        "to_binance_rates": toBinanceRates == null
            ? []
            : List<dynamic>.from(toBinanceRates!.map((x) => x.toJson())),
      };
}

class AccountInfo {
  final int? id;
  final int? userId;
  final int? bankId;
  final String? accountNumber;
  final String? comment;
  final String? createdAt;
  final String? updatedAt;
  final Currency? currency;

  AccountInfo({
    this.id,
    this.userId,
    this.bankId,
    this.accountNumber,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.currency,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) => AccountInfo(
        id: json["id"],
        userId: json["user_id"],
        bankId: json["bank_id"],
        accountNumber: json["account_number"],
        comment: json["comment"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        currency: json["currency"] == null
            ? null
            : Currency.fromJson(json["currency"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "bank_id": bankId,
        "account_number": accountNumber,
        "comment": comment,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "currency": currency?.toJson(),
      };
}

class Currency {
  final String? name;

  Currency({
    this.name,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class ToBinanceRate {
  final double? price;
  final String? updatedAt;
  final String? currencyName;
  final int? from;

  ToBinanceRate({
    this.price,
    this.updatedAt,
    this.currencyName,
    this.from,
  });

  factory ToBinanceRate.fromJson(Map<String, dynamic> json) => ToBinanceRate(
        price: json["price"]?.toDouble(),
        updatedAt: json["updated_at"],
        currencyName: json["currency_name"],
        from: json["from"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "updated_at": updatedAt,
        "currency_name": currencyName,
        "from": from,
      };
}
