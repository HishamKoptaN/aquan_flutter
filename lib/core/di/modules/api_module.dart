import '../../../features/Auth/login/data/data_sources/login_api.dart';
import '../../../features/Auth/sign_up/data/data_sources/sign_up_api.dart';
import '../../../features/Plans/data/data_source/plans_api.dart';
import '../../../features/buy_sell/data/data_source/buy_sell_api.dart';
import '../../../features/dash/data/data_sources/dash_api.dart';
import '../../../features/main/data/datasources/main_api.dart';
import '../../../features/trans/data/data_source/trans_api.dart';
import '../../networking/dio_factory.dart';
import '../dependency_injection.dart';

class ApiModule extends DIModule {
  @override
  Future<void> provides() async {
    final dio = await DioFactory.setupDio();
    getIt
      ..registerSingleton(dio)
      ..registerLazySingleton(
        () => MainApi(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => LoginApi(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => SignUpApi(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => DashApi(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => TransApi(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => PlansApi(
          getIt(),
        ),
      )
      ..registerLazySingleton(
        () => BuySellApi(
          getIt(),
        ),
      );
  }
}
