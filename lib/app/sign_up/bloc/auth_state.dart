part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class CheckLoginLoading extends AuthState {}

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

class EmailVerify extends AuthState {
  final bool verified;
  final String? message;
  final User user;
  EmailVerify({required this.user, required this.verified, this.message});
}

class EmailVerified extends AuthState {
  final bool verified;
  final String? message;

  EmailVerified({required this.verified, this.message});
}

class SendECodeToEmail extends AuthState {
  final bool verified;
  final User user;

  SendECodeToEmail({
    required this.user,
    required this.verified,
  });
}

class ResetPassowrdEmailSent extends AuthState {
  final String message;

  ResetPassowrdEmailSent({required this.message});
}

class SignUpCompleted extends AuthState {}
