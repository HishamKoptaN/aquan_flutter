part of 'support_bloc.dart';

abstract class SupportState {}

final class SupportInitial extends SupportState {}

final class SupportLoading extends SupportState {}

class MessagesLoaded extends SupportState {
  final Map<String, dynamic> user;

  MessagesLoaded({
    required this.user,
  });
}

class MessageSended extends SupportState {}

class MessagesLoading extends SupportState {}

final class SupportError extends SupportState {
  final String error;

  SupportError({required this.error});
}
