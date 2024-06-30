import 'package:aquan/app/sign_up/auth_controller.dart';
import 'package:aquan/app/Auth/controller/user_controller.dart';
import 'package:aquan/Helpers/storage.dart';
import 'package:aquan/app/Auth/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_auth/local_auth.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthController _authController = AuthController();
  final UserController _userController = UserController();
  final LocalAuthentication auth = LocalAuthentication();

  AuthBloc() : super(AuthInitial()) {
    on<AuthLogin>(
      (event, emit) async {
        emit(AuthLoading());
        final Map<String, dynamic> response = await _authController.login(
          event.email,
          event.password,
        );
        if (response['status'] == true) {
          Storage.setString('auth_token', response['token']);
          emit(AuthLogedIn());
        } else {
          emit(
            AuthErrors(message: response['error']),
          );
        }
      },
    );

    on<AuthSignUp>(
      (event, emit) async {
        emit(AuthLoading());
        final Map<String, dynamic> response = await _authController.signUp(
          event.name,
          event.address,
          event.phone,
          event.email,
          event.password,
          event.passwordConfirmation,
          event.code,
        );

        if (response['status'] == true) {
          Storage.setString('auth_token', response['token']);
          emit(AuthLogedIn());
        } else {
          emit(AuthErrors(message: response['error']));
        }
      },
    );

    on<CompleteSignUp>(
      (event, emit) async {
        emit(AuthLoading());
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
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('auth_token');
        if (token == null) {
          emit(
            AuthLogedOut(),
          );
        } else {
          final Map<String, dynamic> response =
              await _authController.isLogedIn(token);
          if (response['status'] == true) {
            if (prefs.getBool("fingerprints")! &&
                await auth.isDeviceSupported()) {
              emit(
                LogedIn(chekBiometric: true),
              );
            } else {
              emit(
                LogedIn(chekBiometric: false),
              );
            }
          } else {
            emit(
              AuthLogedOut(),
            );
          }
        }
      },
    );
    on<CheckEmailVerification>(
      (event, emit) async {
        final Map<String, dynamic> response =
            await _userController.getProfileUser();
        if (response['status'] == true) {
          User user = response['user'];
          if (user.emailVerifiedAt != null) {
            emit(
              VerifiedEmail(),
            );
          } else if (user.emailVerifiedAt == null) {
            emit(
              NotVerifiedEmail(),
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

    on<VerifyEmail>(
      (event, emit) async {
        emit(AuthLoading());
        final Map<String, dynamic> response =
            await _authController.verifyEmail(event.code);
        if (response['status'] == true) {
          // emit(
          //   EmailVerified(),
          // );
        } else {
          // emit(
          //   EmailVerified(),
          // );
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
          // emit(
          //   EmailVerified(),
          // );
        }
      },
    );
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
