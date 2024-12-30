import '../../../features/auth/login/present/bloc/login_bloc.dart';
import '../../../features/auth/reset_password/present/bloc/reset_pass_bloc.dart';
import '../../../features/auth/sign_up/present/bloc/sign_up_bloc.dart';
import '../../../features/accounts/presentation/bloc/accounts_bloc.dart';
import '../../../features/auth/verify_email/present/bloc/email_verify_bloc.dart';
import '../../../features/buy_sell/present/bloc/buy_sell_bloc.dart';
import '../../../features/dash/present/bloc/dash_bloc.dart';
import '../../../features/deposit/pesent/bloc/deposits_bloc.dart';
import '../../../features/main/present/bloc/main_bloc.dart';
import '../../../features/profile/present/bloc/profile_bloc.dart';
import '../../../features/send_to_account/present/bloc/send_to_account_bloc.dart';
import '../../../features/support/present/bloc/support_bloc.dart';
import '../../../features/tasks/present/bloc/task_bloc.dart';
import '../../../features/trans/present/bloc/trans_bloc.dart';
import '../../../features/withdraw/present/bloc/withdraws_bloc.dart';
import '../dependency_injection.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton<MainBloc>(
        () => MainBloc(
          checkUseCase: getIt(),
          editPassUseCase: getIt(),
        ),
      )
      ..registerLazySingleton<VerifyEmailBloc>(
        () => VerifyEmailBloc(
          sendEmailOtpUseCase: getIt(),
          verifyEmailOtpUseCase: getIt(),
        ),
      )
      ..registerLazySingleton<ResetPassBloc>(
        () => ResetPassBloc(
          sendOtpUseCase: getIt(),
          verifyOtpUseCase: getIt(),
          resetPasswordUseCase: getIt(),
        ),
      )
      ..registerLazySingleton<LoginBloc>(
        () => LoginBloc(
          getIt(),
        ),
      )
      ..registerLazySingleton<SignUpBloc>(
        () => SignUpBloc(
          signUpUseCase: getIt(),
        ),
      )
      ..registerLazySingleton<DashBloc>(
        () => DashBloc(
          getDashUseCase: getIt(),
        ),
      )
      ..registerLazySingleton<DepositsBloc>(
        () => DepositsBloc(
          getDepositstUseCase: getIt(),
          getEmployeeAccountUseCase: getIt(),
          depositUseCase: getIt(),
        ),
      )
      ..registerLazySingleton<WithdrawsBloc>(
        () => WithdrawsBloc(
          getWithdrawsUseCase: getIt(),
          getWithdrawRatesUseCase: getIt(),
          addWithdrawUseCase: getIt(),
        ),
      )
      ..registerLazySingleton<TransBloc>(
        () => TransBloc(
          getIt(),
        ),
      )
      ..registerLazySingleton<BuySellBloc>(
        () => BuySellBloc(
          getBuySellRatesUse: getIt(),
          getReceiveAccountNumberUseCase: getIt(),
          transferMoneyUseCase: getIt(),
        ),
      )
      ..registerLazySingleton<SendToAccountBloc>(
        () => SendToAccountBloc(
          getNameOfUserByAccountUseCase: getIt(),
          sendToAccountUseCase: getIt(),
        ),
      )
      ..registerLazySingleton<SupportBloc>(
        () => SupportBloc(
            // getMsgsUseCase: getIt(),
            // sendMsgUseCase: getIt(),
            ),
      )
      ..registerLazySingleton<AccountsBloc>(
        () => AccountsBloc(
          getAccountsUseCase: getIt(),
          editAccountUseCase: getIt(),
        ),
      )
      ..registerLazySingleton<TasksBloc>(
        () => TasksBloc(
          getTaskDetailsUseCase: getIt(),
          getTasksUseCase: getIt(),
          proofTaskUseCase: getIt(),
        ),
      )
      ..registerLazySingleton<ProfileBloc>(
        () => ProfileBloc(
          editProfileUseCase: getIt(),
        ),
      );
  }
}
