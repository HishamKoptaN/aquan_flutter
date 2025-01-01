import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/data_source/trans_api.dart';
import '../../data/model/trans_model.dart';
import '../../data/repo/transactions_repo.dart';

class TransRepoImpl implements TransRepo {
  final TransApi transApi;
  TransRepoImpl(
    this.transApi,
  );

  @override
  Future<ApiResult<List<Trans>>> get() async {
    try {
      final response = await transApi.get();
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
