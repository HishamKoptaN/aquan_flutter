part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class CheckLoginLoading extends AuthState {}

class EmailNotVerify extends AuthState {
  final User user;
  EmailNotVerify({
    required this.user,
  });
}

class EmailVerified extends AuthState {
  final bool verified;
  final String? message;

  EmailVerified({required this.verified, this.message});
}

class AuthLogedIn extends AuthState {
  final bool createPassword;

  AuthLogedIn({this.createPassword = false});
}

class AuthLogedOut extends AuthState {}

class LogedIn extends AuthState {}

class AuthErrors extends AuthState {
  final String? message;

  AuthErrors({required this.message});
}

class ResetPassowrdEmailSent extends AuthState {
  final String message;

  ResetPassowrdEmailSent({required this.message});
}

class SignUpCompleted extends AuthState {}
