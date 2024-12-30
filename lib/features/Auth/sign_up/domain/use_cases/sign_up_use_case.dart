import '../../../../../core/networking/api_result.dart';
import '../../data/models/sign_up_req_body.dart';
import '../../data/models/sign_up_res_model.dart';
import '../repo/sign_up_repo.dart';

class SignUpUseCase {
  final SignUpRepo signUpRepo;
  SignUpUseCase(
    this.signUpRepo,
  );
  Future<ApiResult<SignUpResModel>> signUp({
    required SignUpReqBody signUpReqBody,
  }) async {
    return await signUpRepo.signUp(
      signUpReqBody: signUpReqBody,
    );
  }
}
