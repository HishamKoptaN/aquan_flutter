import '../../../../../core/networking/api_result.dart';
import '../../data/models/sign_up_request_body.dart';
import '../../data/models/sign_up_response_model.dart';

abstract class SignUpRepo {
  Future<ApiResult<SignUpResponseModel>> signUp({
    required SignUpRequestBody signUpRequestBody,
  });
}
