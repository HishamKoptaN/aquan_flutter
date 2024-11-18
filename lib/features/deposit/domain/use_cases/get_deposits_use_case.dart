import 'package:aquan/core/networking/api_result.dart';
import '../../data/model/deposits_res_model.dart';
import '../repo_imp/deposit_repo_impl.dart';

class GetDepositstUseCase {
  final DepositRepoImpl depositRepoImpl;
  GetDepositstUseCase({
    required this.depositRepoImpl,
  });
  Future<ApiResult<DepositsResModel>> get() async {
    return await depositRepoImpl.get();
  }
}
