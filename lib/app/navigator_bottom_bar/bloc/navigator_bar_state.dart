part of 'navigator_bar_bloc.dart';

@immutable
sealed class NavigatorBarState {}

final class NavigatorBarInitial extends NavigatorBarState {}

final class AuthInitial extends NavigatorBarState {}

final class AuthLoading extends NavigatorBarState {}

final class CheckLoginLoading extends NavigatorBarState {}

class AuthLogedIn extends NavigatorBarState {
  final bool createPassword;

  AuthLogedIn({this.createPassword = false});
}

class AuthLogedOut extends NavigatorBarState {}

class NotVerifiedEmail extends NavigatorBarState {}

class VerifiedEmail extends NavigatorBarState {}

class LogedIn extends NavigatorBarState {
  bool? chekBiometric;
  bool? verivied;
  LogedIn({this.chekBiometric, this.verivied});
}

class AuthErrors extends NavigatorBarState {
  final String? message;

  AuthErrors({required this.message});
}

class ResetPassowrdEmailSent extends NavigatorBarState {
  final String message;

  ResetPassowrdEmailSent({required this.message});
}

class SignUpCompleted extends NavigatorBarState {}
