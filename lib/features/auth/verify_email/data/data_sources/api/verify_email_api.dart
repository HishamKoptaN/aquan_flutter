import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../../core/models/auth.dart';
import '../../../../../../core/networking/api_constants.dart';
import '../../models/add_email_req_body_model.dart';
import '../../models/send_otp_verify_email_req_body_model.dart';
import '../../models/send_otp_verify_email_res_model.dart';
import '../../models/verify_email_otp_req_body_model.dart';
part 'verify_email_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiAuthBaseUrl,
)
abstract class VerifyEmailApi {
  factory VerifyEmailApi(
    Dio dio, {
    String baseUrl,
  }) = _VerifyEmailApi;
  @POST(
    ApiConstants.addEmail,
  )
  Future<void> addEmail({
    @Body() required AddEmailReqBodyModel addEmailReqBodyModel,
  });
  @POST(
    ApiConstants.sendEmailOtp,
  )
  Future<SendOtpResModel> sendOtp();
  @POST(
    ApiConstants.verifyEmailOtp,
  )
  Future<void> verifyOtp({
    @Body() required VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel,
  });
}
