import 'package:aquan/features/deposit/data/model/employee_account_res_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/data_sources/deposit_api.dart';
import '../../data/model/deposits_res_model.dart';
import '../../data/repo/deposit_repo.dart';

class DepositRepoImpl implements DepositRepo {
  final DepositApi depsoitApi;
  DepositRepoImpl({
    required this.depsoitApi,
  });

  @override
  Future<ApiResult<DepositsResModel>> get() async {
    try {
      final response = await depsoitApi.get();
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<EmployeeAccountResModel>> getEmployeeAccount() async {
    try {
      final response = await depsoitApi.getEmployeeAccount();
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<void>> deposit({
    required FormData formData,
  }) async {
    try {
      await depsoitApi.get();
      return const ApiResult.success(
        data: null,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }
}
