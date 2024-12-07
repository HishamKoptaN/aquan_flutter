import 'package:aquan/features/main/data/datasources/main_api.dart';
import 'package:aquan/features/main/domain/repo/main_repo.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/models/user.dart';
import '../../../../core/networking/api_result.dart';

class MainRepoImpl implements MainRepo {
  final MainApi mainApi;
  MainRepoImpl(
    this.mainApi,
  );

  @override
  Future<ApiResult<User>> check() async {
    try {
      final response = await mainApi.check();
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
