import '../../../../core/networking/api_result.dart';
import '../../../../core/singletons/user_singleton.dart';

abstract class MainRepo {
  Future<ApiResult<User>> check();
}
