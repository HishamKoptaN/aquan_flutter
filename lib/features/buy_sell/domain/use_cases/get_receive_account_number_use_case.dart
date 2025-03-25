import 'package:aquan/all_imports.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/repo/buy_sell_repo.dart';

@LazySingleton()
class GetReceiveAccountNumberUseCase {
  final BuySellRepo buySellRepo;
  GetReceiveAccountNumberUseCase({
    required this.buySellRepo,
  });
  Future<ApiResult<Account>> getReceiveAccountNumber({
    required int? id,
  }) async {
    return await buySellRepo.getReceiveAccountNumber(
      id: id,
    );
  }
}
