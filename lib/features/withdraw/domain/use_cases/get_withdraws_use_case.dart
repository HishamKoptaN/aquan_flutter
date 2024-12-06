import 'package:aquan/core/networking/api_result.dart';

import '../../data/model/withdraws_res_model.dart';
import '../repo_imp/withdraws_repo_impl.dart';

class GetWithdrawsUseCase {
  final WithdrawsRepoImpl withdrawsRepoImpl;
  GetWithdrawsUseCase({
    required this.withdrawsRepoImpl,
  });
  Future<ApiResult<List<Withdraw>?>> getWithdraws() async {
    return await withdrawsRepoImpl.getWithdraws();
  }
}
