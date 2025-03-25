import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../features/accounts/data/datasources/accounts_api.dart';
import '../../features/auth/login/data/data_sources/login_api.dart';
import '../../features/auth/sign_up/data/data_sources/sign_up_api.dart';
import '../../features/buy_sell/data/data_source/buy_sell_api.dart';
import '../../features/controll/data/data_sources/controll_api.dart';
import '../../features/dash/data/data_sources/dash_api.dart';
import '../../features/deposit/data/data_sources/deposits_api.dart';
import '../../features/main/data/datasources/main_api.dart';
import '../../features/notifications/data/datasources/notifications_api.dart';
import '../../features/plans/data/data_source/plans_api.dart';
import '../../features/profile/data/data_sources/profile_api.dart';
import '../../features/send_to_account/data/datasources/send_to_account_api.dart';
import '../../features/support/data/data_sources/support_api.dart';
import '../../features/tasks/data/data_sources/tasks_api.dart';
import '../../features/trans/data/data_source/trans_api.dart';
import '../../features/withdraw/data/data_source/withdraw_api.dart';

@module
abstract class InjectionModule {
  InjectionModule() {
    log("InjectionModule has been initialized! 🚀");
  }
  @lazySingleton
  InternetConnection get connectionChecker => InternetConnection();
  @lazySingleton
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
//! MainApi
  @lazySingleton
  MainApi mainApi(
    Dio dio,
  ) =>
      MainApi(
        dio,
      );
  //! LoginApi
  @lazySingleton
  LoginApi loginApi(Dio dio) => LoginApi(
        dio,
      );
  //! SignUpApi
  @lazySingleton
  SignUpApi signUpApi(Dio dio) => SignUpApi(
        dio,
      );
  //! DashApi
  @lazySingleton
  DashApi cdashpi(Dio dio) => DashApi(
        dio,
      );
  //! ControllApi
  @lazySingleton
  ControllApi controllApi(Dio dio) => ControllApi(
        dio,
      );
  //! TransApi
  @lazySingleton
  TransApi transApi(Dio dio) => TransApi(
        dio,
      );
  //! PlansApi
  @lazySingleton
  PlansApi plansApi(Dio dio) => PlansApi(
        dio,
      );
  //! BuySellApi
  @lazySingleton
  BuySellApi buySellApi(Dio dio) => BuySellApi(
        dio,
      );
  //! DepositsApi
  @lazySingleton
  DepositsApi depositsApi(Dio dio) => DepositsApi(
        dio,
      );
  //! WithdrawsApi
  @lazySingleton
  WithdrawsApi withdrawsApi(Dio dio) => WithdrawsApi(
        dio,
      );
  //! SendToAccountApi
  @lazySingleton
  SendToAccountApi sendToAccountApi(Dio dio) => SendToAccountApi(
        dio,
      );
  //! NotificationsApi
  @lazySingleton
  NotificationsApi notificationsApi(Dio dio) => NotificationsApi(
        dio,
      );
  //! AccountsApi
  @lazySingleton
  AccountsApi accountsApi(Dio dio) => AccountsApi(
        dio,
      ); //! TasksApi
  @lazySingleton
  TasksApi tasksApi(Dio dio) => TasksApi(
        dio,
      ); //! ProfileApi
  @lazySingleton
  ProfileApi profileApi(Dio dio) => ProfileApi(
        dio,
      ); //! SupportApi
  @lazySingleton
  SupportApi supportApi(Dio dio) => SupportApi(
        dio,
      );
}
