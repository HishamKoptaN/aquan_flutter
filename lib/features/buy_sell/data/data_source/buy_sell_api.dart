import 'package:aquan/all_imports.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
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
  @GET("${ApiConstants.buySell}/{id}")
  Future<Account> getReceiveAccountNumber({
    @Path("id") required int? id,
  });

  // ! Transfer Money
  @POST(
    ApiConstants.buySell,
  )
  Future<void> transferMoney({
    @Body() required FormData formData,
  });
}
