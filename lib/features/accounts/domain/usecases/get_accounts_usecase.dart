import '../../../../core/networking/api_result.dart';
import '../../../../core/models/account.dart';
import '../repo/accounts_rep.dart';

class GetAccountsUseCase {
  final AccountsRepo acountsRepo;
  GetAccountsUseCase({
    required this.acountsRepo,
  });
  Future<ApiResult<List<Account>>> get() async {
    return await acountsRepo.get();
  }
}
