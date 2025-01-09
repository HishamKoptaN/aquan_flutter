import 'package:aquan/all_imports.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/data_source/buy_sell_api.dart';
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
  Future<ApiResult<Account>> getReceiveAccountNumber({
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
      await plansApi.transferMoney(
        formData: formData,
      );
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
