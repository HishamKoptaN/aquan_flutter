import '../../../../core/networking/api_result.dart';
import '../../data/models/edit_pass_req_body_model.dart';
import '../repo/main_repo.dart';

class EditPassUseCase {
  final MainRepo mainRepo;
  EditPassUseCase(
    this.mainRepo,
  );
  Future<ApiResult<void>> editPass({
    required EditPassReqBodyModel editPassReqBodyModel,
  }) async {
    return await mainRepo.editPass(
      editPassReqBodyModel: editPassReqBodyModel,
    );
  }
}
