part of 'deposit_bloc.dart';

abstract class DepositEvent {}

class GetDeposits extends DepositEvent {}

class CreateDeposit extends DepositEvent {
  final File file;
  final double amount;
  final String method;

  CreateDeposit({
    required this.file,
    required this.amount,
    required this.method,
  });
}

class GetPayments extends DepositEvent {}

class TestEvent extends DepositEvent {}
