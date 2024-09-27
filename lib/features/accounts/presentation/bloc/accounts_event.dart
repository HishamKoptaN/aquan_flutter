part of 'accounts_bloc.dart';

abstract class AccountsEvent {}

class GetAccountsEvent extends AccountsEvent {}

class UpdateAccountsEvent extends AccountsEvent {
  final List<AccountEntity> accounts;
  UpdateAccountsEvent({required this.accounts});
}
