import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/models/user.dart';
import '../../../../core/networking/api_constants.dart';
part 'profile_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class ProfileApi {
  factory ProfileApi(
    Dio dio, {
    String baseUrl,
  }) = _ProfileApi;
  //! editProfile
  @POST(
    ApiConstants.profile,
  )
  Future<UserModel> editProfile({
    @Body() required FormData formData,
  });
}
