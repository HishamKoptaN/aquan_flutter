import '../../../../../core/networking/api_result.dart';
import '../../data/models/verify_email_otp_req_body_model.dart';
import '../../data/repo/email_verify_repo_impl.dart';

class VerifyEmailOtpUseCase {
  final VerifyEmailRepoImpl verifyEmailRepo;
  VerifyEmailOtpUseCase({
    required this.verifyEmailRepo,
  });
  Future<ApiResult<void>> verifyEmailOtp({
    required VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel,
  }) async {
    return await verifyEmailRepo.verifyEmailOtp(
      verifyEmailOtpReqBodyModel: verifyEmailOtpReqBodyModel,
    );
  }
}
