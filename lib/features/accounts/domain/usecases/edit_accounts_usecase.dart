import '../../../../core/networking/api_result.dart';
import '../../../../core/models/account.dart';
import '../repo/accounts_rep.dart';

class EditAccountUseCase {
  final AccountsRepo acountsRepo;
  EditAccountUseCase({
    required this.acountsRepo,
  });
  Future<ApiResult<List<Account>>> edit({
    required List<Account> accounts,
  }) async {
    return await acountsRepo.edit(
      accounts: accounts,
    );
  }
}
