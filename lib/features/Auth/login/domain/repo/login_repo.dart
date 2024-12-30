import '../../../../../core/models/auth.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/models/login_req_body.dart';

abstract class LoginRepo {
  Future<ApiResult<Auth>> login({
    required LoginReqBody loginReqBody,
  });
}
