import 'package:aquan/core/networking/api_result.dart';

import '../../data/model/withdraw_request_body_model.dart';
import '../repo_imp/withdraws_repo_impl.dart';

class AddWithdrawUseCase {
  final WithdrawsRepoImpl withdrawsRepoImpl;
  AddWithdrawUseCase({
    required this.withdrawsRepoImpl,
  });
  Future<ApiResult<void>> addWithdraw({
    required WithdrawRequestBody withdrawRequestBody,
  }) async {
    return await withdrawsRepoImpl.addWithdraw(
      withdrawRequestBody: withdrawRequestBody,
    );
  }
}
