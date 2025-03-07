import '../../../../../core/models/auth.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/models/reset_pass_req_body.dart';
import '../../data/models/send_otp_req_body_model.dart';
import '../../data/models/verify_otp_req_body_model.dart';

abstract class ResetPassRepo {
  Future<ApiResult<void>> sendOtp({
    required SendOtpReqBodyModel sendOtpReqBodyModel,
  });
  Future<ApiResult<void>> verifyOtp({
    required VerifyOtpReqBodyModel verifyOtpReqBodyModel,
  });
  Future<ApiResult<Auth>> resetPass({
    required ResetPassReqBody resetPassReqBody,
  });
}
