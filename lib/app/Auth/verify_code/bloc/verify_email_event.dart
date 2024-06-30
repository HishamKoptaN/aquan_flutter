part of 'verify_email_bloc.dart';

@immutable
sealed class VerifyEmailEvent {}

class SendEmailVerification extends VerifyEmailEvent {
  final String email;
  SendEmailVerification({required this.email});
}
