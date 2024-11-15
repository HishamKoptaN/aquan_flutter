import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/sign_up_request_body.dart';
part 'sign_up_event.freezed.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.signUp({
    required SignUpRequestBody signUpRequestBody,
  }) = _SignUpEvent;
}



// class ResetPassword extends SignUpEvent {
//   String email;
//   ResetPassword({
//     required this.email,
//   });
// }

// class SignInWithGoogle extends SignUpEvent {
//   final String email;
//   final String name;

//   SignInWithGoogle({
//     required this.email,
//     required this.name,
//   });
// }

// class CompleteSignUp extends SignUpEvent {
//   final String password;
//   final String passwordConfirmation;
//   final String? code;

//   CompleteSignUp({
//     required this.password,
//     required this.passwordConfirmation,
//     this.code,
//   });
// }
