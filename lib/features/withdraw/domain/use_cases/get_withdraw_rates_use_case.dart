import 'package:aquan/core/networking/api_result.dart';

import '../../data/model/withdraw_rates_res_model.dart';
import '../repo_imp/withdraws_repo_impl.dart';

class GetWithdrawRatessUseCase {
  final WithdrawsRepoImpl withdrawsRepoImpl;
  GetWithdrawRatessUseCase({
    required this.withdrawsRepoImpl,
  });
  Future<ApiResult<WithdrawRatesResModel>> getWithdrawRates() async {
    return await withdrawsRepoImpl.getWithdrawRates();
  }
}
