import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/models/auth.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/edit_pass_req_body_model.dart';
part 'main_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiAuthBaseUrl,
)
abstract class MainApi {
  factory MainApi(
    Dio dio, {
    String baseUrl,
  }) = _MainApi;
  // ! Check
  @POST(
    ApiConstants.check,
  )
  Future<Auth> check();
  // ! changePassword
  @POST(
    ApiConstants.editPass,
  )
  Future<void> editPass({
    @Body() required EditPassReqBodyModel editPassReqBodyModel,
  });
}
