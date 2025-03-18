import '../../../../core/models/auth.dart';
import '../../../../core/networking/api_result.dart';
import '../repo/main_repo.dart';

class MainUseCases {
  final MainRepo mainRepo;
  MainUseCases(
    this.mainRepo,
  );
  Future<ApiResult<Auth>> check() async {
    return await mainRepo.check();
  }
}
