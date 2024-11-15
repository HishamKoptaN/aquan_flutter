import 'package:aquan/features/buy_sell/data/model/received_account_number_res_model.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/data_source/buy_sell_api.dart';
import '../../data/model/buy_sell_model.dart';
import '../../data/repo/buy_sell_repo.dart';

class BuySellRepoImpl implements BuySellRepo {
  final BuySellApi plansApi;
  BuySellRepoImpl(
    this.plansApi,
  );

  @override
  Future<ApiResult<BuySellResModel>> getBuySellRates() async {
    try {
      final response = await plansApi.getBuySellRates();
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
  Future<ApiResult<ReceivedAccountNumberResModel>> getReceiveAccountNumber({
    required int? id,
  }) async {
    try {
      final response = await plansApi.getReceiveAccountNumber(
        id: id,
      );
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
  Future<ApiResult<void>> transferMoney({
    required FormData formData,
  }) async {
    try {
      await plansApi.getBuySellRates();
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
