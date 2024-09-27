part of 'accounts_bloc.dart';

abstract class AccountsState {}

class AccountsInitial extends AccountsState {}

class AccountsLoading extends AccountsState {}

class AccountsLoaded extends AccountsState {
  final List<AccountEntity> accounts;
  AccountsLoaded({required this.accounts});
}

class AccountsError extends AccountsState {
  final String message;
  AccountsError({required this.message});
}

class AccountsUpdatedSuccess extends AccountsState {}
