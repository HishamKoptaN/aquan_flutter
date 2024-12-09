import '../../../features/Auth/login/domain/use_cases/login_use_case.dart';
import '../../../features/Auth/sign_up/domain/use_cases/sign_up_use_case.dart';
import '../../../features/accounts/domain/usecases/edit_accounts_usecase.dart';
import '../../../features/accounts/domain/usecases/get_accounts_usecase.dart';
import '../../../features/deposit/domain/use_cases/deposit_use_case.dart';
import '../../../features/deposit/domain/use_cases/get_deposits_use_case.dart';
import '../../../features/deposit/domain/use_cases/get_employee_account_use_case.dart';
import '../../../features/notifications/domain/use_cases/get_notifications_use_case.dart';
import '../../../features/plans/domain/use_cases/change_plan_use_case.dart';
import '../../../features/plans/domain/use_cases/get_plans_rates_use_case.dart';
import '../../../features/plans/domain/use_cases/get_plans_use_case.dart';
import '../../../features/buy_sell/domain/use_cases/get_buy_sell_rates_use_case.dart';
import '../../../features/buy_sell/domain/use_cases/get_receive_account_number_use_case.dart';
import '../../../features/buy_sell/domain/use_cases/transfer_money_use_case.dart';
import '../../../features/dash/domain/use_cases/get_dash_use_case.dart';
import '../../../features/main/domain/usecases/check_use_case.dart';
import '../../../features/send_to_account/domain/use_cases/get_username_by_account_use_case.dart';
import '../../../features/send_to_account/domain/use_cases/send_to_account_use_case.dart';
import '../../../features/support/domain/use_cases/get_msgs_use_case.dart';
import '../../../features/support/domain/use_cases/send_message_use_case.dart';
import '../../../features/trans/domain/use_cases/get_transactions_use_case.dart';
import '../../../features/withdraw/domain/use_cases/add_withdraw_use_case.dart';
import '../../../features/withdraw/domain/use_cases/get_withdraw_rates_use_case.dart';
import '../../../features/withdraw/domain/use_cases/get_withdraws_use_case.dart';
import '../dependency_injection.dart';

class UseCaseModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton(
        () => CheckUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => LoginUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => SignUpUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => GetDashUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => GetTransUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => GetDepositstUseCase(
          depositRepoImpl: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => GetEmployeeAccountUseCase(
          depositRepoImpl: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => DepositUseCase(
          depositRepoImpl: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => GetWithdrawsUseCase(
          withdrawsRepoImpl: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => GetWithdrawRatessUseCase(
          withdrawsRepoImpl: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => AddWithdrawUseCase(
          withdrawsRepoImpl: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => GetPlansUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => GetPlansRatesUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => ChangePlanUseCase(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => GetBuySellRatesUse(
          buySellRepoImp: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => GetReceiveAccountNumberUseCase(
          buySellRepoImp: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => TransferMoneyUseCase(
          buySellRepoImp: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => GetNameOfUserByAccountUseCase(
          sendToAccountRepoImpl: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => SendToAccountUseCase(
          sendToAccountRepoImpl: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => GetNotificationsUseCase(
          notificationsRepoImp: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => GetAccountsUseCase(
          acountsRepo: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => EditAccountUseCase(
          acountsRepo: getIt(),
        ),
      );
  }
}
