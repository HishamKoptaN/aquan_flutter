import 'package:aquan/core/networking/api_result.dart';
import 'package:aquan/features/plans/domain/repo_imp/plans_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@LazySingleton()
class ChangePlanUseCase {
  final PlansRepoImpl plansRepoImp;
  ChangePlanUseCase(
    this.plansRepoImp,
  );
 
}
