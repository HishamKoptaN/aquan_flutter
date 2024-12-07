import 'package:aquan/core/helpers/shared_pref_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/singletons/user_singleton.dart';
import '../../domain/usecases/check_use_case.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final LocalAuthentication auth = LocalAuthentication();
  final CheckUseCase checkUseCase;

  MainBloc(this.checkUseCase)
      : super(
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
                success: (response) async {
                  UserSingleton.instance.user = response;
                  emit(
                    const MainState.logedIn(),
                  );
                },
                failure: (error) async {
                  emit(
                    const MainState.logedOut(),
                  );
                },
              );
            }
          },
          checkEmailVerification: () {},
        );
      },
    );
  }
}
