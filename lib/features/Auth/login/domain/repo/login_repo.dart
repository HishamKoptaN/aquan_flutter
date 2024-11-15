import '../../../../../core/networking/api_result.dart';
import '../../data/models/login_request_body.dart';
import '../../data/models/login_response.dart';

abstract class LoginRepo {
  Future<ApiResult<LoginResponse>> login({
    required LoginRequestBody loginRequestBody,
  });
}
