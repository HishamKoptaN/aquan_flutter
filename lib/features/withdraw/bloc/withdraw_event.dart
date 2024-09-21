part of 'withdraw_bloc.dart';

abstract class WithdrawEvent {}

class GetWithdraws extends WithdrawEvent {}

class GetCurrencies extends WithdrawEvent {}

class GetWithdrawRates extends WithdrawEvent {}

class CreateWithdraw extends WithdrawEvent {
  final int method;
  final double amount;
  final String receivingWallet;

  CreateWithdraw({
    required this.method,
    required this.amount,
    required this.receivingWallet,
  });
}
