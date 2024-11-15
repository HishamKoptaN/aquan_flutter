import '../../../../core/networking/api_result.dart';
import '../../data/model/buy_sell_model.dart';
import '../repo_impl/buy_sell_repo_impl.dart';

class GetBuySellRatesUse {
  final BuySellRepoImpl buySellRepoImp;
  GetBuySellRatesUse({
    required this.buySellRepoImp,
  });
  Future<ApiResult<BuySellResModel>> getBuySellRates() async {
    return await buySellRepoImp.getBuySellRates();
  }
}
