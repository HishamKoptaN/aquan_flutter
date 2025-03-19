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
import '../../features/auth/login/domain/use_cases/login_use_cases.dart'
    as _i685;
import '../../features/controll/data/data_sources/controll_api.dart' as _i268;
import '../../features/controll/data/repo/controll_repo.dart' as _i866;
import '../../features/controll/domain/repo_impl/controll_repo_impl.dart'
    as _i5;
import '../../features/controll/domain/use_cases/controll_use_cases.dart'
    as _i1064;
import '../../features/controll/present/bloc/controll_bloc.dart' as _i864;
import '../../features/support/data/data_sources/support_api.dart' as _i414;
import '../../features/support/data/repo/support_repo.dart' as _i611;
import '../../features/support/domain/repo_impl/support_repo_impl.dart'
    as _i938;
import '../../features/support/domain/use_cases/support_use_cases.dart'
    as _i278;
import '../../features/support/present/bloc/support_bloc.dart' as _i562;
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
  gh.factory<_i611.SupportRepo>(
      () => _i938.SupportRepoImpl(gh<_i414.SupportApi>()));
  gh.factory<_i866.ControllRepo>(
      () => _i5.ControllRepoImpl(gh<_i268.ControllApi>()));
  gh.factory<_i685.LoginRemDataSrc>(
      () => _i685.LoginRemDataSrc(firebaseAuth: gh<_i59.FirebaseAuth>()));
  gh.factory<_i685.LoginUseCases>(
      () => _i685.LoginUseCases(gh<_i328.LoginRepoImpl>()));
  gh.lazySingleton<_i278.SupportUseCases>(
      () => _i278.SupportUseCases(supportRepo: gh<_i611.SupportRepo>()));
  gh.factory<_i632.LoginRepo>(() => _i328.LoginRepoImpl(
        gh<_i685.LoginRemDataSrc>(),
        gh<_i685.LoginApi>(),
      ));
  gh.lazySingleton<_i1064.ControllUseCases>(
      () => _i1064.ControllUseCases(controllRepo: gh<_i866.ControllRepo>()));
  gh.lazySingleton<_i864.ControllBloc>(() =>
      _i864.ControllBloc(controllUseCases: gh<_i1064.ControllUseCases>()));
  gh.lazySingleton<_i562.SupportBloc>(
      () => _i562.SupportBloc(supportUseCases: gh<_i278.SupportUseCases>()));
  return getIt;
}

class _$InjectionModule extends _i212.InjectionModule {}
