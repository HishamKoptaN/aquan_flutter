import '../../../../../core/networking/api_result.dart';
import '../../data/models/sign_up_req_body.dart';
import '../../data/models/sign_up_res_model.dart';

abstract class SignUpRepo {
  Future<ApiResult<SignUpResModel>> signUp({
    required SignUpReqBody signUpReqBody,
  });
}
