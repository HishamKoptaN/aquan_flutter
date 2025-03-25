import 'package:aquan/core/networking/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/withdraws_res_model.dart';
import '../../data/repo/withdraws_repo.dart';
import '../repo_imp/withdraws_repo_impl.dart';

@LazySingleton()
class GetWithdrawsUseCase {
  final WithdrawsRepo withdrawsRepo;
  GetWithdrawsUseCase({
    required this.withdrawsRepo,
  });
  Future<ApiResult<List<Withdraw>?>> getWithdraws() async {
    return await withdrawsRepo.getWithdraws();
  }
}
