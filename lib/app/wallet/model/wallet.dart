import 'package:aquan/app/currency/model/currency.dart';

class Wallet {
  int? id;
  double? amount;
  String? amountFormated;
  int? userId;
  int? currencyId;
  String? createdAt;
  String? updatedAt;
  Currency? currency;

  Wallet({
    id,
    amount,
    amountFormated,
    userId,
    currencyId,
    createdAt,
    updatedAt,
    currency,
  });

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'].toDouble();
    amountFormated = json['amount_formated'];
    userId = json['user_id'];
    currencyId = json['currency_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }
}
