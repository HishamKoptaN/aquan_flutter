import 'package:aquan/core/networking/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../data/model/transfer_req_body.dart';
import '../../data/model/username_by_account_res_model.dart';
import '../../data/repo/send_to_account_repo.dart';

@LazySingleton()
class SendToAccountUseCases {
  final SendToAccountRepo sendToAccountRepo;
  SendToAccountUseCases({
    required this.sendToAccountRepo,
  });
  Future<ApiResult<UsernameByAccountResModel?>> get({
    required String accountNumber,
  }) async {
    return await sendToAccountRepo.get(
      accountNumber: accountNumber,
    );
  }

  Future<ApiResult<void>> send({
    required TransferReqBody? transferReqBody,
  }) async {
    return await sendToAccountRepo.send(
      transferReqBody: transferReqBody,
    );
  }
}
