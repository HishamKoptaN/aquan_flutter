import 'package:aquan/core/networking/api_result.dart';
import '../../data/model/dash_res_model.dart';
import '../repo_imp/dash_repo_impl.dart';

class GetDashUseCase {
  final DashRepoImpl dashRepo;
  GetDashUseCase(
    this.dashRepo,
  );
  Future<ApiResult<DashResModel>> get() async {
    return await dashRepo.get();
  }
}
