import 'package:aquan/core/Helpers/shared_pref_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/constants.dart';
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
          login: (loginRequestBody) async {
            final response = await loginUseCase.login(
              loginRequestBody: loginRequestBody,
            );
            await response.when(
              success: (response) async {
                await SharedPrefHelper.setSecuredString(
                  key: SharedPrefKeys.userToken,
                  value: response!.token,
                );
                emit(
                  const LoginState.success(),
                );
              },
              failure: (
                error,
              ) async {
                emit(
                  LoginState.error(
                    apiErrorModel: error,
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
