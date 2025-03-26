import 'package:aquan/core/networking/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/models/auth.dart';
import '../../data/errors/firebase_login_failures.dart';
import '../../data/errors/google_sign_in_failures.dart';
import '../../data/models/auth_id_token_req_body_model.dart';
import 'package:dartz/dartz.dart';
import '../repo/login_repo.dart';

@LazySingleton()
class LoginUseCases {
  final LoginRepo loginRepo;
  LoginUseCases(
    this.loginRepo,
  );
  Future<Either<FirebaseSignInFailure, String>> firebaseLogin({
    required String email,
    required String password,
  }) async {
    return await loginRepo.firebaseLogin(
      email: email,
      password: password,
    );
  }

  Future<Either<GoogleSignInFailures, String>> signInWithGoogle() async {
    return await loginRepo.signInWithGoogle();
  }

  Future<ApiResult<Auth?>> authToken({
    required AuthIdTokenReqBodyModel authIdTokenReqBodyModel,
  }) async {
    return await loginRepo.authToken(
      authIdTokenReqBodyModel: authIdTokenReqBodyModel,
    );
  }
}
