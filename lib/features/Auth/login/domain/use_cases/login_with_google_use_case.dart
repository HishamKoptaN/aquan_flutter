import 'package:aquan/core/networking/api_result.dart';
import '../../../../../core/models/auth.dart';
import '../../data/repo_imp/login_repo_impl.dart';

class LoginWithGoogleUseCase {
  final LoginRepoImpl loginRepo;

  LoginWithGoogleUseCase(this.loginRepo);

  Future<ApiResult<Auth>> google() async {
    return await loginRepo.google();
  }
}
