import 'package:equatable/equatable.dart';

import '../model/notification_model.dart';

sealed class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsLoading extends NotificationsState {}

class NotificationsLoadedSuccess extends NotificationsState {
  List<Notification> notifications;
  NotificationsLoadedSuccess({
    required this.notifications,
  });
}

class NotificationsError extends NotificationsState {
  final String message;

  NotificationsError({required this.message});

  @override
  List<Object> get props => [message];
}
