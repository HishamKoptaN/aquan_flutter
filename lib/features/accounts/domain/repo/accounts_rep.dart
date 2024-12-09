import '../../../../core/networking/api_result.dart';
import '../../../../core/singletons/account.dart';

abstract class AccountsRepo {
  Future<ApiResult<List<Account>>> get();

  Future<ApiResult<List<Account>>> edit({
    required List<Account> accounts,
  });
}
