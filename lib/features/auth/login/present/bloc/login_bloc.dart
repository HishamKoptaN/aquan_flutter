import 'dart:developer';
import 'package:aquan/core/errors/api_error_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/errors/firebase_failures.dart';
import '../../../../../core/methods/authentication_helper.dart';
import '../../../../../core/singletons/user_singleton.dart';
import '../../data/models/auth_id_token_req_body_model.dart';
import '../../domain/use_cases/login_use_cases.dart';
import 'login_event.dart';
import 'login_state.dart';

// heshamkoptan@gmail.com
// password
@LazySingleton()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCases loginUseCases;
  final FirebaseAuth auth;
  final AuthService authService;

  LoginBloc({
    required this.loginUseCases,
    required this.auth,
    required this.authService,
  }) : super(
          const LoginState.initial(),
        ) {
    on<LoginEvent>(
      (event, emit) async {
        await event.when(
          fireLogin: (
            firabaseLoginReqBodyModel,
          ) async {
            emit(
              const LoginState.loading(),
            );

            final result = await loginUseCases.firebaseLogin(
              firabaseLoginReqBodyModel: firabaseLoginReqBodyModel,
            );
            await result.fold(
              (
                firebaseFailure,
              ) {
                emit(
                  LoginState.failure(
                    apiErrorModel: mapFailureToError(
                      firebaseFailure: firebaseFailure,
                    ),
                  ),
                );
              },
              (userCredential) async {
                await userCredential.user?.getIdToken().then(
                  (
                    idToken,
                  ) async {
                    final res = await loginUseCases.authToken(
                      authIdTokenReqBodyModel:
                          const AuthIdTokenReqBodyModel().copyWith(
                        idToken: idToken,
                      ),
                    );
                    await res.when(
                      success: (
                        res,
                      ) async {
                        await SharedPrefHelper.setSecuredString(
                          key: SharedPrefKeys.userToken,
                          value: res?.token ?? '',
                        );
                        UserSingleton.instance.user = res?.user;
                        emit(
                          LoginState.success(),
                        );
                      },
                      failure: (
                        apiErrorModel,
                      ) async {
                        emit(
                          LoginState.failure(
                            apiErrorModel: apiErrorModel,
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
          google: () async {
            try {
              emit(
                const LoginState.loading(),
              );
              final GoogleSignInAccount? googleUser = await GoogleSignIn(
                scopes: [
                  'email',
                  'profile',
                ],
              ).signIn();
              final GoogleSignInAuthentication? googleAuth =
                  await googleUser?.authentication;
              final credential = GoogleAuthProvider.credential(
                accessToken: googleAuth?.accessToken,
                idToken: googleAuth?.idToken,
              );
              await FirebaseAuth.instance.signInWithCredential(
                credential,
              );
              await FirebaseAuth.instance.currentUser
                  ?.getIdToken(
                true,
              )
                  .then(
                (idToken) async {
                  AuthIdTokenReqBodyModel authIdTokenReqBodyModel =
                      AuthIdTokenReqBodyModel();
                  await SharedPrefHelper.setSecuredString(
                    key: SharedPrefKeys.userToken,
                    value: idToken!,
                  );
                  log(idToken);
                  final res = await loginUseCases.authToken(
                      authIdTokenReqBodyModel: authIdTokenReqBodyModel);
                  await res.when(
                    success: (res) async {
                      UserSingleton.instance.user = res!.user;
                      await SharedPrefHelper.setSecuredString(
                        key: SharedPrefKeys.userToken,
                        value: res.token!,
                      );
                      UserSingleton.instance.user = res.user;
                      emit(
                        const LoginState.success(),
                      );
                    },
                    failure: (apiErrorModel) async {
                      emit(
                        LoginState.failure(
                          apiErrorModel: apiErrorModel,
                        ),
                      );
                    },
                  );
                },
              );
            } on Exception catch (e) {
              LoginState.failure(
                apiErrorModel: ApiErrorModel(
                  error: e.toString(),
                ),
              );
            }
          },
          resetPass: (
            resetPassReqBodyModel,
          ) async {
            emit(
              const LoginState.loading(),
            );
            try {
              await auth.sendPasswordResetEmail(
                  email: resetPassReqBodyModel.email!.trim());
              emit(
                const LoginState.linkSent(),
              );
            } catch (e) {
              emit(
                LoginState.failure(
                  apiErrorModel: ApiErrorModel(
                    error: e.toString(),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
  ApiErrorModel mapFailureToError({
    required FirebaseFailure firebaseFailure,
  }) {
    if (firebaseFailure is ExistedAccountFailure) {
      return ApiErrorModel(error: 'Account already exists');
    } else if (firebaseFailure is WrongPasswordFailure) {
      return ApiErrorModel(error: 'Incorrect password');
    } else if (firebaseFailure is OfflineFailure) {
      return ApiErrorModel(error: 'No internet connection');
    } else {
      return ApiErrorModel(error: 'Unknown error occurred');
    }
  }
}
