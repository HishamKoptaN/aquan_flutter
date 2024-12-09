// To parse this JSON data, do
//
//     final receivedAccountNumberResModel = receivedAccountNumberResModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import '../../../../core/models/currency.dart';
import '../../../../core/singletons/account.dart';
import '../../../accounts/data/models/accounts_model.dart';

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
