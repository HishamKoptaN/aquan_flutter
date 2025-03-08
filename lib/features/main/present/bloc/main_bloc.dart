import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:aquan/core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/singletons/user_singleton.dart';
import '../../domain/usecases/main_use_cases.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final LocalAuthentication auth = LocalAuthentication();
  final MainUseCases mainUseCases;

  MainBloc({
    required this.mainUseCases,
  }) : super(
          const MainState.loading(),
        ) {
    on<MainEvent>(
      (event, emit) async {
        await event.when(
          check: () async {
            User? user = FirebaseAuth.instance.currentUser;
            if (user == null) {
              log("User is not logged in.");
              emit(const MainState.logedOut());
              //  emit(const MainState.logedIn());
              return;
            }
            String? token = await SharedPrefHelper.getSecuredString(
              key: SharedPrefKeys.userToken,
            );
            if (token == null || token.isEmpty) {
              emit(const MainState.logedOut());
            } else {
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
            }
          },
          editPass: (editPassReqBodyModel) async {
            emit(
              const MainState.loading(),
            );
            final result = await mainUseCases.editPass(
              editPassReqBodyModel: editPassReqBodyModel,
            );
            await result.when(
              success: (_) async {
                emit(
                  const MainState.success(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  MainState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          checkEmailVerification: () async {},
        );
      },
    );
  }
}
