import '../../../features/Auth/login/domain/use_cases/login_use_case.dart';
import '../../../features/Auth/sign_up/domain/use_cases/sign_up_use_case.dart';
import '../../../features/Plans/domain/use_cases/change_plan_use_case.dart';
import '../../../features/Plans/domain/use_cases/get_plans_rates_use_case.dart';
import '../../../features/Plans/domain/use_cases/get_plans_use_case.dart';
import '../../../features/buy_sell/domain/use_cases/get_buy_sell_rates_use_case.dart';
import '../../../features/buy_sell/domain/use_cases/get_receive_account_number_use_case.dart';
import '../../../features/buy_sell/domain/use_cases/transfer_money_use_case.dart';
import '../../../features/dash/domain/use_cases/get_dash_use_case.dart';
import '../../../features/main/domain/usecases/check_use_case.dart';
import '../../../features/trans/domain/use_cases/get_transactions_use_case.dart';
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
      );
  }
}
