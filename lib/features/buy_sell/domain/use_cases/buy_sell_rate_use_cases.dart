import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/models/account.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/model/buy_sell_res_model.dart';
import '../../data/repo/buy_sell_repo.dart';

@LazySingleton()
class BuySellRatesUses {
  final BuySellRepo buySellRepo;
  BuySellRatesUses({
    required this.buySellRepo,
  });
  Future<ApiResult<BuySellResModel>> getBuySellRates() async {
    return await buySellRepo.getBuySellRates();
  }

  Future<ApiResult<Account>> getReceiveAccountNumber({
    required int? id,
  }) async {
    return await buySellRepo.getReceiveAccountNumber(
      id: id,
    );
  }

  Future<ApiResult<void>> transferMoney({
    required FormData formData,
  }) async {
    return await buySellRepo.transferMoney(
      formData: formData,
    );
  }
}
