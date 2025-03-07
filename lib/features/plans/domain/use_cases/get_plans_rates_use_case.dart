import 'package:aquan/features/plans/data/model/plan_rate.dart';
import 'package:aquan/features/plans/domain/repo_imp/plans_repo_impl.dart';
import '../../../../core/networking/api_result.dart';

class GetPlansRatesUseCase {
  final PlansRepoImpl plansRepoImp;
  GetPlansRatesUseCase(
    this.plansRepoImp,
  );
  Future<ApiResult<PlanRate>> getPlansRates() async {
    return await plansRepoImp.getPlansRates();
  }
}
