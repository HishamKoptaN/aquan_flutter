// To parse this JSON data, do
//
//     final getWithdrawDepositsApiResModel = getWithdrawDepositsApiResModelFromJson(jsonString);

import 'dart:convert';

class Withdraw {
  int? id;
  String? status;
  double? amount;
  double? charge;
  String? method;
  String? transaction;
  String? attachement;
  String? message;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Withdraw({
    id,
    status,
    amount,
    charge,
    method,
    transaction,
    attachement,
    message,
    userId,
    createdAt,
    updatedAt,
  });

  Withdraw.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    amount = json['amount'].toDouble();
    charge = json['charge'].toDouble();
    method = json['method'];
    transaction = json['transaction'];
    attachement = json['attachement'];
    message = json['message'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['status'] = status;
    data['amount'] = amount;
    data['charge'] = charge;
    data['method'] = method;
    data['transaction'] = transaction;
    data['attachement'] = attachement;
    data['message'] = message;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
