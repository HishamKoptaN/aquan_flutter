import 'package:aquan/core/networking/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../data/model/trans_model.dart';
import '../../data/repo/transactions_repo.dart';

@LazySingleton()
class GetTransUseCase {
  final TransRepo transRepo;
  GetTransUseCase(
    this.transRepo,
  );
  Future<ApiResult<List<Trans>>> get() async {
    return await transRepo.get();
  }
}
