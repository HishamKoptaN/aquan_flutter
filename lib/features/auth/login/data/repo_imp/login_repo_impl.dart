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
import '../errors/google_sign_in_failures.dart';
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
        return Left(
          failure,
        );
      } else {
        return Left(
          LoginServerFailure(),
        );
      }
    }
  }

  @override
  Future<Either<GoogleSignInFailures, String>> signInWithGoogle() async {
    try {
      final idToken = await loginRemDataSrc.loginWithGoogle();
      return Right(
        idToken,
      );
    } catch (error) {
      return Left(
        _mapExceptionToFailure(
          error,
        ),
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

  GoogleSignInFailures _mapExceptionToFailure(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'network-request-failed':
          return const GoogleSignInFailures.networkError();
        case 'user-disabled':
          return const GoogleSignInFailures.userDisabled();
        case 'user-not-found':
          return const GoogleSignInFailures.userNotFound();
        case 'wrong-password':
        case 'invalid-credential':
          return const GoogleSignInFailures.invalidCredential();
        case 'operation-not-allowed':
          return const GoogleSignInFailures.operationNotAllowed();
        case 'too-many-requests':
          return const GoogleSignInFailures.tooManyRequests();
        case 'account-exists-with-different-credential':
          return const GoogleSignInFailures
              .accountExistsWithDifferentCredential();
        default:
          return GoogleSignInFailures.serverError(
              message: error.message ?? 'Unknown error');
      }
    } else {
      return GoogleSignInFailures.serverError(
        message: error.toString(),
      );
    }
  }
}
