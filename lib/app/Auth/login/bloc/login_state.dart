part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginErrors extends LoginState {
  final String? message;

  LoginErrors({required this.message});
}

class LoginLoading extends LoginState {}
