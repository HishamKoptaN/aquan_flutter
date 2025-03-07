import 'package:aquan/core/networking/api_result.dart';
import '../../data/model/plan.dart';
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
