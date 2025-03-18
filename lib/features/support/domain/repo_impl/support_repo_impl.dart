import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/models/section_res_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/data_sources/support_api.dart';
import '../../data/repo/support_repo.dart';

class SupportRepoImpl implements SupportRepo {
  final SupportApi supportApi;
  SupportRepoImpl(
    this.supportApi,
  );
  @override
  Future<ApiResult<SectionResModel>?> get() async {
    try {
      final response = await supportApi.get();
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
}
