import 'dart:io';

class AddDepositRequestBody {
  static final AddDepositRequestBody _instance = AddDepositRequestBody._();
  factory AddDepositRequestBody() {
    return _instance;
  }
  AddDepositRequestBody._();
  String? senderCurrencyId;
  int? receiverCurrencyId;
  String? amount;
  String? netAmount;
  double? rate;
  String? receiverAccount;
  String? employeeId;
  File? imageFile;
  Map<String, dynamic> toJson() => {
        'sender_currency_id': senderCurrencyId,
        'receiver_currency_id': receiverCurrencyId,
        'amount': amount,
        'net_amount': netAmount,
        'rate': rate,
        'receiver_account': receiverAccount,
        'employee_id': employeeId,
      };
}
