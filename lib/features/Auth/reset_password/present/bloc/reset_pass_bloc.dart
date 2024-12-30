import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/singletons/user_singleton.dart';
import '../../domain/use_cases/reset_password_use_case.dart';
import '../../domain/use_cases/send_otp_use_case.dart';
import '../../domain/use_cases/verify_otp_use_case.dart';
import 'reset_pass_event.dart';
import 'reset_pass_state.dart';

class ResetPassBloc extends Bloc<ResetPassEvent, ResetPassState> {
  final SendPassOtpUseCase sendOtpUseCase;
  final VerifyPassOtpUseCase verifyOtpUseCase;
  final ResetPassUseCase resetPasswordUseCase;

  ResetPassBloc({
    required this.sendOtpUseCase,
    required this.verifyOtpUseCase,
    required this.resetPasswordUseCase,
  }) : super(
          const ResetPassState.initial(),
        ) {
    on<ResetPassEvent>(
      (event, emit) async {
        await event.when(
          sendOtp: (
            sendOtpReqBodyModel,
          ) async {
            emit(
              const ResetPassState.loading(),
            );
            final response = await sendOtpUseCase.sendOtp(
              sendOtpReqBodyModel: sendOtpReqBodyModel,
            );
            await response.when(
              success: (
                response,
              ) async {
                emit(
                  const ResetPassState.codeSent(),
                );
              },
              failure: (error) async {
                emit(
                  ResetPassState.failure(
                    apiErrorModel: error,
                  ),
                );
              },
            );
          },
          verifyOtp: (verifyOtpReqBodyModel) async {
            emit(
              const ResetPassState.loading(),
            );
            final response = await verifyOtpUseCase.verifyOtp(
              verifyOtpReqBodyModel: verifyOtpReqBodyModel,
            );
            await response.when(
              success: (_) async {
                emit(
                  const ResetPassState.success(),
                );
              },
              failure: (error) async {
                emit(
                  ResetPassState.failure(
                    apiErrorModel: error,
                  ),
                );
              },
            );
          },
          resetPassword: (resetPassReqBody) async {
            emit(
              const ResetPassState.loading(),
            );
            final response = await resetPasswordUseCase.resetPass(
              resetPassReqBody: resetPassReqBody,
            );
            await response.when(
              success: (res) async {
                await SharedPrefHelper.setSecuredString(
                  key: SharedPrefKeys.userToken,
                  value: res!.token!,
                );
                UserSingleton.instance.user = res.user;
                emit(
                  const ResetPassState.success(),
                );
              },
              failure: (error) async {
                emit(
                  ResetPassState.failure(
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
