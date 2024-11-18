import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/data_sources/dash_api.dart';
import '../../data/model/dash_res_model.dart';
import '../../data/repo/dash_repo.dart';

class DashRepoImpl implements DashRepo {
  final DashApi dashApi;
  DashRepoImpl(
    this.dashApi,
  );

  @override
  Future<ApiResult<DashResModel>> get() async {
    try {
      final response = await dashApi.get();
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(error: error),
      );
    }
  }
}
