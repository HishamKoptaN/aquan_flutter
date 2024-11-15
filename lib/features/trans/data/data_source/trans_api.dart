import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/trans_model.dart';
part 'trans_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class TransApi {
  factory TransApi(
    Dio dio, {
    String baseUrl,
  }) = _TransApi;

  @GET(
    ApiConstants.trans,
  )
  Future<List<Trans>> get();
}
