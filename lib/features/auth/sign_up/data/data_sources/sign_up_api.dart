import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../models/sign_up_req_body.dart';
import '../models/sign_up_res_model.dart';
part 'sign_up_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiAuthBaseUrl,
)
abstract class SignUpApi {
  factory SignUpApi(
    Dio dio, {
    String baseUrl,
  }) = _SignUpApi;
  @POST(
    ApiConstants.signup,
  )
  Future<SignUpResModel> signUp({
    @Body() required SignUpReqBody signUpReqBody,
  });
}
