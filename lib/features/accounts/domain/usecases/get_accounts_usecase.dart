import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/accounts_model.dart';
import '../repositories/accounts_repository.dart';

class GetAccountsUseCase {
  final AccountsRepository repository;
  GetAccountsUseCase({
    required this.repository,
  });
  Future<Either<Failure, List<Account>>> call() async {
    return await repository.getAccounts();
  }
}
