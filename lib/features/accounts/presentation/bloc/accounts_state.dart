part of 'accounts_bloc.dart';

abstract class AccountsState {}

class AccountsInitial extends AccountsState {}

class AccountsLoading extends AccountsState {}

class AccountsLoaded extends AccountsState {
  final List<Account> accounts;
  AccountsLoaded({required this.accounts});
}

class AccountsError extends AccountsState {
  final String message;
  final List<Account> accounts;
  AccountsError({
    required this.message,
    required this.accounts,
  });
}

class AccountsUpdatedSuccess extends AccountsState {}
