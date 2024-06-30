part of 'navigator_bar_bloc.dart';

@immutable
sealed class NavigatorBarEvent {}

class CheckLogedIn extends NavigatorBarEvent {}

class AuthLogin extends NavigatorBarEvent {
  final String email;
  final String password;

  AuthLogin({
    required this.email,
    required this.password,
  });
}

class AuthSignUp extends NavigatorBarEvent {
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

class CheckEmailVerification extends NavigatorBarEvent {}

class EmailVerificaty extends NavigatorBarEvent {}

class ResetPassword extends NavigatorBarEvent {
  String email;
  ResetPassword({
    required this.email,
  });
}

class VerifyEmail extends NavigatorBarEvent {
  final String code;
  VerifyEmail({required this.code});
}

class SignInWithGoogle extends NavigatorBarEvent {
  final String email;
  final String name;

  SignInWithGoogle({
    required this.email,
    required this.name,
  });
}

class CompleteSignUp extends NavigatorBarEvent {
  final String password;
  final String passwordConfirmation;
  final String? code;

  CompleteSignUp({
    required this.password,
    required this.passwordConfirmation,
    this.code,
  });
}
