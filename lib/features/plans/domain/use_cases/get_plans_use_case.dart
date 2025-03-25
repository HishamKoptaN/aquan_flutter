import 'package:aquan/core/networking/api_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../plans/data/model/plan.dart';
import '../../data/model/plan_rate.dart';
import '../repo_imp/plans_repo_impl.dart';

@LazySingleton()
class PlanUseCases {
  final PlansRepoImpl plansRepoImp;
  PlanUseCases(
    this.plansRepoImp,
  );
  Future<ApiResult<List<Plan>>> get() async {
    return await plansRepoImp.get();
  }

  Future<ApiResult<PlanRate>> getPlansRates() async {
    return await plansRepoImp.getPlansRates();
  }

  Future<ApiResult<void>> change({
    required FormData formData,
  }) async {
    return await plansRepoImp.change(
      formData: formData,
    );
  }
}
