import 'package:aquan/features/plans/data/model/plan_rate.dart';
import 'package:aquan/features/plans/domain/repo_imp/plans_repo_impl.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/networking/api_result.dart';
@LazySingleton()
class GetPlansRatesUseCase {
  final PlansRepoImpl plansRepoImp;
  GetPlansRatesUseCase(
    this.plansRepoImp,
  );

}
