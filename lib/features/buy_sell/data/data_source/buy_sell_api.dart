import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/buy_sell_model.dart';
import '../model/received_account_number_res_model.dart';
part 'buy_sell_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class BuySellApi {
  factory BuySellApi(
    Dio dio, {
    String baseUrl,
  }) = _BuySellApi;
// ! GET Buy Sell Rates
  @GET(
    ApiConstants.buySell,
  )
  Future<BuySellResModel> getBuySellRates();

// ! GET Receive Account Number
  @GET(
    ApiConstants.buySell,
  )
  Future<ReceivedAccountNumberResModel> getReceiveAccountNumber({
    @Body() required int? id,
  });
  // ! Transfer Money
  @POST(
    ApiConstants.buySell,
  )
  Future<void> transfer({
    @Body() required FormData formData,
  });
}
