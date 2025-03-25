import 'package:aquan/core/networking/api_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../plans/data/model/plan.dart';
import '../../data/model/plan_rate.dart';
import '../../data/repo/plans_repo.dart';

@LazySingleton()
class PlanUseCases {
  final PlansRepo plansRepo;
  PlanUseCases(
    this.plansRepo,
  );
  Future<ApiResult<List<Plan>>> get() async {
    return await plansRepo.get();
  }

  Future<ApiResult<PlanRate>> getPlansRates() async {
    return await plansRepo.getPlansRates();
  }

  Future<ApiResult<void>> change({
    required FormData formData,
  }) async {
    return await plansRepo.change(
      formData: formData,
    );
  }
}
