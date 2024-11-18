import 'package:aquan/core/networking/api_result.dart';
import 'package:dio/dio.dart';
import '../repo_imp/deposit_repo_impl.dart';

class DepositUseCase {
  final DepositRepoImpl depositRepoImpl;
  DepositUseCase({
    required this.depositRepoImpl,
  });
  Future<ApiResult<void>> deposit({
    required FormData formData,
  }) async {
    return await depositRepoImpl.deposit(
      formData: formData,
    );
  }
}
