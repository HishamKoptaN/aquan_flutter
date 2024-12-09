import 'package:aquan/core/networking/api_result.dart';
import '../../data/model/deposits_res_model.dart';
import '../repo_imp/deposits_repo_impl.dart';

class GetDepositstUseCase {
  final DepositsRepoImpl depositRepoImpl;
  GetDepositstUseCase({
    required this.depositRepoImpl,
  });
  Future<ApiResult<DepositsResModel>> get() async {
    return await depositRepoImpl.get();
  }
}
