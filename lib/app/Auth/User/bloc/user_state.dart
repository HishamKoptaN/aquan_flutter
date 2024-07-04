// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

class UserError extends UserState {
  final String message;

  UserError({required this.message});
}

class ReferalsDone extends UserState {
  final List<User> users;
  final User user;

  ReferalsDone({required this.users, required this.user});
}

class ProfileDone extends UserState {
  final bool updated;
  final User user;

  ProfileDone({required this.user, this.updated = false});
}

class DashboardLoaded extends UserState {
  final List<Transaction> transactions;
  final List<Currency> currencies;
  final User user;

  DashboardLoaded({
    required this.transactions,
    required this.user,
    required this.currencies,
  });
}

class SearchAboutUserAccountById extends UserState {
  final String name;

  SearchAboutUserAccountById({required this.name});
}

class NotificationsLoaded extends UserState {
  List<NotificationModel> notifications;

  NotificationsLoaded({
    required this.notifications,
  });
}
