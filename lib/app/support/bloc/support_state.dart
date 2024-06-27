part of 'support_bloc.dart';

abstract class SupportState {}

final class SupportInitial extends SupportState {}

final class SupportLoading extends SupportState {}

final class SupportError extends SupportState {
  final String message;

  SupportError({required this.message});
}

class FAQsLoaded extends SupportState {
  final Map<String, dynamic> faqs;
  final String? error;
  final bool sent;

  FAQsLoaded({
    required this.faqs,
    this.error,
    this.sent = false,
  });
}

class MessagesLoaded extends SupportState {
  final List<Message> messages;
  final User user;

  MessagesLoaded({
    required this.messages,
    required this.user,
  });
}
