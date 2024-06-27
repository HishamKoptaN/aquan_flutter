part of 'currency_bloc.dart';

abstract class CurrencyEvent {}

class GetCurrencies extends CurrencyEvent {}

class CalculateRate extends CurrencyEvent {
  final Currency sWallet;
  final Currency dWallet;
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
  final Currency sWallet;
  final Currency dWallet;
  final double amount;
  final String accountId;
  final File file;

  TransferMoney({
    required this.sWallet,
    required this.dWallet,
    required this.amount,
    required this.accountId,
    required this.file,
  });
}

class GetNameOfUserByAccount extends CurrencyEvent {
  final String accountId;

  GetNameOfUserByAccount({required this.accountId});
}
