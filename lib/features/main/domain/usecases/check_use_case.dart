import '../../../../core/models/user.dart';
import '../../../../core/networking/api_result.dart';
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
