// domain/usecases/update_accounts_usecase.dart
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/account.dart';
import '../repositories/accounts_repository.dart';

class UpdateAccountsUseCase {
  final AccountsRepository repository;
  UpdateAccountsUseCase({required this.repository});
  Future<Either<Failure, List<AccountEntity>>> call({
    required List<AccountEntity> accounts,
  }) async {
    return await repository.updateAccounts(
      accounts: accounts,
    );
  }
}
