// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/login/data/data_sources/login_api.dart' as _i685;
import '../../features/auth/login/data/repo_imp/login_repo_impl.dart' as _i328;
import '../../features/auth/login/domain/repo/login_repo.dart' as _i632;
import '../../features/auth/login/domain/use_cases/login_use_case.dart' as _i50;
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
  gh.lazySingleton<_i59.FirebaseAuth>(() => injectionModule.firebaseAuth);
  gh.factory<_i685.LoginRemDataSrc>(
      () => _i685.LoginRemDataSrc(firebaseAuth: gh<_i59.FirebaseAuth>()));
  gh.factory<_i50.LoginUseCases>(
      () => _i50.LoginUseCases(gh<_i328.LoginRepoImpl>()));
  gh.factory<_i632.LoginRepo>(() => _i328.LoginRepoImpl(
        gh<_i685.LoginRemDataSrc>(),
        gh<_i685.LoginApi>(),
      ));
  return getIt;
}

class _$InjectionModule extends _i212.InjectionModule {}
