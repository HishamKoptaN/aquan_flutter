import 'package:dio/dio.dart';

import '../../../../core/networking/api_result.dart';
import '../model/deposits_res_model.dart';
import '../model/employee_account_res_model.dart';

abstract class DepositsRepo {
  Future<ApiResult<DepositsResModel>> get();
  Future<ApiResult<EmployeeAccountResModel>> getEmployeeAccount();
  Future<ApiResult<void>> deposit({
    required FormData formData,
  });
}
