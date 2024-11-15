// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'login_response.g.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "status")
  final bool status;
  @JsonKey(name: "token")
  final String token;
  @JsonKey(name: "user")
  final User user;

  LoginResponse({
    required this.status,
    required this.token,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "account_number")
  final String accountNumber;
  @JsonKey(name: "online_offline")
  final String onlineOffline;
  @JsonKey(name: "token")
  final String token;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "balance")
  final double balance;
  @JsonKey(name: "comment")
  final String comment;
  @JsonKey(name: "account_info")
  final String accountInfo;
  @JsonKey(name: "plan_id")
  final int planId;
  @JsonKey(name: "refered_by")
  final dynamic referedBy;
  @JsonKey(name: "confirmation_code")
  final dynamic confirmationCode;
  @JsonKey(name: "phone_verified_at")
  final String phoneVerifiedAt;
  @JsonKey(name: "refcode")
  final String refcode;
  @JsonKey(name: "phone_verification_code")
  final String phoneVerificationCode;
  @JsonKey(name: "upgraded_at")
  final String upgradedAt;
  @JsonKey(name: "email_verified_at")
  final dynamic emailVerifiedAt;
  @JsonKey(name: "inactivate_end_at")
  final dynamic inactivateEndAt;
  @JsonKey(name: "remember_token")
  final dynamic rememberToken;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;

  User({
    required this.id,
    required this.status,
    required this.accountNumber,
    required this.onlineOffline,
    required this.token,
    required this.name,
    required this.username,
    required this.password,
    required this.email,
    required this.image,
    required this.address,
    required this.phone,
    required this.balance,
    required this.comment,
    required this.accountInfo,
    required this.planId,
    required this.referedBy,
    required this.confirmationCode,
    required this.phoneVerifiedAt,
    required this.refcode,
    required this.phoneVerificationCode,
    required this.upgradedAt,
    required this.emailVerifiedAt,
    required this.inactivateEndAt,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
