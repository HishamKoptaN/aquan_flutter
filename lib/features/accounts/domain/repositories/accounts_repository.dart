import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/accounts_model.dart';

abstract class AccountsRepository {
  Future<Either<Failure, List<Account>>> getAccounts();
  Future<Either<Failure, List<Account>>> updateAccounts({
    required List<Account> accountsInfo,
  });
}
