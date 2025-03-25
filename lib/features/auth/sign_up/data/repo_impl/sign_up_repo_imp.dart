import 'package:injectable/injectable.dart';

import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../domain/repo/sign_up_repo.dart';
import '../data_sources/sign_up_api.dart';
import '../models/sign_up_req_body.dart';
import '../models/sign_up_res_model.dart';
@Injectable(
  as: SignUpRepo,
)
class SignUpRepoImpl implements SignUpRepo {
  final SignUpApi signUpApi;

  SignUpRepoImpl({
    required this.signUpApi,
  });
  @override
  Future<ApiResult<SignUpResModel>> signUp({
    required SignUpReqBody signUpReqBody,
  }) async {
    try {
      final response = await signUpApi.signUp(
        signUpReqBody: signUpReqBody,
      );
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
