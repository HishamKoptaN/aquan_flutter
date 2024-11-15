import '../../../../../core/networking/api_result.dart';
import '../model/dash_res_model.dart';

abstract class DashRepo {
  Future<ApiResult<DashResModel>> get();
}
