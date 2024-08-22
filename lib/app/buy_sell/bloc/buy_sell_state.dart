import '../model/buy_sell_model.dart';

abstract class BuySellState {}

final class CurrencyInitial extends BuySellState {}

final class CurrencyLoading extends BuySellState {}

final class CurrencyError extends BuySellState {
  final String message;

  CurrencyError({required this.message});
}

class CurrenciesDone extends BuySellState {
  List<Currency> senderWallet;
  List<Currency> receiverWallet;
  final List<Rate> rate;
  final List<Currency> currencies;
  List<AccountInfo> accountInfo;
  final int userPlanId;
  final bool buySellStatus;
  CurrenciesDone({
    required this.buySellStatus,
    required this.currencies,
    required this.rate,
    required this.accountInfo,
    required this.userPlanId,
    required this.senderWallet,
    required this.receiverWallet,
  });
}

class TransferDone extends BuySellState {}

class UserAccountLoaded extends BuySellState {
  final String name;

  UserAccountLoaded({required this.name});
}
