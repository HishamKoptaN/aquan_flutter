import '../../../../core/models/auth.dart';
import '../../../../core/networking/api_result.dart';
import '../repo/main_repo.dart';
import '../../data/models/edit_pass_req_body_model.dart';

class MainUseCases {
  final MainRepo mainRepo;
  MainUseCases(
    this.mainRepo,
  );
  Future<ApiResult<Auth>> check() async {
    return await mainRepo.check();
  }

  Future<ApiResult<void>> editPass({
    required EditPassReqBodyModel editPassReqBodyModel,
  }) async {
    return await mainRepo.editPass(
      editPassReqBodyModel: editPassReqBodyModel,
    );
  }
}
