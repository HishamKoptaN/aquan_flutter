import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../domain/repo/login_repo.dart';
import '../data_sources/login_api.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginApi loginApi;
  LoginRepoImpl(
    this.loginApi,
  );

  @override
  Future<ApiResult<LoginResponse>> login({
    required LoginRequestBody loginRequestBody,
  }) async {
    try {
      final response = await loginApi.login(
        loginRequestBody: loginRequestBody,
      );
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
