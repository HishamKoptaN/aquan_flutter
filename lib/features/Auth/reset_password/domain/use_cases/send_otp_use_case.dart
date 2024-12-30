import '../../../../../core/networking/api_result.dart';
import '../../data/models/send_otp_req_body_model.dart';
import '../../data/repo/reset_password_repo_impl.dart';

class SendPassOtpUseCase {
  final ResetPassRepoImpl resetPassRepo;
  SendPassOtpUseCase({
    required this.resetPassRepo,
  });
  Future<ApiResult<void>> sendOtp({
    required SendOtpReqBodyModel sendOtpReqBodyModel,
  }) async {
    return await resetPassRepo.sendOtp(
      sendOtpReqBodyModel: sendOtpReqBodyModel,
    );
  }
}
