// verify_email_state.dart

part of 'verify_email_bloc.dart';

sealed class VerifyEmailState extends Equatable {
  const VerifyEmailState();

  @override
  List<Object> get props => [];
}

class VerifyEmailInitial extends VerifyEmailState {}

class CodeSendedSuccessfully extends VerifyEmailState {}

class VerifyEmailLoading extends VerifyEmailState {}

class EmailVerifyErrors extends VerifyEmailState {
  final String? message;
  const EmailVerifyErrors({this.message});
}

class EmailVerified extends VerifyEmailState {
  final String? message;

  const EmailVerified({this.message});
}

class EmailNotVerifiedState extends VerifyEmailState {
  final User user;

  const EmailNotVerifiedState({
    required this.user,
  });

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'EmailNotVerifiedState(user: $user)';
}

class SendECodeToEmail extends VerifyEmailState {
  final User user;
  const SendECodeToEmail({
    required this.user,
  });
}
