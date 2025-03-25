import 'package:aquan/core/networking/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../data/model/withdraw_rates_res_model.dart';
import '../../data/repo/withdraws_repo.dart';

@LazySingleton()
class GetWithdrawRatessUseCase {
  final WithdrawsRepo withdrawsRepo;
  GetWithdrawRatessUseCase({
    required this.withdrawsRepo,
  });
  Future<ApiResult<WithdrawRatesResModel>> getWithdrawRates() async {
    return await withdrawsRepo.getWithdrawRates();
  }
}
