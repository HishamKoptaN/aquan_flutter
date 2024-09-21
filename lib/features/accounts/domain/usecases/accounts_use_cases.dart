import '../../data/models/accounts_model.dart';
import '../repositories/accounts_repository.dart';

class GetAccountsUseCase {
  final AccountsRepository repository;

  GetAccountsUseCase(this.repository);

  Future<GetUserAccounts> call() async {
    return await repository.getAccounts();
  }
}

class UpdateAccountsUseCase {
  final AccountsRepository repository;
  UpdateAccountsUseCase(this.repository);
  Future<void> call(GetUserAccounts getUserAccounts) async {
    return await repository.updateAccounts(getUserAccounts);
  }
}
