// domain/usecases/update_accounts_usecase.dart
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/accounts_model.dart';
import '../repositories/accounts_repository.dart';

class UpdateAccountsUseCase {
  final AccountsRepository repository;
  UpdateAccountsUseCase({required this.repository});
  Future<Either<Failure, List<Account>>> call({
    required List<Account> accounts,
  }) async {
    return await repository.updateAccounts(
      accountsInfo: accounts,
    );
  }
}
