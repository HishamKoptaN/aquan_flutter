import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/models/auth.dart';
import '../../../../../core/networking/api_result.dart';
import '../../domain/repo/login_repo.dart';
import '../data_sources/login_api.dart';
import '../models/login_req_body.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginApi loginApi;
  LoginRepoImpl(
    this.loginApi,
  );

  @override
  Future<ApiResult<Auth>> login({
    required LoginReqBody loginReqBody,
  }) async {
    try {
      final response = await loginApi.login(
        loginReqBody: loginReqBody,
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

  @override
  Future<ApiResult<Auth>> google() async {
    try {
      final response = await loginApi.google();
      return ApiResult.success(data: response);
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }
}
