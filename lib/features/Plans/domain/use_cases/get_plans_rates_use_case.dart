import '../../../../core/networking/api_result.dart';
import '../../data/model/plan_rate.dart';
import '../repo_imp/plans_repo_impl.dart';

class GetPlansRatesUseCase {
  final PlansRepoImpl plansRepoImp;
  GetPlansRatesUseCase(
    this.plansRepoImp,
  );
  Future<ApiResult<PlanRate>> getPlansRates() async {
    return await plansRepoImp.getPlansRates();
  }
}
