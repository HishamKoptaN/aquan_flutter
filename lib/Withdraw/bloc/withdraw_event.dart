part of 'withdraw_bloc.dart';

abstract class WithdrawEvent {}

class GetWithdraws extends WithdrawEvent {}

class GetCurrencies extends WithdrawEvent {}

class CreateWithdraw extends WithdrawEvent {
  final String wallet;
  final double amount;
  final String information;

  CreateWithdraw({
    required this.wallet,
    required this.amount,
    required this.information,
  });
}
