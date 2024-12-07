import '../../../../core/models/user.dart';
import '../../../../core/networking/api_result.dart';

abstract class MainRepo {
  Future<ApiResult<User>> check();
}
