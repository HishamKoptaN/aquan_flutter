import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/plan_model.dart';
import '../model/plan_rate.dart';
part 'plans_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class PlansApi {
  factory PlansApi(
    Dio dio, {
    String baseUrl,
  }) = _PlansApi;
// ! GET plans
  @GET(
    ApiConstants.plans,
  )
  Future<List<Plan>> get();

// ! GET plans rates
  @GET(
    ApiConstants.plansRates,
  )
  Future<PlanRate> getPlansRates();
  // ! Change plan rate
  @POST(
    ApiConstants.plansRates,
  )
  Future<void> change({
    @Body() required FormData formData,
  });
}
