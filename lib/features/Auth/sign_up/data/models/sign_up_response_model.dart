// To parse this JSON data, do
//
//     final signUpResponseModel = signUpResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'sign_up_response_model.freezed.dart';
part 'sign_up_response_model.g.dart';

SignUpResponseModel signUpResponseModelFromJson(String str) =>
    SignUpResponseModel.fromJson(json.decode(str));

String signUpResponseModelToJson(SignUpResponseModel data) =>
    json.encode(data.toJson());

@freezed
class SignUpResponseModel with _$SignUpResponseModel {
  const factory SignUpResponseModel({
    @JsonKey(name: "status") required bool status,
    @JsonKey(name: "token") required String token,
    @JsonKey(name: "user") required User user,
  }) = _SignUpResponseModel;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "token") required String token,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "password") required String password,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "account_number") required String accountNumber,
    @JsonKey(name: "image") required String image,
    @JsonKey(name: "address") required String address,
    @JsonKey(name: "phone") required String phone,
    @JsonKey(name: "phone_verified_at") required dynamic phoneVerifiedAt,
    @JsonKey(name: "balance") required int balance,
    @JsonKey(name: "phone_verification_code")
    required dynamic phoneVerificationCode,
    @JsonKey(name: "inactivate_end_at") required dynamic inactivateEndAt,
    @JsonKey(name: "refcode") required String refcode,
    @JsonKey(name: "refered_by") required dynamic referedBy,
    @JsonKey(name: "plan_id") required int planId,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "id") required int id,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
