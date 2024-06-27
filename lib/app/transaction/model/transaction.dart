import 'package:aquan/app/currency/model/currency.dart';
import 'package:aquan/app/Auth/model/user.dart';

class Transaction {
  int? id;
  String? status;
  double? amount;
  double? rate;
  String? message;
  int? adminId;
  int? userId;
  int? senderCurrencyId;
  int? receiverCurrencyId;
  String? createdAt;
  String? updatedAt;
  User? receiver;
  Currency? senderCurrency;
  Currency? receiverCurrency;
  String? createdDate;
  String? amountFormated;

  Transaction({
    id,
    status,
    amount,
    rate,
    message,
    adminId,
    userId,
    senderCurrencyId,
    receiverCurrencyId,
    createdAt,
    updatedAt,
    receiver,
    senderCurrency,
    receiverCurrency,
    createdDate,
    amountFormated,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    amount = json['amount'].toDouble();
    amountFormated = json['amount_formated'];
    rate = json['rate'].toDouble();
    message = json['message'];
    adminId = json['admin_id'];
    userId = json['user_id'];
    senderCurrencyId = json['sender_currency_id'];
    receiverCurrencyId = json['receiver_currency_id'];
    createdAt = json['created_at'];
    createdDate = json['created_date'];
    updatedAt = json['updated_at'];
    receiver =
        json['receiver'] != null ? User.fromJson(json['receiver']) : null;
    senderCurrency = json['sender_currency'] != null
        ? Currency.fromJson(json['sender_currency'])
        : null;
    receiverCurrency = json['receiver_currency'] != null
        ? Currency.fromJson(json['receiver_currency'])
        : null;
  }
}
