import 'package:dio/dio.dart';
import '../../../../../core/networking/api_result.dart';
import '../model/buy_sell_res_model.dart';
import '../model/received_account_number_res_model.dart';

abstract class BuySellRepo {
  Future<ApiResult<BuySellResModel>> getBuySellRates();
  Future<ApiResult<ReceivedAccountNumberResModel>> getReceiveAccountNumber({
    required int id,
  });
  Future<ApiResult<void>> transferMoney({
    required FormData formData,
  });
}
