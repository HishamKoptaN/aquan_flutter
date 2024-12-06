part of 'deposit_bloc.dart';

abstract class DepositState {}

final class DepositInitial extends DepositState {}

final class DepositLoading extends DepositState {}

class DepositsLoadedSuccessfully extends DepositState {
  List<Deposit> deposits;
  DepositsLoadedSuccessfully({required this.deposits});
}

final class DepositError extends DepositState {
  final String message;

  DepositError({
    required this.message,
  });
}

class DepositCreatedSuccessfully extends DepositState {}

class DepositPaymentMethodsDone extends DepositState {
  GetEmployeeAccountApiResModel getEmployeeAccountApiResModel;
  DepositPaymentMethodsDone({
    required this.getEmployeeAccountApiResModel,
  });
}
