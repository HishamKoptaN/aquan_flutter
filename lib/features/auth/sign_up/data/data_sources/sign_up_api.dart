import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../errors/firebase_sign_up_failures.dart';
import '../models/sign_up_req_body.dart';
import '../models/sign_up_res_model.dart';
part 'sign_up_api.g.dart';

// SignUp Remote Data Source
@LazySingleton()
class SignUpRemDataSrc {
  final FirebaseAuth firebaseAuth;
  SignUpRemDataSrc({
    required this.firebaseAuth,
  });

  Future<String> firebaseSignUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return await user?.getIdToken() ?? '';
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseException(
        e: e,
      );
    } catch (_) {
      throw ServerFailure();
    }
  }

  FirebaseSignUpFailure _mapFirebaseException({
    required FirebaseAuthException e,
  }) {
    switch (e.code) {
      case 'email-already-in-use':
        return EmailAlreadyInUseFailure();
      case 'invalid-email':
        return InvalidEmailFailure();
      case 'weak-password':
        return WeakPasswordFailure();
      default:
        return ServerFailure();
    }
  }
}

@RestApi(
  baseUrl: ApiConstants.apiAuthBaseUrl,
)
abstract class SignUpApi {
  factory SignUpApi(
    Dio dio, {
    String baseUrl,
  }) = _SignUpApi;
  @POST(
    ApiConstants.signup,
  )
  Future<SignUpResModel> signUp({
    @Body() required SignUpReqBody signUpReqBody,
  });
}
