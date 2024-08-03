part of 'accounts_bloc.dart';

abstract class WalletEvent {}

class GetAccounts extends WalletEvent {}

class UpdateAccounts extends WalletEvent {
  final List<AccountInfo> accountInfo;

  UpdateAccounts({required this.accountInfo});
}
