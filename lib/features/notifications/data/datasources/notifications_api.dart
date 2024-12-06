import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/notifications_res_model.dart';
part 'notifications_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class NotificationsApi {
  factory NotificationsApi(
    Dio dio, {
    String baseUrl,
  }) = _NotificationsApi;

  @GET(
    ApiConstants.notifications,
  )
  Future<List<Notification>> get();
}
