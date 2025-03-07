import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../../core/models/auth.dart';
import '../../../../../../core/networking/api_constants.dart';
import '../../models/reset_pass_req_body.dart';
import '../../models/send_otp_req_body_model.dart';
import '../../models/verify_otp_req_body_model.dart';
part 'reset_pass_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiAuthBaseUrl,
)
abstract class ResetPassApi {
  factory ResetPassApi(
    Dio dio, {
    String baseUrl,
  }) = _ResetPassApi;
  @POST(
    ApiConstants.sendOtp,
  )
  Future<void> sendOtp({
    @Body() required SendOtpReqBodyModel sendOtpReqBodyModel,
  });
  @POST(
    ApiConstants.verifyOtp,
  )
  Future<void> verifyOtp({
    @Body() required VerifyOtpReqBodyModel verifyOtpReqBodyModel,
  });
  @POST(
    ApiConstants.resetPassword,
  )
  Future<Auth> resetPass({
    @Body() required ResetPassReqBody resetPassReqBody,
  });
}
