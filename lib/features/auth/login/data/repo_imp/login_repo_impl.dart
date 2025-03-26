import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/models/auth.dart';
import '../../../../../core/networking/api_result.dart';
import '../../domain/repo/login_repo.dart';
import '../data_sources/login_api.dart';
import '../errors/firebase_login_failures.dart';
import '../models/auth_id_token_req_body_model.dart';

@Injectable(
  as: LoginRepo,
)
class LoginRepoImpl implements LoginRepo {
  LoginRemDataSrc loginRemDataSrc;
  final LoginApi loginApi;
  final FirebaseAuth firebaseAuth;
  LoginRepoImpl(
    this.loginRemDataSrc,
    this.loginApi,
    this.firebaseAuth,
  );

  @override
  Future<Either<FirebaseSignInFailure, String>> firebaseLogin({
    required String email,
    required String password,
  }) async {
    try {
      final idToken = await loginRemDataSrc.firebaseLogin(
        email: email,
        password: password,
      );
      return Right(
        idToken,
      );
    } catch (failure) {
      log(
        "🔥 LoginRepoImpl Catch: ${failure.runtimeType} - ${failure.toString()}",
      );

      if (failure is FirebaseSignInFailure) {
        return Left(failure);
      } else {
        return Left(LoginServerFailure());
      }
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
