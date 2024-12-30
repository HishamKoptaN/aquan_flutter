import 'package:aquan/core/networking/api_result.dart';
import '../../../../../core/models/auth.dart';
import '../../data/models/login_req_body.dart';
import '../../data/repo_imp/login_repo_impl.dart';

class LoginUseCase {
  final LoginRepoImpl loginRepo;
  LoginUseCase(
    this.loginRepo,
  );
  Future<ApiResult<Auth>> login({
    required LoginReqBody loginReqBody,
  }) async {
    return await loginRepo.login(
      loginReqBody: loginReqBody,
    );
  }
}
