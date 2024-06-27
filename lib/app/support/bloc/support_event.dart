part of 'support_bloc.dart';

abstract class SupportEvent {}

class GetFAQs extends SupportEvent {}

class SendMessage extends SupportEvent {
  final dynamic message;

  SendMessage({required this.message});
}

class GetChatMessages extends SupportEvent {}
