import 'package:dio/dio.dart';
import '../../../../../core/networking/api_result.dart';
import '../model/plan.dart';
import '../model/plan_rate.dart';

abstract class PlansRepo {
  Future<ApiResult<List<Plan>>> get();
  Future<ApiResult<PlanRate>> getPlansRates();
  Future<ApiResult<void>> change({
    required FormData formData,
  });
}
