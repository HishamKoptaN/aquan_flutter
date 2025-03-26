import '../../../../../core/networking/api_result.dart';
import '../../data/models/sign_up_req_body.dart';
import '../../data/models/sign_up_res_model.dart';

abstract class SignUpRepo {
  Future<String> firebaseSignUp({
    required String email,
    required String password,
  });
  Future<ApiResult<SignUpResModel>> signUp({
    required SignUpReqBody signUpReqBody,
  });
}
