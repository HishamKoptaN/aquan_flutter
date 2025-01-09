import 'dart:developer';

import 'package:aquan/core/errors/api_error_model.dart';
import 'package:aquan/core/helpers/shared_pref_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/singletons/user_singleton.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/login_with_google_use_case.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  LoginBloc({
    required this.loginUseCase,
    required this.loginWithGoogleUseCase,
  }) : super(
          const LoginState.initial(),
        ) {
    on<LoginEvent>(
      (event, emit) async {
        await event.when(
          login: (
            loginReqBody,
          ) async {
            emit(
              const LoginState.loading(),
            );
            final res = await loginUseCase.login(
              loginReqBody: loginReqBody,
            );
            await res.when(
              success: (
                res,
              ) async {
                await SharedPrefHelper.setSecuredString(
                  key: SharedPrefKeys.userToken,
                  value: res!.token!,
                );
                UserSingleton.instance.user = res.user;
                if (res.verified == false) {
                  emit(
                    const LoginState.notVerify(),
                  );
                } else if (res.verified == true) {
                  emit(
                    const LoginState.success(),
                  );
                }
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
                  await SharedPrefHelper.setSecuredString(
                    key: SharedPrefKeys.userToken,
                    value: idToken!,
                  );
                  log(idToken);
                  final res = await loginWithGoogleUseCase.google();
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
        );
      },
    );
  }
}
