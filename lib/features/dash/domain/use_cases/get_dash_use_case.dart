import 'package:aquan/core/networking/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../data/model/dash_res_model.dart';
import '../../data/repo/dash_repo.dart';

@LazySingleton()
class GetDashUseCase {
  final DashRepo dashRepo;
  GetDashUseCase(
    this.dashRepo,
  );
  Future<ApiResult<DashResModel>> get() async {
    return await dashRepo.get();
  }
}
