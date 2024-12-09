import 'package:aquan/core/networking/api_result.dart';
import 'package:dio/dio.dart';
import '../repo_imp/deposits_repo_impl.dart';

class DepositUseCase {
  final DepositsRepoImpl depositRepoImpl;
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
