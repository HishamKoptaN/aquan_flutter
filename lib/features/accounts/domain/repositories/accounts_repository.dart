import '../../data/models/accounts_model.dart';

abstract class AccountsRepository {
  Future<GetUserAccounts> getAccounts();
  Future<void> updateAccounts(GetUserAccounts getUserAccounts);
}
