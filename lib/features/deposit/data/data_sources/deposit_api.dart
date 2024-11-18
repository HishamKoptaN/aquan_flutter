import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_constants.dart';
import '../model/deposits_res_model.dart';
import '../model/employee_account_res_model.dart';
part 'deposit_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class DepositApi {
  factory DepositApi(
    Dio dio, {
    String baseUrl,
  }) = _DepositApi;

  @GET(
    ApiConstants.deposit,
  )
  Future<DepositsResModel> get();
//!

  @GET(
    ApiConstants.depositRates,
  )
  Future<EmployeeAccountResModel> getEmployeeAccount();

//!
  @POST(
    ApiConstants.deposit,
  )
  Future<void> deposit();
}
