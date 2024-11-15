import '../../../../core/networking/api_result.dart';
import '../../../../core/singletons/user_singleton.dart';
import '../repo/main_repo.dart';

class CheckUseCase {
  final MainRepo mainRepo;
  CheckUseCase(
    this.mainRepo,
  );
  Future<ApiResult<User>> check() async {
    return await mainRepo.check();
  }
}
