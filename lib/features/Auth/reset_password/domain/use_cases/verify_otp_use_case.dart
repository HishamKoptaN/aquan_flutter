import '../../../../../core/networking/api_result.dart';
import '../../data/models/verify_otp_req_body_model.dart';
import '../../data/repo/reset_password_repo_impl.dart';

class VerifyPassOtpUseCase {
  final ResetPassRepoImpl resetPassRepo;
  VerifyPassOtpUseCase({
    required this.resetPassRepo,
  });
  Future<ApiResult<void>> verifyOtp({
    required VerifyOtpReqBodyModel verifyOtpReqBodyModel,
  }) async {
    return await resetPassRepo.verifyOtp(
      verifyOtpReqBodyModel: verifyOtpReqBodyModel,
    );
  }
}
