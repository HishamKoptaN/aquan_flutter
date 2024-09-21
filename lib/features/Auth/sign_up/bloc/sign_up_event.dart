part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class CheckLogedIn extends SignUpEvent {}

class CheckEmailVerification extends SignUpEvent {}

class AuthSignUp extends SignUpEvent {
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
    required this.code,
  });
}

class ResetPassword extends SignUpEvent {
  String email;
  ResetPassword({
    required this.email,
  });
}

class SignInWithGoogle extends SignUpEvent {
  final String email;
  final String name;

  SignInWithGoogle({
    required this.email,
    required this.name,
  });
}

class CompleteSignUp extends SignUpEvent {
  final String password;
  final String passwordConfirmation;
  final String? code;

  CompleteSignUp({
    required this.password,
    required this.passwordConfirmation,
    this.code,
  });
}
