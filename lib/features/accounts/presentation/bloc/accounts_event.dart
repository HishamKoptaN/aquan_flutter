part of 'accounts_bloc.dart';

abstract class WalletEvent {}

class GetAccounts extends WalletEvent {}

class UpdateAccounts extends WalletEvent {
  final GetUserAccounts getUserAccounts;
  UpdateAccounts({required this.getUserAccounts});
}
