import '../../../../../core/networking/api_result.dart';
import '../../data/models/add_email_req_body_model.dart';
import '../../data/models/send_otp_verify_email_res_model.dart';
import '../../data/models/verify_email_otp_req_body_model.dart';

abstract class VerifyEmailRepo {
  Future<ApiResult<void>> verifyEmailOtp({
    required VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel,
  });
  Future<ApiResult<SendOtpResModel>> sendEmailOtp();
}
