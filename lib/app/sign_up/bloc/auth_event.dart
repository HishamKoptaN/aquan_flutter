part of 'auth_bloc.dart';

abstract class AuthEvent {}

class CheckLogedIn extends AuthEvent {}

class CheckEmailVerification extends AuthEvent {}

class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  AuthLogin({
    required this.email,
    required this.password,
  });
}

class AuthSignUp extends AuthEvent {
  final String name;
  final String address;
  final String phone;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String? code;

  AuthSignUp({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    this.code,
  });
}

class ResetPassword extends AuthEvent {
  String email;
  ResetPassword({
    required this.email,
  });
}

class SignInWithGoogle extends AuthEvent {
  final String email;
  final String name;

  SignInWithGoogle({
    required this.email,
    required this.name,
  });
}

class CompleteSignUp extends AuthEvent {
  final String password;
  final String passwordConfirmation;
  final String? code;

  CompleteSignUp({
    required this.password,
    required this.passwordConfirmation,
    this.code,
  });
}
