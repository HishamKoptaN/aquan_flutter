// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:local_auth/local_auth.dart' as _i152;

import '../../features/accounts/data/datasources/accounts_api.dart' as _i363;
import '../../features/accounts/data/repo_impl/accounts_repo_impl.dart'
    as _i356;
import '../../features/accounts/domain/repo/accounts_rep.dart' as _i42;
import '../../features/accounts/domain/usecases/edit_accounts_usecase.dart'
    as _i199;
import '../../features/accounts/domain/usecases/get_accounts_usecase.dart'
    as _i297;
import '../../features/accounts/present/bloc/accounts_bloc.dart' as _i133;
import '../../features/auth/login/data/data_sources/login_api.dart' as _i685;
import '../../features/auth/login/data/repo_imp/login_repo_impl.dart' as _i328;
import '../../features/auth/login/domain/repo/login_repo.dart' as _i632;
import '../../features/auth/login/domain/use_cases/login_use_cases.dart'
    as _i685;
import '../../features/auth/login/present/bloc/login_bloc.dart' as _i702;
import '../../features/auth/sign_up/data/data_sources/sign_up_api.dart'
    as _i552;
import '../../features/auth/sign_up/data/repo_impl/sign_up_repo_imp.dart'
    as _i941;
import '../../features/auth/sign_up/domain/repo/sign_up_repo.dart' as _i871;
import '../../features/auth/sign_up/domain/use_cases/sign_up_use_case.dart'
    as _i45;
import '../../features/auth/sign_up/present/bloc/sign_up_bloc.dart' as _i226;
import '../../features/auth/verify_email/data/data_sources/api/verify_email_api.dart'
    as _i1039;
import '../../features/auth/verify_email/data/repo/email_verify_repo_impl.dart'
    as _i630;
import '../../features/auth/verify_email/domain/repo/email_verify_repo.dart'
    as _i534;
import '../../features/auth/verify_email/domain/use_cases/send_email_otp_use_case.dart'
    as _i518;
import '../../features/auth/verify_email/domain/use_cases/verify_email_otp_use_case.dart'
    as _i102;
import '../../features/buy_sell/data/data_source/buy_sell_api.dart' as _i397;
import '../../features/buy_sell/data/repo/buy_sell_repo.dart' as _i174;
import '../../features/buy_sell/domain/repo_impl/buy_sell_repo_impl.dart'
    as _i301;
import '../../features/buy_sell/domain/use_cases/get_buy_sell_rates_use_case.dart'
    as _i486;
import '../../features/buy_sell/domain/use_cases/get_receive_account_number_use_case.dart'
    as _i12;
import '../../features/buy_sell/domain/use_cases/transfer_money_use_case.dart'
    as _i290;
import '../../features/buy_sell/present/bloc/buy_sell_bloc.dart' as _i959;
import '../../features/controll/data/data_sources/controll_api.dart' as _i268;
import '../../features/controll/data/repo/controll_repo.dart' as _i866;
import '../../features/controll/domain/repo_impl/controll_repo_impl.dart'
    as _i5;
import '../../features/controll/domain/use_cases/controll_use_cases.dart'
    as _i1064;
import '../../features/controll/present/bloc/controll_bloc.dart' as _i864;
import '../../features/dash/data/data_sources/dash_api.dart' as _i935;
import '../../features/dash/data/repo/dash_repo.dart' as _i267;
import '../../features/dash/domain/repo_imp/dash_repo_impl.dart' as _i421;
import '../../features/dash/domain/use_cases/get_dash_use_case.dart' as _i408;
import '../../features/dash/present/bloc/dash_bloc.dart' as _i542;
import '../../features/deposit/data/data_sources/deposits_api.dart' as _i108;
import '../../features/deposit/data/repo/deposits_repo.dart' as _i296;
import '../../features/deposit/domain/repo_imp/deposits_repo_impl.dart'
    as _i334;
import '../../features/deposit/domain/use_cases/deposit_use_cases.dart'
    as _i885;
import '../../features/deposit/pesent/bloc/deposits_bloc.dart' as _i865;
import '../../features/language/bloc/language_bloc.dart' as _i724;
import '../../features/local_auth/bloc/biometric_bloc.dart' as _i305;
import '../../features/main/data/datasources/main_api.dart' as _i942;
import '../../features/main/data/repo_impl/main_repo_impl.dart' as _i880;
import '../../features/main/domain/repo/main_repo.dart' as _i587;
import '../../features/main/domain/usecases/main_use_cases.dart' as _i422;
import '../../features/main/present/bloc/main_bloc.dart' as _i924;
import '../../features/notifications/data/datasources/notifications_api.dart'
    as _i352;
import '../../features/notifications/data/repo/notifications_repo.dart'
    as _i1007;
import '../../features/notifications/domain/repo_imp/notifications_repo_impl.dart'
    as _i291;
import '../../features/notifications/domain/use_cases/get_notifications_use_case.dart'
    as _i139;
import '../../features/notifications/present/bloc/notifications_bloc.dart'
    as _i781;
import '../../features/plans/data/data_source/plans_api.dart' as _i1000;
import '../../features/plans/data/repo/plans_repo.dart' as _i768;
import '../../features/plans/domain/repo_imp/plans_repo_impl.dart' as _i988;
import '../../features/plans/domain/use_cases/change_plan_use_case.dart'
    as _i635;
import '../../features/plans/domain/use_cases/get_plans_rates_use_case.dart'
    as _i933;
import '../../features/plans/domain/use_cases/get_plans_use_case.dart' as _i333;
import '../../features/plans/present/bloc/plans_bloc.dart' as _i336;
import '../../features/profile/data/data_sources/profile_api.dart' as _i480;
import '../../features/profile/data/repo/profile_repo.dart' as _i433;
import '../../features/profile/domain/repo_impl/profile_repo_impl.dart'
    as _i740;
import '../../features/profile/domain/use_cases/edit_profile_use_case.dart'
    as _i199;
import '../../features/profile/present/bloc/profile_bloc.dart' as _i475;
import '../../features/qr_code/bloc/qr_code_bloc.dart' as _i907;
import '../../features/send_to_account/data/datasources/send_to_account_api.dart'
    as _i348;
import '../../features/send_to_account/data/repo/send_to_account_repo.dart'
    as _i774;
import '../../features/send_to_account/domain/repo_imp/send_to_account_repo_impl.dart'
    as _i121;
import '../../features/send_to_account/domain/use_cases/get_username_by_account_use_case.dart'
    as _i336;
import '../../features/send_to_account/domain/use_cases/send_to_account_use_case.dart'
    as _i547;
import '../../features/send_to_account/present/bloc/send_to_account_bloc.dart'
    as _i768;
import '../../features/support/data/data_sources/support_api.dart' as _i414;
import '../../features/support/data/repo/support_repo.dart' as _i611;
import '../../features/support/domain/repo_impl/support_repo_impl.dart'
    as _i938;
import '../../features/support/domain/use_cases/support_use_cases.dart'
    as _i278;
import '../../features/support/present/bloc/support_bloc.dart' as _i562;
import '../../features/tasks/data/data_sources/tasks_api.dart' as _i64;
import '../../features/tasks/data/repo/tasks_repo.dart' as _i915;
import '../../features/tasks/domain/repo_impl/tasks_repo_impl.dart' as _i872;
import '../../features/tasks/domain/use_cases/get_task_details_use_case.dart'
    as _i739;
import '../../features/tasks/domain/use_cases/get_tasks_use_case.dart' as _i985;
import '../../features/tasks/domain/use_cases/proof_task_use_case.dart'
    as _i407;
import '../../features/tasks/present/bloc/task_bloc.dart' as _i307;
import '../../features/trans/data/data_source/trans_api.dart' as _i975;
import '../../features/trans/data/repo/transactions_repo.dart' as _i251;
import '../../features/trans/domain/repo_imp/trans_repo_impl.dart' as _i899;
import '../../features/trans/domain/use_cases/get_trans_use_case.dart' as _i736;
import '../../features/trans/present/bloc/trans_bloc.dart' as _i857;
import '../../features/withdraw/data/data_source/withdraw_api.dart' as _i436;
import '../../features/withdraw/data/repo/withdraws_repo.dart' as _i129;
import '../../features/withdraw/domain/repo_imp/withdraws_repo_impl.dart'
    as _i405;
import '../../features/withdraw/domain/use_cases/add_withdraw_use_case.dart'
    as _i429;
import '../../features/withdraw/domain/use_cases/get_withdraw_rates_use_case.dart'
    as _i743;
import '../../features/withdraw/domain/use_cases/get_withdraws_use_case.dart'
    as _i920;
import '../../features/withdraw/present/bloc/withdraws_bloc.dart' as _i683;
import '../methods/authentication_helper.dart' as _i106;
import 'api_module.dart' as _i804;
import 'injection_module.dart' as _i212;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectionModule = _$InjectionModule();
  final apiModule = _$ApiModule();
  gh.singleton<_i804.LoggingInterceptor>(() => _i804.LoggingInterceptor());
  gh.lazySingleton<_i161.InternetConnection>(
      () => injectionModule.connectionChecker);
  gh.lazySingleton<_i59.FirebaseAuth>(() => injectionModule.firebaseAuth);
  gh.lazySingleton<_i106.AuthService>(() => _i106.AuthService());
  gh.lazySingleton<_i724.LanguageBloc>(() => _i724.LanguageBloc());
  gh.lazySingleton<_i907.QrCodeBloc>(() => _i907.QrCodeBloc());
  gh.lazySingleton<_i804.TokenStorage>(() => _i804.TokenStorage());
  gh.lazySingleton<_i547.SendToAccountUseCase>(() => _i547.SendToAccountUseCase(
      sendToAccountRepoImpl: gh<_i121.SendToAccountRepoImpl>()));
  gh.lazySingleton<_i336.GetNameOfUserByAccountUseCase>(() =>
      _i336.GetNameOfUserByAccountUseCase(
          sendToAccountRepoImpl: gh<_i121.SendToAccountRepoImpl>()));
  gh.lazySingleton<_i139.GetNotificationsUseCase>(() =>
      _i139.GetNotificationsUseCase(
          notificationsRepoImp: gh<_i291.NotificationsRepoImpl>()));
  gh.lazySingleton<_i768.SendToAccountBloc>(() => _i768.SendToAccountBloc(
        getNameOfUserByAccountUseCase:
            gh<_i336.GetNameOfUserByAccountUseCase>(),
        sendToAccountUseCase: gh<_i547.SendToAccountUseCase>(),
      ));
  gh.lazySingleton<_i781.NotificationsBloc>(() => _i781.NotificationsBloc(
      getNotificationsUseCase: gh<_i139.GetNotificationsUseCase>()));
  gh.lazySingleton<_i885.DepositUseCases>(() =>
      _i885.DepositUseCases(depositRepoImpl: gh<_i334.DepositsRepoImpl>()));
  gh.lazySingleton<_i290.TransferMoneyUseCase>(() =>
      _i290.TransferMoneyUseCase(buySellRepoImp: gh<_i301.BuySellRepoImpl>()));
  gh.lazySingleton<_i305.BiometricBloc>(
      () => _i305.BiometricBloc(gh<_i152.LocalAuthentication>()));
  gh.lazySingleton<_i933.GetPlansRatesUseCase>(
      () => _i933.GetPlansRatesUseCase(gh<_i988.PlansRepoImpl>()));
  gh.lazySingleton<_i635.ChangePlanUseCase>(
      () => _i635.ChangePlanUseCase(gh<_i988.PlansRepoImpl>()));
  gh.lazySingleton<_i333.PlanUseCases>(
      () => _i333.PlanUseCases(gh<_i988.PlansRepoImpl>()));
  gh.factory<_i534.VerifyEmailRepo>(() =>
      _i630.VerifyEmailRepoImpl(verifyEmailApi: gh<_i1039.VerifyEmailApi>()));
  gh.singleton<_i804.AuthInterceptor>(
      () => _i804.AuthInterceptor(gh<_i804.TokenStorage>()));
  gh.lazySingleton<_i685.LoginRemDataSrc>(
      () => _i685.LoginRemDataSrc(firebaseAuth: gh<_i59.FirebaseAuth>()));
  gh.lazySingleton<_i102.VerifyEmailOtpUseCase>(() =>
      _i102.VerifyEmailOtpUseCase(
          verifyEmailRepo: gh<_i630.VerifyEmailRepoImpl>()));
  gh.lazySingleton<_i518.SendEmailOtpUseCase>(() => _i518.SendEmailOtpUseCase(
      verifyEmailRepo: gh<_i630.VerifyEmailRepoImpl>()));
  gh.lazySingleton<_i336.PlansBloc>(
      () => _i336.PlansBloc(gh<_i333.PlanUseCases>()));
  gh.lazySingleton<_i865.DepositsBloc>(() =>
      _i865.DepositsBloc(getDepositstUseCase: gh<_i885.DepositUseCases>()));
  gh.singleton<_i361.Dio>(() => apiModule.dio(
        gh<_i804.AuthInterceptor>(),
        gh<_i804.LoggingInterceptor>(),
      ));
  gh.lazySingleton<_i942.MainApi>(
      () => injectionModule.mainApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i685.LoginApi>(
      () => injectionModule.loginApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i552.SignUpApi>(
      () => injectionModule.signUpApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i935.DashApi>(
      () => injectionModule.cdashpi(gh<_i361.Dio>()));
  gh.lazySingleton<_i268.ControllApi>(
      () => injectionModule.controllApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i975.TransApi>(
      () => injectionModule.transApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i1000.PlansApi>(
      () => injectionModule.plansApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i397.BuySellApi>(
      () => injectionModule.buySellApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i108.DepositsApi>(
      () => injectionModule.depositsApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i436.WithdrawsApi>(
      () => injectionModule.withdrawsApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i348.SendToAccountApi>(
      () => injectionModule.sendToAccountApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i352.NotificationsApi>(
      () => injectionModule.notificationsApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i363.AccountsApi>(
      () => injectionModule.accountsApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i64.TasksApi>(
      () => injectionModule.tasksApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i480.ProfileApi>(
      () => injectionModule.profileApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i414.SupportApi>(
      () => injectionModule.supportApi(gh<_i361.Dio>()));
  gh.factory<_i267.DashRepo>(() => _i421.DashRepoImpl(gh<_i935.DashApi>()));
  gh.factory<_i1007.NotificationsRepo>(
      () => _i291.NotificationsRepoImpl(gh<_i352.NotificationsApi>()));
  gh.factory<_i915.TasksRepo>(() => _i872.TasksRepoImpl(gh<_i64.TasksApi>()));
  gh.lazySingleton<_i408.GetDashUseCase>(
      () => _i408.GetDashUseCase(gh<_i267.DashRepo>()));
  gh.factory<_i871.SignUpRepo>(
      () => _i941.SignUpRepoImpl(signUpApi: gh<_i552.SignUpApi>()));
  gh.factory<_i611.SupportRepo>(
      () => _i938.SupportRepoImpl(gh<_i414.SupportApi>()));
  gh.factory<_i866.ControllRepo>(
      () => _i5.ControllRepoImpl(gh<_i268.ControllApi>()));
  gh.factory<_i768.PlansRepo>(() => _i988.PlansRepoImpl(gh<_i1000.PlansApi>()));
  gh.factory<_i296.DepositsRepo>(
      () => _i334.DepositsRepoImpl(depsoitsApi: gh<_i108.DepositsApi>()));
  gh.factory<_i42.AccountsRepo>(
      () => _i356.AccountsRepoImpl(gh<_i363.AccountsApi>()));
  gh.factory<_i587.MainRepo>(() => _i880.MainRepoImpl(gh<_i942.MainApi>()));
  gh.lazySingleton<_i542.DashBloc>(
      () => _i542.DashBloc(getDashUseCase: gh<_i408.GetDashUseCase>()));
  gh.lazySingleton<_i297.GetAccountsUseCase>(
      () => _i297.GetAccountsUseCase(acountsRepo: gh<_i42.AccountsRepo>()));
  gh.lazySingleton<_i199.EditAccountUseCase>(
      () => _i199.EditAccountUseCase(acountsRepo: gh<_i42.AccountsRepo>()));
  gh.factory<_i251.TransRepo>(() => _i899.TransRepoImpl(gh<_i975.TransApi>()));
  gh.factory<_i129.WithdrawsRepo>(
      () => _i405.WithdrawsRepoImpl(withdrawsApi: gh<_i436.WithdrawsApi>()));
  gh.lazySingleton<_i278.SupportUseCases>(
      () => _i278.SupportUseCases(supportRepo: gh<_i611.SupportRepo>()));
  gh.lazySingleton<_i743.GetWithdrawRatessUseCase>(() =>
      _i743.GetWithdrawRatessUseCase(withdrawsRepo: gh<_i129.WithdrawsRepo>()));
  gh.lazySingleton<_i920.GetWithdrawsUseCase>(() =>
      _i920.GetWithdrawsUseCase(withdrawsRepo: gh<_i129.WithdrawsRepo>()));
  gh.lazySingleton<_i429.AddWithdrawUseCase>(
      () => _i429.AddWithdrawUseCase(withdrawsRepo: gh<_i129.WithdrawsRepo>()));
  gh.factory<_i774.SendToAccountRepo>(() => _i121.SendToAccountRepoImpl(
      sendToAccountApi: gh<_i348.SendToAccountApi>()));
  gh.factory<_i174.BuySellRepo>(
      () => _i301.BuySellRepoImpl(gh<_i397.BuySellApi>()));
  gh.factory<_i433.ProfileRepo>(
      () => _i740.ProfileRepoImpl(gh<_i480.ProfileApi>()));
  gh.factory<_i632.LoginRepo>(() => _i328.LoginRepoImpl(
        gh<_i685.LoginRemDataSrc>(),
        gh<_i685.LoginApi>(),
      ));
  gh.lazySingleton<_i199.EditProfileUseCase>(
      () => _i199.EditProfileUseCase(profileRepo: gh<_i433.ProfileRepo>()));
  gh.lazySingleton<_i407.ProofTaskUseCase>(
      () => _i407.ProofTaskUseCase(tasksRepo: gh<_i915.TasksRepo>()));
  gh.lazySingleton<_i739.GetTaskDetailsUseCase>(
      () => _i739.GetTaskDetailsUseCase(tasksRepo: gh<_i915.TasksRepo>()));
  gh.lazySingleton<_i985.GetTasksUseCase>(
      () => _i985.GetTasksUseCase(tasksRepo: gh<_i915.TasksRepo>()));
  gh.lazySingleton<_i45.SignUpUseCase>(
      () => _i45.SignUpUseCase(gh<_i871.SignUpRepo>()));
  gh.lazySingleton<_i12.GetReceiveAccountNumberUseCase>(() =>
      _i12.GetReceiveAccountNumberUseCase(
          buySellRepo: gh<_i174.BuySellRepo>()));
  gh.lazySingleton<_i1064.ControllUseCases>(
      () => _i1064.ControllUseCases(controllRepo: gh<_i866.ControllRepo>()));
  gh.lazySingleton<_i422.MainUseCases>(
      () => _i422.MainUseCases(gh<_i587.MainRepo>()));
  gh.lazySingleton<_i226.SignUpBloc>(
      () => _i226.SignUpBloc(signUpUseCase: gh<_i45.SignUpUseCase>()));
  gh.lazySingleton<_i864.ControllBloc>(() =>
      _i864.ControllBloc(controllUseCases: gh<_i1064.ControllUseCases>()));
  gh.lazySingleton<_i683.WithdrawsBloc>(() => _i683.WithdrawsBloc(
        getWithdrawsUseCase: gh<_i920.GetWithdrawsUseCase>(),
        getWithdrawRatesUseCase: gh<_i743.GetWithdrawRatessUseCase>(),
        addWithdrawUseCase: gh<_i429.AddWithdrawUseCase>(),
      ));
  gh.lazySingleton<_i736.GetTransUseCase>(
      () => _i736.GetTransUseCase(gh<_i251.TransRepo>()));
  gh.lazySingleton<_i685.LoginUseCases>(
      () => _i685.LoginUseCases(gh<_i632.LoginRepo>()));
  gh.lazySingleton<_i133.AccountsBloc>(() => _i133.AccountsBloc(
        getAccountsUseCase: gh<_i297.GetAccountsUseCase>(),
        editAccountUseCase: gh<_i199.EditAccountUseCase>(),
      ));
  gh.lazySingleton<_i307.TasksBloc>(() => _i307.TasksBloc(
        getTasksUseCase: gh<_i985.GetTasksUseCase>(),
        getTaskDetailsUseCase: gh<_i739.GetTaskDetailsUseCase>(),
        proofTaskUseCase: gh<_i407.ProofTaskUseCase>(),
      ));
  gh.lazySingleton<_i562.SupportBloc>(
      () => _i562.SupportBloc(supportUseCases: gh<_i278.SupportUseCases>()));
  gh.lazySingleton<_i924.MainBloc>(() => _i924.MainBloc(
        mainUseCases: gh<_i422.MainUseCases>(),
        firebaseAuth: gh<_i59.FirebaseAuth>(),
        authService: gh<_i106.AuthService>(),
      ));
  gh.lazySingleton<_i475.ProfileBloc>(() =>
      _i475.ProfileBloc(editProfileUseCase: gh<_i199.EditProfileUseCase>()));
  gh.lazySingleton<_i702.LoginBloc>(() => _i702.LoginBloc(
        loginUseCases: gh<_i685.LoginUseCases>(),
        auth: gh<_i59.FirebaseAuth>(),
        authService: gh<_i106.AuthService>(),
      ));
  gh.lazySingleton<_i959.BuySellBloc>(() => _i959.BuySellBloc(
        getBuySellRatesUse: gh<_i486.GetBuySellRatesUse>(),
        getReceiveAccountNumberUseCase:
            gh<_i12.GetReceiveAccountNumberUseCase>(),
        transferMoneyUseCase: gh<_i290.TransferMoneyUseCase>(),
      ));
  gh.lazySingleton<_i857.TransBloc>(
      () => _i857.TransBloc(gh<_i736.GetTransUseCase>()));
  return getIt;
}

class _$InjectionModule extends _i212.InjectionModule {}

class _$ApiModule extends _i804.ApiModule {}
