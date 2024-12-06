import 'package:aquan/core/networking/api_result.dart';
import 'package:aquan/features/plans/data/model/plan_model.dart';
import '../repo_imp/plans_repo_impl.dart';

class GetPlansUseCase {
  final PlansRepoImpl plansRepoImp;
  GetPlansUseCase(
    this.plansRepoImp,
  );
  Future<ApiResult<List<Plan>>> get() async {
    return await plansRepoImp.get();
  }
}
