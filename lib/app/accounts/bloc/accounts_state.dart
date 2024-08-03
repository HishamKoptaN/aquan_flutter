part of 'accounts_bloc.dart';

abstract class AccountsState {}

final class AccountsInitial extends AccountsState {}

final class AccountsLoading extends AccountsState {}

final class AccountsError extends AccountsState {
  final String message;

  AccountsError({required this.message});
}

class AccountsDone extends AccountsState {
  final List<AccountInfo> accounts;

  AccountsDone({required this.accounts});
}

final class AccountsUpdatedSuccess extends AccountsState {}

final class AccountsUpdatingFailure extends AccountsState {
  final String message;

  AccountsUpdatingFailure({required this.message});
}
