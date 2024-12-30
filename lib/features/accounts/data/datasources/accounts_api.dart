import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/models/account.dart';
part 'accounts_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class AccountsApi {
  factory AccountsApi(
    Dio dio, {
    String baseUrl,
  }) = _AccountsApi;
  //! Get
  @GET(
    ApiConstants.accounts,
  )
  Future<List<Account>> get();
  //! Edit
  @PATCH(
    ApiConstants.accounts,
  )
  Future<List<Account>> edit({
    @Body() required List<Account> accounts,
  });
}
