import 'package:retrofit/retrofit.dart';
import '../../../../core/models/section_res_model.dart';
import '../../../../core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import '../model/section_model.dart';
part 'controll_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class ControllApi {
  factory ControllApi(
    Dio dio, {
    String baseUrl,
  }) = _ControllApi;
  //! Get
  @GET(
    ApiConstants.controll,
  )
  Future<List<SectionModel>?> get();
}
