import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../domain/repo/email_verify_repo.dart';
import '../data_sources/api/verify_email_api.dart';
import '../models/send_otp_verify_email_res_model.dart';
import '../models/verify_email_otp_req_body_model.dart';

class VerifyEmailRepoImpl implements VerifyEmailRepo {
  final VerifyEmailApi verifyEmailApi;
  VerifyEmailRepoImpl({
    required this.verifyEmailApi,
  });

  @override
  Future<ApiResult<SendOtpResModel>> sendEmailOtp() async {
    try {
      final response = await verifyEmailApi.sendOtp();
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<void>> verifyEmailOtp({
    required VerifyEmailOtpReqBodyModel verifyEmailOtpReqBodyModel,
  }) async {
    try {
      await verifyEmailApi.verifyOtp(
        verifyEmailOtpReqBodyModel: verifyEmailOtpReqBodyModel,
      );
      return const ApiResult.success(
        data: null,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }
}
