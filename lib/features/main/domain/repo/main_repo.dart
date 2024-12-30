import '../../../../core/models/auth.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/edit_pass_req_body_model.dart';

abstract class MainRepo {
  Future<ApiResult<Auth>> check();
  Future<ApiResult<void>> editPass({
    required EditPassReqBodyModel editPassReqBodyModel,
  });
}
