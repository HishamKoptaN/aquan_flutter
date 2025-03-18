import '../../../../core/models/auth.dart';
import '../../../../core/networking/api_result.dart';

abstract class MainRepo {
  Future<ApiResult<Auth>> check();
}
