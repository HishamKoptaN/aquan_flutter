import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/networking/api_result.dart';
import '../repo_impl/buy_sell_repo_impl.dart';
@LazySingleton()
class TransferMoneyUseCase {
  final BuySellRepoImpl buySellRepoImp;
  TransferMoneyUseCase({
    required this.buySellRepoImp,
  });
  Future<ApiResult<void>> transferMoney({
    required FormData formData,
  }) async {
    return await buySellRepoImp.transferMoney(
      formData: formData,
    );
  }
}
