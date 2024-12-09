import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/singletons/account.dart';
import '../../domain/repo/accounts_rep.dart';
import '../datasources/accounts_api.dart';

class AccountsRepoImpl implements AccountsRepo {
  final AccountsApi accountsApi;
  AccountsRepoImpl(
    this.accountsApi,
  );
  @override
  Future<ApiResult<List<Account>>> get() async {
    try {
      final response = await accountsApi.get();
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<List<Account>>> edit({
    required List<Account> accounts,
  }) async {
    try {
      final response = await accountsApi.edit(
        accounts: accounts,
      );
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }
}
