import 'package:retrofit/retrofit.dart';
import '../../../../core/models/section_res_model.dart';
import '../../../../core/networking/api_constants.dart';
import 'package:dio/dio.dart';
part 'support_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class SupportApi {
  factory SupportApi(
    Dio dio, {
    String baseUrl,
  }) = _SupportApi;
  //! Get
  @GET(
    ApiConstants.support,
  )
  Future<SectionResModel?> get();
}
