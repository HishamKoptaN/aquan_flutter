import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/account.dart';

abstract class AccountsRepository {
  Future<Either<Failure, List<AccountEntity>>> getAccounts();
  Future<Either<Failure, List<AccountEntity>>> updateAccounts({
    required List<AccountEntity> accounts,
  });
}
