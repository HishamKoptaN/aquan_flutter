part of 'accounts_bloc.dart';

abstract class AccountsState {}

final class AccountsInitial extends AccountsState {}

final class AccountsLoading extends AccountsState {}

final class AccountsError extends AccountsState {
  final String message;

  AccountsError({required this.message});
}

class AccountsDone extends AccountsState {
  final GetUserAccounts getUserAccounts;

  AccountsDone({required this.getUserAccounts});
}

final class AccountsUpdatedSuccess extends AccountsState {}
