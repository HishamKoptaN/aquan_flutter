import 'package:aquan/features/main/data/datasources/main_api.dart';
import 'package:aquan/features/main/domain/repo/main_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/models/auth.dart';
import '../../../../core/networking/api_result.dart';
@Injectable(
  as: MainRepo,
)
class MainRepoImpl implements MainRepo {
  final MainApi mainApi;

  MainRepoImpl(
    this.mainApi,
  );

  @override
  Future<ApiResult<Auth>> check() async {
    try {
      final response = await mainApi.check();
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
