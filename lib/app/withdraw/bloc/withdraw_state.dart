part of 'withdraw_bloc.dart';

abstract class WithdrawState {}

final class WithdrawInitial extends WithdrawState {}

class WithdrawLoading extends WithdrawState {}

class WithdrawError extends WithdrawState {
  final String? message;

  WithdrawError({required this.message});
}

class WithdrawsDone extends WithdrawState {
  final List<Invoice> invoices;

  WithdrawsDone({required this.invoices});
}

class WithdrawDone extends WithdrawState {}

class CurrenciesDone extends WithdrawState {
  final List<Currency> currencies;

  CurrenciesDone({required this.currencies});
}
