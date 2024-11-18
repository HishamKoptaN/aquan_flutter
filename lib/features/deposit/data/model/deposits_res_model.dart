// To parse this JSON data, do
//
//     final depositsResModel = depositsResModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'deposits_res_model.freezed.dart';
part 'deposits_res_model.g.dart';

DepositsResModel depositsResModelFromJson(String str) =>
    DepositsResModel.fromJson(json.decode(str));

String depositsResModelToJson(DepositsResModel data) =>
    json.encode(data.toJson());

@freezed
class DepositsResModel with _$DepositsResModel {
  const factory DepositsResModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "deposits") List<Deposit>? deposits,
  }) = _DepositsResModel;

  factory DepositsResModel.fromJson(Map<String, dynamic> json) =>
      _$DepositsResModelFromJson(json);
}

@freezed
class Deposit with _$Deposit {
  const factory Deposit({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "employee_id") int? employeeId,
    @JsonKey(name: "amount") double? amount,
    @JsonKey(name: "method") int? method,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "currency") DepositCurrency? currency,
  }) = _Deposit;

  factory Deposit.fromJson(Map<String, dynamic> json) =>
      _$DepositFromJson(json);
}

@freezed
class DepositCurrency with _$DepositCurrency {
  const factory DepositCurrency({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
  }) = _Currency;

  factory DepositCurrency.fromJson(Map<String, dynamic> json) =>
      _$DepositCurrencyFromJson(json);
}
