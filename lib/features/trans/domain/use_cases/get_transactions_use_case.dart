import 'package:aquan/core/networking/api_result.dart';
import '../../data/model/trans_model.dart';
import '../repo_imp/transactions_repo_impl.dart';

class GetTransUseCase {
  final TransRepoImpl transRepo;
  GetTransUseCase(
    this.transRepo,
  );
  Future<ApiResult<List<Trans>>> get() async {
    return await transRepo.get();
  }
}
