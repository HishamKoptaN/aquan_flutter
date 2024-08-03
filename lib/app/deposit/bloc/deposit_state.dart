part of 'deposit_bloc.dart';

abstract class DepositState {}

final class DepositInitial extends DepositState {}

final class DepositLoading extends DepositState {}

final class DepositError extends DepositState {
  final String message;

  DepositError({required this.message});
}

class DepositsDone extends DepositState {
  // final List<DepositWithdraw> deposits;

  // DepositsDone({required this.deposits});
}

class MethodsDone extends DepositState {
  // final List<Currency> currencies;

  // MethodsDone({required this.currencies});
}

class DepositDone extends DepositState {}
