import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/api_error_model.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/models/user.dart';
import '../../../../../core/singletons/user_singleton.dart';
import '../../domain/use_cases/sign_up_use_cases.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

@LazySingleton()
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCases signUpUseCases;

  SignUpBloc({
    required this.signUpUseCases,
  }) : super(const SignUpState.initial()) {
    on<SignUpEvent>(
      (event, emit) async {
        await event.when(
          signUp: (signUpReqBody) async {
            emit(
              const SignUpState.loading(),
            );
            final firebaseResult = await signUpUseCases.firebaseSignUp(
              email: signUpReqBody.email ?? "",
              password: signUpReqBody.password ?? "",
            );
            await firebaseResult.fold(
              (failure) async {
                emit(
                  SignUpState.failure(
                    apiErrorModel: ApiErrorModel(
                      error: failure.message,
                    ),
                  ),
                );
              },
              (
                idToken,
              ) async {
                log(idToken);
                final result = await signUpUseCases.signUp(
                  signUpReqBody: signUpReqBody.copyWith(
                    idToken: idToken,
                  ),
                );
                await result.when(
                  success: (
                    signUpResModel,
                  ) async {
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
                  failure: (
                    apiErrorModel,
                  ) async {
                    emit(
                      SignUpState.failure(
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
    );
  }
}
