import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../model/deposits_res_model.dart';
import '../model/employee_account_res_model.dart';
part 'deposits_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class DepositsApi {
  factory DepositsApi(
    Dio dio, {
    String baseUrl,
  }) = _DepositsApi;

  @GET(
    ApiConstants.deposits,
  )
  Future<DepositsResModel> get();
//!

  @GET(
    ApiConstants.depositRates,
  )
  Future<EmployeeAccountResModel> getEmployeeAccount();

//!
  @POST(
    ApiConstants.deposits,
  )
  Future<void> deposits();
}
