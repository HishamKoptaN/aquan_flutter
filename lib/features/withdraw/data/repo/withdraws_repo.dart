import '../../../../../core/networking/api_result.dart';
import '../model/withdraw_rates_res_model.dart';
import '../model/withdraw_request_body_model.dart';
import '../model/withdraws_res_model.dart';

abstract class WithdrawsRepo {
  Future<ApiResult<List<Withdraw>?>> getWithdraws();
  Future<ApiResult<WithdrawRatesResModel>> getWithdrawRates();
  Future<ApiResult<void>> addWithdraw({
    required WithdrawRequestBody withdrawRequestBody,
  });
}
