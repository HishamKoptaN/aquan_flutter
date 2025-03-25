import 'package:aquan/core/networking/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../data/model/withdraw_req_body_model.dart';
import '../../data/repo/withdraws_repo.dart';

@LazySingleton()
class AddWithdrawUseCase {
  final WithdrawsRepo withdrawsRepo;
  AddWithdrawUseCase({
    required this.withdrawsRepo,
  });
  Future<ApiResult<void>> addWithdraw({
    required WithdrawReqBodyModel withdrawReqBodyModel,
  }) async {
    return await withdrawsRepo.addWithdraw(
      withdrawReqBodyModel: withdrawReqBodyModel,
    );
  }
}
