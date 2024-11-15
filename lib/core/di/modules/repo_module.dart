import '../../../features/Auth/login/data/repo_imp/login_repo_impl.dart';
import '../../../features/Auth/sign_up/data/repo_impl/sign_up_repo_imp.dart';
import '../../../features/Auth/sign_up/domain/repo/sign_up_repo.dart';
import '../../../features/Plans/data/repo/plans_repo.dart';
import '../../../features/Plans/domain/repo_imp/plans_repo_impl.dart';
import '../../../features/buy_sell/data/repo/buy_sell_repo.dart';
import '../../../features/buy_sell/domain/repo_impl/buy_sell_repo_impl.dart';
import '../../../features/dash/data/repo/dash_repo.dart';
import '../../../features/dash/domain/repo_imp/login_repo_impl.dart';
import '../../../features/main/data/repo_impl/main_repo_impl.dart';
import '../../../features/main/domain/repo/main_repo.dart';
import '../../../features/trans/data/repo/transactions_repo.dart';
import '../../../features/trans/domain/repo_imp/transactions_repo_impl.dart';
import '../dependency_injection.dart';

class RepositoryModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt
      ..registerLazySingleton<MainRepo>(
        () => MainRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<LoginRepoImpl>(
        () => LoginRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<SignUpRepo>(
        () => SignUpRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<DashRepo>(
        () => DashRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<DashRepoImpl>(
        () => DashRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<TransRepoImpl>(
        () => TransRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<TransRepo>(
        () => TransRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<PlansRepoImpl>(
        () => PlansRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<PlansRepo>(
        () => PlansRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<BuySellRepo>(
        () => BuySellRepoImpl(
          getIt(),
        ),
      )
      ..registerLazySingleton<BuySellRepoImpl>(
        () => BuySellRepoImpl(
          getIt(),
        ),
      );
  }
}