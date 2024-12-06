// To parse this JSON data, do
//
//     final withdrawsResModel = withdrawsResModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'withdraws_res_model.freezed.dart';
part 'withdraws_res_model.g.dart';

List<Withdraw> withdrawFromJson(String str) =>
    List<Withdraw>.from(json.decode(str).map((x) => Withdraw.fromJson(x)));

String withdrawToJson(List<Withdraw> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class Withdraw with _$Withdraw {
  const factory Withdraw({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "method") int? method,
    @JsonKey(name: "receiving_account_number") String? receivingAccountNumber,
    @JsonKey(name: "amount") double? amount,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "currency") Currency? currency,
  }) = _Withdraw;

  factory Withdraw.fromJson(Map<String, dynamic> json) =>
      _$WithdrawFromJson(json);
}

@freezed
class Currency with _$Currency {
  const factory Currency({
    @JsonKey(name: "name") String? name,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}
