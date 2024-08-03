part of 'buy_sell_bloc.dart';

abstract class CurrencyEvent {}

class GetCurrencies extends CurrencyEvent {}

class CalculateRate extends CurrencyEvent {
  final List<Currency> sWallet;
  final List<Currency> dWallet;
  final double amount;
  final List<Currency> currencies;

  CalculateRate({
    required this.sWallet,
    required this.dWallet,
    required this.amount,
    required this.currencies,
  });
}

class TransferMoney extends CurrencyEvent {
  final int sourceWalletId;
  final int destinationWalletId;
  final int amount;
  final double rate;
  final String address;
  final String accountId;
  // final File file;

  TransferMoney({
    required this.sourceWalletId,
    required this.destinationWalletId,
    required this.amount,
    required this.rate,
    required this.address,
    required this.accountId,
    // required this.file,
  });
}

class GetNameOfUserByAccount extends CurrencyEvent {
  final String accountId;

  GetNameOfUserByAccount({required this.accountId});
}
