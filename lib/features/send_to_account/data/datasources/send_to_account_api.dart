import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/username_by_account_res_model.dart';
import '../model/transfer_request_body_model.dart';
part 'send_to_account_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class SendToAccountApi {
  factory SendToAccountApi(
    Dio dio, {
    String baseUrl,
  }) = _SendToAccountApi;
// ! GET Username By Account
  @GET("${ApiConstants.transfer}/{accountNumber}")
  Future<UsernameByAccountResModel> get({
    @Path("accountNumber") required String accountNumber,
  });
  // ! send
  @POST(
    ApiConstants.transfer,
  )
  Future<void> send({
    @Body() required TransferRequestBody transferRequestBody,
  });
}
