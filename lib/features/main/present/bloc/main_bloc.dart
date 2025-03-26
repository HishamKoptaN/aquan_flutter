import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:aquan/core/helpers/shared_pref_helper.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/methods/authentication_helper.dart';
import '../../../../core/singletons/user_singleton.dart';
import '../../domain/usecases/main_use_cases.dart';
import 'main_event.dart';
import 'main_state.dart';

@LazySingleton()
class MainBloc extends Bloc<MainEvent, MainState> {
  final LocalAuthentication auth = LocalAuthentication();
  final MainUseCases mainUseCases;
  final FirebaseAuth firebaseAuth;
  final AuthService authService;
  Timer? _emailVerificationTimer;

  MainBloc({
    required this.mainUseCases,
    required this.firebaseAuth,
    required this.authService,
  }) : super(const MainState.loading()) {
    on<MainEvent>(
      (event, emit) async {
        await event.when(
          //!  ckeck logedIn
          checkLogedIn: () async {
            if (await authService.isUserLoggedIn()) {
              final result = await mainUseCases.check();
              await result.when(
                success: (
                  res,
                ) async {
                  UserSingleton.instance.user = res?.user;
                  if (await authService.isEmailVerified()) {
                    emit(
                      MainState.logedIn(
                        checkBiom: await SharedPrefHelper.getBool(
                          key: SharedPrefKeys.fingerprints,
                        ),
                      ),
                    );
                  } else {
                    emit(
                      const MainState.notVerify(),
                    );
                  }
                },
                failure: (error) async {
                  emit(
                    const MainState.logedOut(),
                  );
                },
              );
            } else {
              emit(
                const MainState.logedOut(),
              );
            }
          },
          //!  ckeckEmailVeification
          checkEmailVerification: () async {
            if (await authService.isEmailVerified()) {
              emit(
                MainState.logedIn(
                  checkBiom: await SharedPrefHelper.getBool(
                    key: SharedPrefKeys.fingerprints,
                  ),
                ),
              );
            } else {
              emit(
                const MainState.notVerify(),
              );
            }
          },
          editPass: (
            editPassReqBodyModel,
          ) async {
            emit(
              const MainState.loading(),
            );
            try {
              User? user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                AuthCredential credential = EmailAuthProvider.credential(
                  email: user.email!,
                  password: editPassReqBodyModel.currentPassword ?? '',
                );
                await user.reauthenticateWithCredential(
                  credential,
                );
                await user
                    .updatePassword(editPassReqBodyModel.newPassword ?? '');
                emit(
                  const MainState.success(),
                );
              } else {
                emit(
                  MainState.failure(
                    apiErrorModel: ApiErrorModel(
                      error: "المستخدم غير مسجل دخول",
                    ),
                  ),
                );
              }
            } catch (e) {
              emit(
                MainState.failure(
                  apiErrorModel: ApiErrorModel(
                    error: "حدث خطأ غير معروف",
                  ),
                ),
              );
            }
          },
          sendVerificationLink: () async {
            await authService.resendVerificationEmail();
            emit(
              const MainState.emailVerificationLinkSent(),
            );
            _startEmailVerificationMonitor();
          },

          submit: () {},
        );
      },
    );
  }
  void _startEmailVerificationMonitor() {
    _stopEmailVerificationMonitor();
    _emailVerificationTimer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) async {
        if (await authService.isEmailVerified()) {
          timer.cancel();
          add(
            MainEvent.checkEmailVerification(),
          );
        }
      },
    );
  }

  //! 🔴 وظيفة لإيقاف المراقبة عند التأكيد أو الخروج
  void _stopEmailVerificationMonitor() {
    _emailVerificationTimer?.cancel();
    _emailVerificationTimer = null;
  }

  @override
  Future<void> close() {
    _stopEmailVerificationMonitor();
    return super.close();
  }
}
