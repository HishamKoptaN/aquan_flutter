import '../../../../../core/models/auth.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/models/reset_pass_req_body.dart';
import '../../data/repo/reset_password_repo_impl.dart';

class ResetPassUseCase {
  final ResetPassRepoImpl loginRepo;
  ResetPassUseCase({
    required this.loginRepo,
  });
  Future<ApiResult<Auth>> resetPass({
    required ResetPassReqBody resetPassReqBody,
  }) async {
    return await loginRepo.resetPass(
      resetPassReqBody: resetPassReqBody,
    );
  }
}
