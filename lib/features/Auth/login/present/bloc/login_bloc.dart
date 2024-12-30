import 'package:aquan/core/helpers/shared_pref_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/singletons/user_singleton.dart';
import '../../domain/use_cases/login_use_case.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  LoginBloc(
    this.loginUseCase,
  ) : super(
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
        );
      },
    );
  }
}
