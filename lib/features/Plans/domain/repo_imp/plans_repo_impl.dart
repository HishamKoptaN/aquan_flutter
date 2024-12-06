import 'package:aquan/features/plans/data/data_source/plans_api.dart';
import 'package:aquan/features/plans/data/model/plan_model.dart';
import 'package:aquan/features/plans/data/model/plan_rate.dart';
import 'package:aquan/features/plans/data/repo/plans_repo.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';

class PlansRepoImpl implements PlansRepo {
  final PlansApi plansApi;
  PlansRepoImpl(
    this.plansApi,
  );

  @override
  Future<ApiResult<List<Plan>>> get() async {
    try {
      final response = await plansApi.get();
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<PlanRate>> getPlansRates() async {
    try {
      final response = await plansApi.getPlansRates();
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<void>> change({
    required FormData formData,
  }) async {
    try {
      await plansApi.change(
        formData: formData,
      );
      return const ApiResult.success(
        data: null,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(error: error),
      );
    }
  }
}
