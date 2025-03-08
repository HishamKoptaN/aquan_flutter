import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/models/user.dart';
import '../../../../../core/singletons/user_singleton.dart';
import '../../domain/use_cases/sign_up_use_case.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;
  final LocalAuthentication auth = LocalAuthentication();

  SignUpBloc({
    required this.signUpUseCase,
  }) : super(
          const SignUpState.initial(),
        ) {
    on<SignUpEvent>(
      (event, emit) async {
        await event.when(
          signUp: (signUpReqBody) async {
            emit(
              const SignUpState.loading(),
            );
            final result = await signUpUseCase.signUp(
              signUpReqBody: signUpReqBody,
            );
            await result.when(
              success: (signUpResModel) async {
                await SharedPrefHelper.setSecuredString(
                  key: SharedPrefKeys.userToken,
                  value: signUpResModel?.token ?? '',
                );
                UserSingleton.instance.user =
                    signUpResModel?.user ?? const UserModel();
                emit(
                  SignUpState.success(
                    signUpResModel: signUpResModel!,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  SignUpState.error(
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
