import '../model/buy_sell_model.dart';
import '../model/received_account_number.dart';

abstract class BuySellState {}

final class CurrencyInitial extends BuySellState {}

final class CurrencyLoading extends BuySellState {}

class CurrenciesLoadedSuccessfully extends BuySellState {
  GetBuySellApiRes getBuySellApiRes;
  CurrenciesLoadedSuccessfully({
    required this.getBuySellApiRes,
  });
}

final class CurrencyError extends BuySellState {
  final String message;

  CurrencyError({required this.message});
}

class RateCalculated extends BuySellState {}

class TransferDone extends BuySellState {}

class UserAccountLoaded extends BuySellState {
  final String name;

  UserAccountLoaded({required this.name});
}

class ReceivedAccountNumberLoaded extends BuySellState {
  ReceivedAccountNumberApiRes receivedAccountNumberApiRes;
  ReceivedAccountNumberLoaded({required this.receivedAccountNumberApiRes});
}
