// To parse this JSON data, do
//
//     final getProfileUserApiResModel = getProfileUserApiResModelFromJson(jsonString);

import 'dart:convert';

GetProfileUserApiResModel getProfileUserApiResModelFromJson(String str) =>
    GetProfileUserApiResModel.fromJson(json.decode(str));

String getProfileUserApiResModelToJson(GetProfileUserApiResModel data) =>
    json.encode(data.toJson());

class GetProfileUserApiResModel {
  bool? status;
  User? user;

  GetProfileUserApiResModel({
    this.status,
    this.user,
  });

  factory GetProfileUserApiResModel.fromJson(Map<String, dynamic> json) =>
      GetProfileUserApiResModel(
        status: json["status"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  String? status;
  String? token;
  String? name;
  String? username;
  String? email;
  String? image;
  dynamic address;
  String? phone;
  int? balance;
  dynamic message;
  List<AccountInfo>? accountInfo;
  int? planId;
  int? role;
  dynamic referedBy;
  dynamic confirmationCode;
  String? phoneVerifiedAt;
  String? refcode;
  String? phoneVerificationCode;
  String? upgradedAt;
  dynamic emailVerifiedAt;
  dynamic inactivateEndAt;
  String? createdAt;
  String? updatedAt;
  String? balanceFormatted;
  DateTime? createdDate;
  String? upgradedDate;

  User({
    this.id,
    this.status,
    this.token,
    this.name,
    this.username,
    this.email,
    this.image,
    this.address,
    this.phone,
    this.balance,
    this.message,
    this.accountInfo,
    this.planId,
    this.role,
    this.referedBy,
    this.confirmationCode,
    this.phoneVerifiedAt,
    this.refcode,
    this.phoneVerificationCode,
    this.upgradedAt,
    this.emailVerifiedAt,
    this.inactivateEndAt,
    this.createdAt,
    this.updatedAt,
    this.balanceFormatted,
    this.createdDate,
    this.upgradedDate,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        status: json["status"],
        token: json["token"],
        name: json["name"] ?? "",
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        image: json["image"] ?? "",
        address: json["address"] ?? "",
        phone: json["phone"] ?? "",
        balance: json["balance"] ?? "",
        message: json["message"] ?? "",
        accountInfo: json["account_info"] == null
            ? []
            : List<AccountInfo>.from(
                json["account_info"]!.map((x) => AccountInfo.fromJson(x))),
        planId: json["plan_id"] ?? "",
        role: json["role"] ?? "",
        referedBy: json["refered_by"] ?? "",
        confirmationCode: json["confirmation_code"] ?? "",
        phoneVerifiedAt: json["phone_verified_at"] ?? "",
        refcode: json["refcode"] ?? "",
        phoneVerificationCode: json["phone_verification_code"] ?? "",
        upgradedAt: json["upgraded_at"] ?? "",
        emailVerifiedAt: json["email_verified_at"] ?? "",
        inactivateEndAt: json["inactivate_end_at"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        balanceFormatted: json["balance_formatted"] ?? "",
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"] ?? ""),
        upgradedDate: json["upgraded_date"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "token": token,
        "name": name,
        "username": username,
        "email": email,
        "image": image,
        "address": address,
        "phone": phone,
        "balance": balance,
        "message": message,
        "account_info": accountInfo == null
            ? []
            : List<dynamic>.from(accountInfo!.map((x) => x.toJson())),
        "plan_id": planId,
        "role": role,
        "refered_by": referedBy,
        "confirmation_code": confirmationCode,
        "phone_verified_at": phoneVerifiedAt,
        "refcode": refcode,
        "phone_verification_code": phoneVerificationCode,
        "upgraded_at": upgradedAt,
        "email_verified_at": emailVerifiedAt,
        "inactivate_end_at": inactivateEndAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "balance_formatted": balanceFormatted,
        "created_date":
            "${createdDate!.year.toString().padLeft(4, '0')}-${createdDate!.month.toString().padLeft(2, '0')}-${createdDate!.day.toString().padLeft(2, '0')}",
        "upgraded_date": upgradedDate,
      };
}

class AccountInfo {
  String? currency;
  int? value;

  AccountInfo({
    this.currency,
    this.value,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) => AccountInfo(
        currency: json["currency"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "value": value,
      };
}
