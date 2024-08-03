part of 'deposits_withdraw_bloc.dart';

abstract class DepositWithdrawState {}

final class DepositWithdrawInitial extends DepositWithdrawState {}

final class DepositWithdrawLoading extends DepositWithdrawState {}

final class DepositWithdrawError extends DepositWithdrawState {
  final String message;

  DepositWithdrawError({required this.message});
}

class DepositsWithdrawDone extends DepositWithdrawState {
  final List<Invoice> depositsWithdraw;

  DepositsWithdrawDone({required this.depositsWithdraw});
}
