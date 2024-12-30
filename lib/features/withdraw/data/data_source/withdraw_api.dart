import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/withdraw_req_body_model.dart';
import '../model/withdraws_res_model.dart';
import '../model/withdraw_rates_res_model.dart';
part 'withdraw_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class WithdrawsApi {
  factory WithdrawsApi(
    Dio dio, {
    String baseUrl,
  }) = _WithdrawsApi;
  // Get Withdraws
  @GET(
    ApiConstants.withdraws,
  )
  Future<List<Withdraw>?> getWithdraws();
  // Get Withdraw Rates
  @GET(
    ApiConstants.withdrawRates,
  )
  Future<WithdrawRatesResModel> getWithdrawRates();
  // Withdraw Money
  @POST(
    ApiConstants.withdraws,
  )
  Future<void> addWithdraw({
    @Body() required WithdrawReqBodyModel withdrawReqBodyModel,
  });
}
