import 'package:aquan/features/withdraw/data/model/withdraw_request_body_model.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/data_source/withdraw_api.dart';
import '../../data/model/withdraw_rates_res_model.dart';
import '../../data/model/withdraws_res_model.dart';
import '../../data/repo/withdraws_repo.dart';

class WithdrawsRepoImpl implements WithdrawsRepo {
  final WithdrawsApi withdrawsApi;
  WithdrawsRepoImpl({
    required this.withdrawsApi,
  });

  @override
  Future<ApiResult<List<Withdraw>?>> getWithdraws() async {
    try {
      final response = await withdrawsApi.getWithdraws();
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<WithdrawRatesResModel>> getWithdrawRates() async {
    try {
      final response = await withdrawsApi.getWithdrawRates();
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<void>> addWithdraw({
    required WithdrawRequestBody withdrawRequestBody,
  }) async {
    try {
      await withdrawsApi.getWithdrawRates();
      return const ApiResult.success(
        data: null,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }
}
