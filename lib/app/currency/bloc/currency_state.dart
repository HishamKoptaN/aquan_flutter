part of 'currency_bloc.dart';

abstract class CurrencyState {}

final class CurrencyInitial extends CurrencyState {}

final class CurrencyLoading extends CurrencyState {}

final class CurrencyError extends CurrencyState {
  final String message;

  CurrencyError({required this.message});
}

class CurrenciesDone extends CurrencyState {
  final List<Currency> currencies;
  final User user;

//   final double? amount;
//   final double? rate;
//   final double? charge;

//   final double? total;

  CurrenciesDone({
    required this.currencies,
    required this.user,
    // this.amount,
    // this.rate,
    // this.charge,
    // this.total,
  });
}

class TransferDone extends CurrencyState {}

class UserAccountLoaded extends CurrencyState {
  final String name;

  UserAccountLoaded({required this.name});
}
