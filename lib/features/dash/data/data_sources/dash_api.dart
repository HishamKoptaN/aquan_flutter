import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../model/dash_res_model.dart';
part 'dash_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class DashApi {
  factory DashApi(
    Dio dio, {
    String baseUrl,
  }) = _DashApi;

  @POST(ApiConstants.dash)
  Future<DashResModel> get();
}
