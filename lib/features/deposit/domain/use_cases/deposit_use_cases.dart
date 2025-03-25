import 'package:aquan/core/networking/api_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../data/model/deposits_res_model.dart';
import '../../data/model/employee_account_res_model.dart';
import '../../data/repo/deposits_repo.dart';

@LazySingleton()
class DepositUseCases {
  final DepositsRepo depositRepo;
  DepositUseCases({
    required this.depositRepo,
  });
  Future<ApiResult<DepositsResModel>> get() async {
    return await depositRepo.get();
  }

  Future<ApiResult<EmployeeAccountResModel>> getEmployeeAccount() async {
    return await depositRepo.getEmployeeAccount();
  }

  Future<ApiResult<void>> deposit({
    required FormData formData,
  }) async {
    return await depositRepo.deposit(
      formData: formData,
    );
  }
}
