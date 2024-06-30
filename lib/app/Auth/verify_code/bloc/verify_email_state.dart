part of 'verify_email_bloc.dart';

@immutable
sealed class EmailVerifyState {}

final class VerifyEmailInitial extends EmailVerifyState {}

class EmailVerify extends EmailVerifyState {
  final bool verified;
  final String? message;
  final User user;
  EmailVerify({required this.user, required this.verified, this.message});
}

class NotVerifiedEmail extends EmailVerifyState {}

class VerifiedEmail extends EmailVerifyState {}

class SendECodeToEmail extends EmailVerifyState {
  final bool verified;
  final User user;
  SendECodeToEmail({
    required this.user,
    required this.verified,
  });
}
