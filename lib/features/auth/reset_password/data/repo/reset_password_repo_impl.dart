import '../../../../../core/errors/api_error_handler.dart';
import '../../../../../core/models/auth.dart';
import '../../../../../core/networking/api_result.dart';
import '../../domain/repo/reset_password_repo.dart';
import '../data_sources/api/reset_pass_api.dart';
import '../models/reset_pass_req_body.dart';
import '../models/send_otp_req_body_model.dart';
import '../models/verify_otp_req_body_model.dart';

class ResetPassRepoImpl implements ResetPassRepo {
  final ResetPassApi resetPassApi;
  ResetPassRepoImpl({
    required this.resetPassApi,
  });

  @override
  Future<ApiResult<void>> sendOtp({
    required SendOtpReqBodyModel sendOtpReqBodyModel,
  }) async {
    try {
      final response = await resetPassApi.sendOtp(
        sendOtpReqBodyModel: sendOtpReqBodyModel,
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

  @override
  Future<ApiResult<void>> verifyOtp({
    required VerifyOtpReqBodyModel verifyOtpReqBodyModel,
  }) async {
    try {
      await resetPassApi.verifyOtp(
        verifyOtpReqBodyModel: verifyOtpReqBodyModel,
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

  @override
  Future<ApiResult<Auth>> resetPass({
    required ResetPassReqBody resetPassReqBody,
  }) async {
    try {
      final response = await resetPassApi.resetPass(
        resetPassReqBody: resetPassReqBody,
      );
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
}
