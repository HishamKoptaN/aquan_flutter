import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_auth/local_auth.dart';
import '../../../core/models/user.dart';
import '../controller/verify_email_controller.dart';
part 'verify_email_event.dart';
part 'verify_email_state.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  final LocalAuthentication auth = LocalAuthentication();
  final VerifyEmailController verifyEmailController = VerifyEmailController();
  VerifyEmailBloc() : super(VerifyEmailInitial()) {
    on<SendEmailVerification>(
      (event, emit) async {
        // final Map<String, dynamic> response =
        //     await _authController.sendCodeToEmail(event.email);
        // if (response['status'] == true) {
        //   emit(CodeSendedSuccessfully());
        // } else {
        //   emit(
        //     EmailVerifyErrors(
        //       message: response['error'],
        //     ),
        //   );
        // }
      },
    );

    on<VerifyEmail>(
      (event, emit) async {
        final Map<String, dynamic> response =
            await verifyEmailController.verifyEmail(event.code);
        if (response['status'] == true) {
          emit(
            const EmailVerified(message: "Email Verified Successfully"),
          );
        } else {
          emit(
            EmailVerifyErrors(
              message: response['error'],
            ),
          );
        }
      },
    );
  }
}
