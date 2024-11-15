import 'package:aquan/core/networking/api_result.dart';
import 'package:aquan/features/Auth/login/data/models/login_response.dart';
import '../../data/models/login_request_body.dart';
import '../../data/repo_imp/login_repo_impl.dart';

class LoginUseCase {
  final LoginRepoImpl loginRepo;
  LoginUseCase(
    this.loginRepo,
  );
  Future<ApiResult<LoginResponse>> login({
    required LoginRequestBody loginRequestBody,
  }) async {
    return await loginRepo.login(
      loginRequestBody: loginRequestBody,
    );
  }
}
