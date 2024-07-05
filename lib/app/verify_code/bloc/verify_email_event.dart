// verify_email_event.dart
part of 'verify_email_bloc.dart';

sealed class VerifyEmailEvent extends Equatable {
  const VerifyEmailEvent();

  @override
  List<Object> get props => [];
}

class SendEmailVerification extends VerifyEmailEvent {
  final String email;
  SendEmailVerification({required this.email});
}

class SendVerificationCodeToEmailEvent extends VerifyEmailEvent {
  final String email;
  const SendVerificationCodeToEmailEvent({required this.email});
}

class VerifyEmail extends VerifyEmailEvent {
  final String code;
  const VerifyEmail({required this.code});
}
