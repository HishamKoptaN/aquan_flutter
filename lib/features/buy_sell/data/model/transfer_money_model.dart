import 'dart:io';

class TransferMoneyRquestmodel {
  String? senderCurrencyId;
  int? receiverCurrencyId;
  String? amount;
  String? netAmount;
  int? rate;
  String? receiverAccount;
  String? employeeId;
  File? imageFile;
  static final TransferMoneyRquestmodel _instance =
      TransferMoneyRquestmodel._internal();
  static TransferMoneyRquestmodel get instance => _instance;
  TransferMoneyRquestmodel._internal();

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
