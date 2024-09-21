part of 'support_bloc.dart';

abstract class SupportEvent {}

class GetFAQs extends SupportEvent {}

class SendMessage extends SupportEvent {
  String message;

  SendMessage({required this.message});
}

class SendFile extends SupportEvent {
  File file;

  SendFile({required this.file});
}

class GetChatMessages extends SupportEvent {}
