import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/models/auth.dart';
import '../../../../../core/networking/api_constants.dart';
import '../models/login_request_body.dart';
part 'login_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiAuthBaseUrl,
)
abstract class LoginApi {
  factory LoginApi(
    Dio dio, {
    String baseUrl,
  }) = _LoginApi;

  @POST(ApiConstants.login)
  Future<Auth> login({
    @Body() required LoginRequestBody loginRequestBody,
  });
}
