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

class NotVerifiedEmail extends AuthState {}

class VerifiedEmail extends AuthState {}

class EmailVerified extends AuthState {
  final bool verified;
  final String? message;

  EmailVerified({required this.verified, this.message});
}

class LogedIn extends AuthState {
  bool? chekBiometric;
  bool? verivied;
  LogedIn({this.chekBiometric, this.verivied});
}

class AuthErrors extends AuthState {
  final String? message;

  AuthErrors({required this.message});
}

class ResetPassowrdEmailSent extends AuthState {
  final String message;

  ResetPassowrdEmailSent({required this.message});
}

class SignUpCompleted extends AuthState {}
