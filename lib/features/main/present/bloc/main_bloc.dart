import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:aquan/core/helpers/shared_pref_helper.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/singletons/user_singleton.dart';
import '../../domain/usecases/main_use_cases.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final LocalAuthentication auth = LocalAuthentication();
  final MainUseCases mainUseCases;
  final FirebaseAuth firebaseAuth;
  MainBloc({
    required this.mainUseCases,
    required this.firebaseAuth,
  }) : super(
          const MainState.loading(),
        ) {
    on<MainEvent>(
      (event, emit) async {
        await event.when(
          check: () async {
            if (isUserLoggedIn()) {
              User? user = FirebaseAuth.instance.currentUser;
              String? idToken = await user!.getIdToken();
              log("id token $idToken");
              final result = await mainUseCases.check();
              await result.when(
                success: (res) async {
                  UserSingleton.instance.user = res?.user;
                  if (res?.verified == false) {
                    emit(
                      const MainState.notVerify(),
                    );
                  } else if (res?.verified == true) {
                    bool checkBiom = await SharedPrefHelper.getBool(
                      key: SharedPrefKeys.fingerprints,
                    );
                    emit(
                      MainState.logedIn(
                        checkBiom: checkBiom,
                      ),
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
          editPass: (editPassReqBodyModel) async {
            emit(
              const MainState.loading(),
            );
            try {
              User? user = FirebaseAuth.instance.currentUser;
              AuthCredential credential = EmailAuthProvider.credential(
                email: user!.email!,
                password: editPassReqBodyModel.currentPassword ?? '',
              );
              await user.reauthenticateWithCredential(credential);
              await user.updatePassword(
                editPassReqBodyModel.newPassword ?? '',
              );
              emit(
                const MainState.success(),
              );
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
        );
      },
    );
  }

  bool isUserLoggedIn() {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
