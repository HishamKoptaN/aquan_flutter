import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/account.dart';
import '../repositories/accounts_repository.dart';

class GetAccountsUseCase {
  final AccountsRepository repository;
  GetAccountsUseCase({
    required this.repository,
  });
  Future<Either<Failure, List<AccountEntity>>> call() async {
    return await repository.getAccounts();
  }
}
