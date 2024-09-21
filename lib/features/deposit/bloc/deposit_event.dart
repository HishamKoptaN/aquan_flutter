part of 'deposit_bloc.dart';

abstract class DepositEvent {}

class GetDeposits extends DepositEvent {}

class CreateDeposit extends DepositEvent {
  final File file;
  final TextEditingController amount;
  final int method;
  final int employeeId;
  CreateDeposit({
    required this.file,
    required this.amount,
    required this.method,
    required this.employeeId,
  });
}

class GetDepositPaymentMethods extends DepositEvent {}
