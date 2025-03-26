import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/errors/firebase_sign_up_failures.dart';
import '../../data/models/sign_up_req_body.dart';
import '../../data/models/sign_up_res_model.dart';
import '../repo/sign_up_repo.dart';

@LazySingleton()
class SignUpUseCases {
  final SignUpRepo signUpRepo;
  SignUpUseCases(
    this.signUpRepo,
  );

  Future<Either<FirebaseSignUpFailure, String>> firebaseSignUp({
    required String email,
    required String password,
  }) async {
    try {
      final idToken = await signUpRepo.firebaseSignUp(
        email: email,
        password: password,
      );
      return Right(idToken);
    } on FirebaseSignUpFailure catch (e) {
      return Left(e);
    }
  }

  Future<ApiResult<SignUpResModel>> signUp({
    required SignUpReqBody signUpReqBody,
  }) async {
    return await signUpRepo.signUp(
      signUpReqBody: signUpReqBody,
    );
  }
}
