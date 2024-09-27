import 'package:dartz/dartz.dart';

import '../../../../core/errors/expentions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/account.dart';
import '../../domain/repositories/accounts_repository.dart';
import '../datasources/accounts_remote_data_source.dart';

class AccountsRepositoryImpl implements AccountsRepository {
  final AccountsRemoteDataSource remoteDataSource;
  AccountsRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, List<AccountEntity>>> getAccounts() async {
    try {
      final accounts = await remoteDataSource.getAccounts();
      return Right(
        accounts,
      );
    } on ServerException catch (e) {
      return Left(
        Failure(
          errMessage: e.errorModel.errorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<AccountEntity>>> updateAccounts({
    required List<AccountEntity> accounts,
  }) async {
    try {
      final accounts = await remoteDataSource.getAccounts();
      return Right(
        accounts,
      );
    } on ServerException catch (e) {
      return Left(
        Failure(
          errMessage: e.errorModel.errorMessage,
        ),
      );
    }
  }
}
