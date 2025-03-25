import 'package:aquan/features/deposit/data/model/employee_account_res_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/data_sources/deposits_api.dart';
import '../../data/model/deposits_res_model.dart';
import '../../data/repo/deposits_repo.dart';

@Injectable(
  as: DepositsRepo,
)
class DepositsRepoImpl implements DepositsRepo {
  final DepositsApi depsoitsApi;
  DepositsRepoImpl({
    required this.depsoitsApi,
  });

  @override
  Future<ApiResult<DepositsResModel>> get() async {
    try {
      final response = await depsoitsApi.get();
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
      final response = await depsoitsApi.getEmployeeAccount();
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
      await depsoitsApi.deposits(
        formData: formData,
      );
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
