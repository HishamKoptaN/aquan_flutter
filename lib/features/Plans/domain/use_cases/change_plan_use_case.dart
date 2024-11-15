import 'package:aquan/core/networking/api_result.dart';
import 'package:dio/dio.dart';
import '../repo_imp/plans_repo_impl.dart';

class ChangePlanUseCase {
  final PlansRepoImpl plansRepoImp;
  ChangePlanUseCase(
    this.plansRepoImp,
  );
  Future<ApiResult<void>> change({
    required FormData formData,
  }) async {
    return await plansRepoImp.change(
      formData: formData,
    );
  }
}
