import 'package:aquan/core/networking/api_result.dart';

import '../../data/model/withdraw_req_body_model.dart';
import '../repo_imp/withdraws_repo_impl.dart';

class AddWithdrawUseCase {
  final WithdrawsRepoImpl withdrawsRepoImpl;
  AddWithdrawUseCase({
    required this.withdrawsRepoImpl,
  });
  Future<ApiResult<void>> addWithdraw({
    required WithdrawReqBodyModel withdrawReqBodyModel,
  }) async {
    return await withdrawsRepoImpl.addWithdraw(
      withdrawReqBodyModel: withdrawReqBodyModel,
    );
  }
}
