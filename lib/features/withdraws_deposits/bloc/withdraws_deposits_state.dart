part of 'withdraws_deposits_bloc.dart';

abstract class DepositWithdrawState {}

final class DepositWithdrawInitial extends DepositWithdrawState {}

final class DepositWithdrawLoading extends DepositWithdrawState {}

class WithdrawsDepositsLoadedSuccessfully extends DepositWithdrawState {
  final GetWithdrawDepositsApiResModel getWithdrawDepositsApiResModel;

  WithdrawsDepositsLoadedSuccessfully({
    required this.getWithdrawDepositsApiResModel,
  });
}

final class DepositWithdrawError extends DepositWithdrawState {
  final String message;

  DepositWithdrawError({required this.message});
}
