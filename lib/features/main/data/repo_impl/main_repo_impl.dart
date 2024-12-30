import 'package:aquan/features/main/data/datasources/main_api.dart';
import 'package:aquan/features/main/domain/repo/main_repo.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/models/auth.dart';
import '../../../../core/models/user.dart';
import '../../../../core/networking/api_result.dart';
import '../models/edit_pass_req_body_model.dart';

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

  @override
  Future<ApiResult<void>> editPass({
    required EditPassReqBodyModel editPassReqBodyModel,
  }) async {
    try {
      await mainApi.editPass(
        editPassReqBodyModel: editPassReqBodyModel,
      );
      return const ApiResult.success(
        data: null,
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
