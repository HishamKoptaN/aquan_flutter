import '../../../../core/networking/api_result.dart';
import '../../data/model/received_account_number_res_model.dart';
import '../repo_impl/buy_sell_repo_impl.dart';

class GetReceiveAccountNumberUseCase {
  final BuySellRepoImpl buySellRepoImp;
  GetReceiveAccountNumberUseCase({
    required this.buySellRepoImp,
  });
  Future<ApiResult<ReceivedAccountNumberResModel>> getReceiveAccountNumber({
    required int? id,
  }) async {
    return await buySellRepoImp.getReceiveAccountNumber(
      id: id,
    );
  }
}
