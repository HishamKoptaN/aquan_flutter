import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/models/auth.dart';
import '../../../../../core/networking/api_constants.dart';
import '../errors/firebase_login_failures.dart';
import '../models/auth_id_token_req_body_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/errors/exceptions.dart';
part 'login_api.g.dart';

@LazySingleton()
class LoginRemDataSrc {
  final FirebaseAuth firebaseAuth;
  LoginRemDataSrc({
    required this.firebaseAuth,
  });
// ! firebaseLogin
  Future<String> firebaseLogin({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return await userCredential.user?.getIdToken() ?? '';
    } on FirebaseAuthException catch (e) {
      throw _mapLoginException(
        e: e,
      );
    }
  }

// ! loginWithGoogle
  Future<String> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: [
          'email',
          'profile',
        ],
      ).signIn();
      if (googleUser == null) {
        throw UserCancelledException();
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(
        credential,
      );
      return await userCredential.user?.getIdToken() ?? '';
    } on FirebaseAuthException catch (e) {
      log("🔥 FirebaseAuthException Code: ${e.code}");
      throw _mapLoginException(
        e: e,
      );
    }
  }

  //! التحقق من رقم الهاتف
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
  }) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } on FirebaseAuthException {
      throw ServerException();
    } catch (_) {
      throw ServerException();
    }
  }

  //! تسجيل الدخول باستخدام بيانات التحقق من الهاتف
  Future<UserCredential> signInWithPhoneCredential({
    required PhoneAuthCredential credential,
  }) async {
    try {
      return await firebaseAuth.signInWithCredential(
        credential,
      );
    } on FirebaseAuthException {
      throw ServerException();
    } catch (_) {
      throw ServerException();
    }
  }

  //! تحويل أخطاء Firebase في تسجيل الدخول
  FirebaseSignInFailure _mapLoginException({
    required FirebaseAuthException e,
  }) {
    log("🔥 Mapping FirebaseAuthException: ${e.code}");
    switch (e.code) {
      case 'user-not-found':
        return UserNotFoundFailure();
      case 'wrong-password':
        return WrongPasswordFailure();
      case 'user-disabled':
        return UserDisabledFailure();
      case 'invalid-credential':
        return InvalidCredentialFailure();
      default:
        return LoginServerFailure();
    }
  }
}

@RestApi(
  baseUrl: ApiConstants.apiAuthBaseUrl,
)
abstract class LoginApi {
  factory LoginApi(
    Dio dio, {
    String baseUrl,
  }) = _LoginApi;
  @POST(
    ApiConstants.authToken,
  )
  Future<Auth> authToken({
    @Body() required AuthIdTokenReqBodyModel authIdTokenReqBodyModel,
  });
}
