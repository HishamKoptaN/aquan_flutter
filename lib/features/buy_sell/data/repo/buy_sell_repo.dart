import 'package:aquan/all_imports.dart';
import 'package:dio/dio.dart';
import '../../../../../core/networking/api_result.dart';

abstract class BuySellRepo {
  Future<ApiResult<BuySellResModel>> getBuySellRates();
  Future<ApiResult<Account>> getReceiveAccountNumber({
    required int? id,
  });
  Future<ApiResult<void>> transferMoney({
    required FormData formData,
  });
}
