import 'package:bloc/bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';

import '../../../sign_up/auth_controller.dart';
import '../../controller/user_controller.dart';
import '../../model/user.dart';

part 'verify_email_event.dart';
part 'verify_email_state.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, EmailVerifyState> {
  final AuthController _authController = AuthController();
  final UserController _userController = UserController();
  final LocalAuthentication auth = LocalAuthentication();
  VerifyEmailBloc() : super(VerifyEmailInitial()) {
    on<VerifyEmailEvent>((event, emit) {});
    on<SendEmailVerification>(
      (event, emit) async {
        final Map<String, dynamic> response =
            await _authController.sendCodeToEmail(event.email);
        if (response['status'] == true) {
          User user = response['user'];
          emit(
            EmailVerify(verified: user.emailVerifiedAt != null, user: User()),
          );
        } else {
          // emit(
          //   AuthErrors(
          //     message: response['error'],
          //   ),
          // );
        }
      },
    );
  }
}
