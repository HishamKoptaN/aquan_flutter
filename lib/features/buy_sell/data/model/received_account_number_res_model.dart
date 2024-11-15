// To parse this JSON data, do
//
//     final receivedAccountNumberResModel = receivedAccountNumberResModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'received_account_number_res_model.freezed.dart';
part 'received_account_number_res_model.g.dart';

ReceivedAccountNumberResModel receivedAccountNumberResModelFromJson(
        String str) =>
    ReceivedAccountNumberResModel.fromJson(json.decode(str));

String receivedAccountNumberResModelToJson(
        ReceivedAccountNumberResModel data) =>
    json.encode(data.toJson());

@freezed
class ReceivedAccountNumberResModel with _$ReceivedAccountNumberResModel {
  const factory ReceivedAccountNumberResModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "account") Account? account,
  }) = _ReceivedAccountNumberResModel;

  factory ReceivedAccountNumberResModel.fromJson(Map<String, dynamic> json) =>
      _$ReceivedAccountNumberResModelFromJson(json);
}

@freezed
class Account with _$Account {
  const factory Account({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "bank_id") int? bankId,
    @JsonKey(name: "account_number") String? accountNumber,
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "currency") Currency? currency,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

@freezed
class Currency with _$Currency {
  const factory Currency({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}
