import '../../features/accounts/domain/entities/account.dart';

class AccountsParams {
  final List<AccountEntity> accounts;

  AccountsParams({required this.accounts});
}

class UserParams {
  final String id;
  UserParams({required this.id});
}
