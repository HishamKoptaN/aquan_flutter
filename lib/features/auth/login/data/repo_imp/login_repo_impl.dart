import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/firebase_failures.dart';
import '../../../../../core/models/auth.dart';
import '../../../../../core/networking/api_result.dart';
import '../../domain/repo/login_repo.dart';
import '../data_sources/login_api.dart';
import '../models/auth_id_token_req_body_model.dart';
import '../models/firabase_login_req_body_model.dart';
@Injectable(
  as: LoginRepo,
)
class LoginRepoImpl implements LoginRepo {
  LoginRemDataSrc loginRemDataSrc;
  final LoginApi loginApi;
  LoginRepoImpl(
    this.loginRemDataSrc,
    this.loginApi,
  );
  @override
  Future<Either<FirebaseFailure, UserCredential>> firebaseLogin({
    required FirabaseLoginReqBodyModel firabaseLoginReqBodyModel,
  }) async {
    try {
      final userCredential = await loginRemDataSrc.firebaseLogin(
        firabaseLoginReqBodyModel: firabaseLoginReqBodyModel,
      );
      return Right(
        userCredential,
      );
    } on ExistedAccountException {
      return Left(
        ExistedAccountFailure(),
      );
    } on WrongPasswordException {
      return Left(
        WrongPasswordFailure(),
      );
    } on ServerException {
      return Left(
        ServerFailure(),
      );
    }
  }

  @override
  Future<ApiResult<Auth>> authToken({
    required AuthIdTokenReqBodyModel authIdTokenReqBodyModel,
  }) async {
    try {
      final response = await loginApi.authToken(
        authIdTokenReqBodyModel: authIdTokenReqBodyModel,
      );
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }
}
