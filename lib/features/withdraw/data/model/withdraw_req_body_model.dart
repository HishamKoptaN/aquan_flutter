// To parse this JSON data, do
//
//     final withdrawReqBodyModel = withdrawReqBodyModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'withdraw_req_body_model.freezed.dart';
part 'withdraw_req_body_model.g.dart';

WithdrawReqBodyModel withdrawReqBodyModelFromJson(String str) =>
    WithdrawReqBodyModel.fromJson(json.decode(str));

String withdrawReqBodyModelToJson(WithdrawReqBodyModel data) =>
    json.encode(data.toJson());

@freezed
class WithdrawReqBodyModel with _$WithdrawReqBodyModel {
  const factory WithdrawReqBodyModel({
    @JsonKey(name: "amount") int? amount,
    @JsonKey(name: "method") int? method,
    @JsonKey(name: "receiving_account_number") int? receivingAccountNumber,
  }) = _WithdrawReqBodyModel;

  factory WithdrawReqBodyModel.fromJson(Map<String, dynamic> json) =>
      _$WithdrawReqBodyModelFromJson(json);
}
