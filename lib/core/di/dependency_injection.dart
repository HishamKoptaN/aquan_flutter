import 'package:get_it/get_it.dart';
import 'modules/api_module.dart';
import 'modules/bloc_module.dart';
import 'modules/repo_module.dart';
import 'modules/uses_case_module.dart';

GetIt getIt = GetIt.instance;

abstract class DIModule {
  void provides();
}

class Injection {
  static Future<void> inject() async {
    await BlocModule().provides();
    await UseCaseModule().provides();
    await RepositoryModule().provides();
    await ApiModule().provides();
  }
}
