import '../../../features/Auth/login/presentation/bloc/login_bloc.dart';
import '../../../features/Auth/sign_up/bloc/sign_up_bloc.dart';
import '../../../features/buy_sell/presentation/bloc/buy_sell_bloc.dart';
import '../../../features/dash/presentation/bloc/dash_bloc.dart';
import '../../../features/deposit/pesent/bloc/deposit_bloc.dart';
import '../../../features/main/presentation/bloc/main_bloc.dart';
import '../../../features/trans/presentation/bloc/trans_bloc.dart';
import '../dependency_injection.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton<MainBloc>(
        () => MainBloc(
          getIt(),
        ),
      )
      ..registerLazySingleton<LoginBloc>(
        () => LoginBloc(
          getIt(),
        ),
      )
      ..registerLazySingleton<SignUpBloc>(
        () => SignUpBloc(
          getIt(),
        ),
      )
      ..registerLazySingleton<DashBloc>(
        () => DashBloc(
          getDashUseCase: getIt(),
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
      ..registerLazySingleton<DepositBloc>(
        () => DepositBloc(
          getDepositstUseCase: getIt(),
          getEmployeeAccountUseCase: getIt(),
          depositUseCase: getIt(),
        ),
      );
  }
}
