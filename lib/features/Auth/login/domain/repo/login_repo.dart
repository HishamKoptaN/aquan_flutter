import '../../../../../core/models/auth.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/models/login_request_body.dart';

abstract class LoginRepo {
  Future<ApiResult<Auth>> login({
    required LoginRequestBody loginRequestBody,
  });
}
