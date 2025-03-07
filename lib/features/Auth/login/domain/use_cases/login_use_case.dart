import 'package:aquan/core/networking/api_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/errors/firebase_failures.dart';
import '../../../../../core/models/auth.dart';
import '../../data/models/auth_id_token_req_body_model.dart';
import '../../data/models/firabase_login_req_body_model.dart';
import '../../data/repo_imp/login_repo_impl.dart';
import 'package:dartz/dartz.dart';

class LoginUseCases {
  final LoginRepoImpl loginRepo;
  LoginUseCases(
    this.loginRepo,
  );
  Future<Either<FirebaseFailure, UserCredential>> firebaseLogin({
    required FirabaseLoginReqBodyModel firabaseLoginReqBodyModel,
  }) async {
    return await loginRepo.firebaseLogin(
      firabaseLoginReqBodyModel: firabaseLoginReqBodyModel,
    );
  }

  Future<ApiResult<Auth?>> authToken({
    required AuthIdTokenReqBodyModel authIdTokenReqBodyModel,
  }) async {
    return await loginRepo.authToken(
      authIdTokenReqBodyModel: authIdTokenReqBodyModel,
    );
  }
}
