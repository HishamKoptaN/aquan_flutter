import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../domain/repo/sign_up_repo.dart';
import '../data_sources/sign_up_api.dart';
import '../models/sign_up_request_body.dart';
import '../models/sign_up_response_model.dart';

class SignUpRepoImpl implements SignUpRepo {
  final SignUpApi _signUpApi;

  SignUpRepoImpl(this._signUpApi);
  @override
  Future<ApiResult<SignUpResponseModel>> signUp({
    required SignUpRequestBody signUpRequestBody,
  }) async {
    try {
      final response = await _signUpApi.signUp(
        signUpRequestBody: signUpRequestBody,
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
