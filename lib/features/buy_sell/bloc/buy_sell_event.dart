part of 'buy_sell_bloc.dart';

abstract class BuySellEvent {}

class GetCurrencies extends BuySellEvent {}

class CalculateRate extends BuySellEvent {
  final List<CurrencyElement> sWallet;
  final List<CurrencyElement> dWallet;
  final List<Rate> rate;
  final String amount;
  final List<CurrencyElement> currencies;

  CalculateRate({
    required this.sWallet,
    required this.dWallet,
    required this.rate,
    required this.amount,
    required this.currencies,
  });
}

class GetReceivedAccountNumber extends BuySellEvent {
  final int id;
  GetReceivedAccountNumber({
    required this.id,
  });
}

class TransferMoney extends BuySellEvent {
  int senderCurrencyId;
  int receiverCurrencyId;
  String amount;
  double netAmount;
  double rate;
  String receiverAccount;
  int employeeId;
  File file;

  TransferMoney({
    required this.senderCurrencyId,
    required this.receiverCurrencyId,
    required this.amount,
    required this.netAmount,
    required this.rate,
    required this.receiverAccount,
    required this.employeeId,
    required this.file,
  });
}
