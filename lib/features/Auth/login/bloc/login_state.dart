// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});
}

class LoginErrors extends LoginState {
  final String? message;

  LoginErrors({required this.message});
}

class AuthLogedInSuccessfully extends LoginState {
  final bool createPassword;
  AuthLogedInSuccessfully({this.createPassword = false});
}

class AuthLogedOut extends LoginState {}
