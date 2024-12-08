import 'package:aquan/core/networking/api_result.dart';
import '../../../../../core/models/auth.dart';
import '../../data/models/login_request_body.dart';
import '../../data/repo_imp/login_repo_impl.dart';

class LoginUseCase {
  final LoginRepoImpl loginRepo;
  LoginUseCase(
    this.loginRepo,
  );
  Future<ApiResult<Auth>> login({
    required LoginRequestBody loginRequestBody,
  }) async {
    return await loginRepo.login(
      loginRequestBody: loginRequestBody,
    );
  }
}
