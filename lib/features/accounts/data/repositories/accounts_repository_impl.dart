import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/accounts_repository.dart';
import '../datasources/accounts_remote_data_source.dart';
import '../models/accounts_model.dart';

class AccountsRepositoryImpl implements AccountsRepository {
  final AccountsRemoteDataSource remoteDataSource;
  AccountsRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, List<Account>>> getAccounts() async {
    try {
      final accounts = await remoteDataSource.getAccounts();
      return Right(
        accounts,
      );
    } on ServerException catch (e) {
      return Left(
        Failure(
          errMessage: e.errorModel.error!,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Account>>> updateAccounts({
    required List<Account> accountsInfo,
  }) async {
    try {
      final accounts = await remoteDataSource.updateAccounts(
        accountsInfo: accountsInfo,
      );
      return Right(
        accounts,
      );
    } on ServerException catch (e) {
      return Left(
        Failure(
          errMessage: e.errorModel.error!,
        ),
      );
    }
  }
}
