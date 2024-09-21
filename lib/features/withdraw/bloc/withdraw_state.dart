part of 'withdraw_bloc.dart';

abstract class WithdrawState {}

final class WithdrawInitial extends WithdrawState {}

class WithdrawLoading extends WithdrawState {}

class WithdrawsLoadedSuccessfully extends WithdrawState {
  final List<Withdraw> invoices;
  WithdrawsLoadedSuccessfully({
    required this.invoices,
  });
}

class WithdrawCreatedSuccessfully extends WithdrawState {}

class WithdrawRatesLoadedSuccessfully extends WithdrawState {
  GetWithdrawRateApiResModel getWithdrawRateApiResModel;
  WithdrawRatesLoadedSuccessfully({required this.getWithdrawRateApiResModel});
}

class WithdrawError extends WithdrawState {
  final String? message;

  WithdrawError({required this.message});
}
