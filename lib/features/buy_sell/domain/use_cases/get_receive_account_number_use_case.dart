import 'package:aquan/all_imports.dart';

import '../../../../core/networking/api_result.dart';
import '../repo_impl/buy_sell_repo_impl.dart';

class GetReceiveAccountNumberUseCase {
  final BuySellRepoImpl buySellRepoImp;
  GetReceiveAccountNumberUseCase({
    required this.buySellRepoImp,
  });
  Future<ApiResult<Account>> getReceiveAccountNumber({
    required int? id,
  }) async {
    return await buySellRepoImp.getReceiveAccountNumber(
      id: id,
    );
  }
}
