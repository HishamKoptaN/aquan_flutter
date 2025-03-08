import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/models/auth.dart';
import '../../../../../core/networking/api_constants.dart';
import '../models/auth_id_token_req_body_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/firabase_login_req_body_model.dart';
part 'login_api.g.dart';

@injectable
class LoginRemDataSrc {
  final FirebaseAuth firebaseAuth;

  LoginRemDataSrc({
    required this.firebaseAuth,
  });
  Future<UserCredential> firebaseLogin({
    required FirabaseLoginReqBodyModel firabaseLoginReqBodyModel,
  }) async {
    try {
      await firebaseAuth.currentUser?.reload();
      return await firebaseAuth.signInWithEmailAndPassword(
        email: firabaseLoginReqBodyModel.email ?? '',
        password: firabaseLoginReqBodyModel.password ?? '',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ExistedAccountException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordException();
      } else {
        throw ServerException();
      }
    } catch (_) {
      throw ServerException();
    }
  }

  Future<UserCredential> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw UserCancelledException(); // المستخدم ألغى العملية
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException {
      throw ServerException();
    } catch (_) {
      throw ServerException();
    }
  }

  /// التحقق من رقم الهاتف
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

  /// تسجيل الدخول باستخدام بيانات التحقق من الهاتف
  Future<UserCredential> signInWithPhoneCredential(
      PhoneAuthCredential credential) async {
    try {
      return await firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException {
      throw ServerException();
    } catch (_) {
      throw ServerException();
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
