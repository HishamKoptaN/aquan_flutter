import 'package:aquan/core/networking/api_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../data/model/deposits_res_model.dart';
import '../../data/model/employee_account_res_model.dart';
import '../repo_imp/deposits_repo_impl.dart';

@LazySingleton()
class DepositUseCases {
  final DepositsRepoImpl depositRepoImpl;
  DepositUseCases({
    required this.depositRepoImpl,
  });
  Future<ApiResult<DepositsResModel>> get() async {
    return await depositRepoImpl.get();
  }

  Future<ApiResult<EmployeeAccountResModel>> getEmployeeAccount() async {
    return await depositRepoImpl.getEmployeeAccount();
  }

  Future<ApiResult<void>> deposit({
    required FormData formData,
  }) async {
    return await depositRepoImpl.deposit(
      formData: formData,
    );
  }
}
