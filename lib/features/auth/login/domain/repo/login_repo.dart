import 'package:dartz/dartz.dart';
import '../../../../../core/models/auth.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/errors/firebase_login_failures.dart';
import '../../data/models/auth_id_token_req_body_model.dart';

abstract class LoginRepo {
  Future<Either<FirebaseSignInFailure, String>> firebaseLogin({
    required String email,
    required String password,
  });  Future<Either<String, ApiErrorModel>> signInWithGoogle({
    required String email,
    required String password,
  });
  Future<ApiResult<Auth?>> authToken({
    required AuthIdTokenReqBodyModel authIdTokenReqBodyModel,
  });
}
