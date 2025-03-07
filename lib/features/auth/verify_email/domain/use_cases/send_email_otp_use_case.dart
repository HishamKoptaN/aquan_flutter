import '../../../../../core/networking/api_result.dart';
import '../../data/models/send_otp_verify_email_res_model.dart';
import '../../data/repo/email_verify_repo_impl.dart';

class SendEmailOtpUseCase {
  final VerifyEmailRepoImpl verifyEmailRepo;
  SendEmailOtpUseCase({
    required this.verifyEmailRepo,
  });
  Future<ApiResult<SendOtpResModel>> sendEmailOtp() async {
    return await verifyEmailRepo.sendEmailOtp();
  }
}
