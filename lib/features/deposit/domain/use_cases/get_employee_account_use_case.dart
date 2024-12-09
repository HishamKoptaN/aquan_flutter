import 'package:aquan/core/networking/api_result.dart';
import '../../data/model/employee_account_res_model.dart';
import '../repo_imp/deposits_repo_impl.dart';

class GetEmployeeAccountUseCase {
  final DepositsRepoImpl depositRepoImpl;
  GetEmployeeAccountUseCase({
    required this.depositRepoImpl,
  });
  Future<ApiResult<EmployeeAccountResModel>> getEmployeeAccount() async {
    return await depositRepoImpl.getEmployeeAccount();
  }
}
