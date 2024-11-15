// To parse this JSON data, do
//
//     final signUpRequestBody = signUpRequestBodyFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'sign_up_request_body.freezed.dart';
part 'sign_up_request_body.g.dart';

SignUpRequestBody signUpRequestBodyFromJson(String str) =>
    SignUpRequestBody.fromJson(json.decode(str));

String signUpRequestBodyToJson(SignUpRequestBody data) =>
    json.encode(data.toJson());

@freezed
class SignUpRequestBody with _$SignUpRequestBody {
  const factory SignUpRequestBody({
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "password") required String password,
    @JsonKey(name: "password_confirmation")
    required String passwordConfirmation,
    @JsonKey(name: "address") required String address,
    @JsonKey(name: "phone") required String phone,
  }) = _SignUpRequestBody;

  factory SignUpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestBodyFromJson(json);
}
