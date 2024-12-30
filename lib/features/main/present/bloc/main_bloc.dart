import 'package:aquan/core/helpers/shared_pref_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/singletons/user_singleton.dart';
import '../../domain/usecases/edit_pass_use_case.dart';
import '../../domain/usecases/check_use_case.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final LocalAuthentication auth = LocalAuthentication();
  final CheckUseCase checkUseCase;
  final EditPassUseCase editPassUseCase;

  MainBloc({
    required this.checkUseCase,
    required this.editPassUseCase,
  }) : super(
          const MainState.loading(),
        ) {
    on<MainEvent>(
      (event, emit) async {
        await event.when(
          check: () async {
            String? token = await SharedPrefHelper.getSecuredString(
              key: SharedPrefKeys.userToken,
            );
            if (token == null || token.isEmpty) {
              emit(const MainState.logedOut());
            } else {
              final result = await checkUseCase.check();
              await result.when(
                success: (res) async {
                  UserSingleton.instance.user = res?.user;
                  if (res?.verified == false) {
                    emit(
                      const MainState.notVerify(),
                    );
                  } else if (res?.verified == true) {
                    emit(
                      const MainState.logedIn(),
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
            final result = await editPassUseCase.editPass(
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
