import 'dart:convert';
import 'package:aquan/features/Auth/sign_up/controller/sign_up_controller.dart';
import 'package:aquan/Helpers/storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_auth/local_auth.dart';
import '../../../profile/model/profile_model.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpController _authController = SignUpController();
  final LocalAuthentication auth = LocalAuthentication();

  SignUpBloc() : super(SignUpInitial()) {
    on<AuthSignUp>(
      (event, emit) async {
        emit(SignUpLoading());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final Map<String, dynamic> data = await _authController.signUp(
          event.name,
          event.address,
          event.phone,
          event.email,
          event.password,
          event.passwordConfirmation,
          event.code,
        );
        if (data['status']) {
          Storage.setString('auth_token', data['token']);
          String userJson = json.encode(data['user']);
          prefs.setString('user', userJson);
          emit(SignUpSuccessfully());
        } else if (!data['status']) {
          emit(AuthErrors(message: data['error']));
        }
      },
    );
    on<CheckEmailVerification>(
      (event, emit) async {
        emit(SignUpLoading());
        final Map<String, dynamic> response =
            await _authController.getProfileUser();
        if (response['status'] == true) {
          User user = response['user'];
          if (user.emailVerifiedAt == null) {
            emit(EmailNotVerify(user: user));
          } else if (user.emailVerifiedAt != null) {
            emit(
              EmailVerified(verified: false, message: response['error']),
            );
          }
        } else {
          emit(
            AuthErrors(
              message: response['error'],
            ),
          );
        }
      },
    );

    on<CompleteSignUp>(
      (event, emit) async {
        emit(SignUpLoading());
        final Map<String, dynamic> response =
            await _authController.completeSignUp(
          event.password,
          event.passwordConfirmation,
          event.code,
        );
        if (response['status'] == true) {
          emit(SignUpCompleted());
        } else {
          emit(AuthErrors(message: response['error']));
        }
      },
    );
    on<CheckLogedIn>(
      (event, emit) async {
        emit(SignUpLoading());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('auth_token');
        if (token == '') {
          emit(AuthLogedOut());
        } else {
          final Map<String, dynamic> data =
              await _authController.isLogedIn(token);
          if (data['status']) {
            prefs.setString(
              'user',
              json.encode(
                data['user'],
              ),
            );
            final bool canAuthenticate = await auth.canCheckBiometrics &&
                await auth.isDeviceSupported() &&
                prefs.getBool("fingerprints")!;
            if (canAuthenticate) {
              final bool didAuth = await auth.authenticate(
                  localizedReason:
                      'First Please authenticate to show access account');
              if (didAuth) {
                emit(AuthLogedIn());
              } else {
                emit(AuthErrors(message: "Error try again"));
              }
            } else {
              emit(AuthLogedIn());
            }
          } else {
            emit(AuthLogedOut());
          }
        }
      },
    );

    on<ResetPassword>(
      (event, emit) async {
        final Map<String, dynamic> response =
            await _authController.resetPassword(event.email);

        if (response['status'] == true) {
          emit(
            ResetPassowrdEmailSent(
              message: response['message'],
            ),
          );
        } else {
          emit(
            AuthErrors(
              message: response['error'],
            ),
          );
        }
      },
    );

    on<SignInWithGoogle>(
      (event, emit) async {
        emit(AuthLoading());
        final Map<String, dynamic> response =
            await _authController.signInWithGoogle(
          event.email,
          event.name,
        );

        if (response['status'] == true) {
          Storage.setString('auth_token', response['token']);
          emit(AuthLogedIn(createPassword: response['create_password']));
        } else {
          emit(EmailVerified(verified: true, message: response['error']));
        }
      },
    );
  }
}
