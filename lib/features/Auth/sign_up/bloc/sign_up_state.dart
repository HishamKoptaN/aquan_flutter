part of 'sign_up_bloc.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class AuthLoading extends SignUpState {}

class SignUpLoading extends SignUpState {}

class CheckLoginLoading extends SignUpState {}

class SignUpSuccessfully extends SignUpState {}

class EmailNotVerify extends SignUpState {
  final User user;
  EmailNotVerify({
    required this.user,
  });
}

class EmailVerified extends SignUpState {
  final bool verified;
  final String? message;

  EmailVerified({required this.verified, this.message});
}

class AuthLogedIn extends SignUpState {
  final bool createPassword;
  AuthLogedIn({this.createPassword = false});
}

class AuthLogedOut extends SignUpState {}

class AuthErrors extends SignUpState {
  final String? message;

  AuthErrors({required this.message});
}

class ResetPassowrdEmailSent extends SignUpState {
  final String message;

  ResetPassowrdEmailSent({required this.message});
}

class SignUpCompleted extends SignUpState {}
