import 'package:aquan/core/networking/api_result.dart';
import '../../data/model/transfer_req_body.dart';
import '../repo_imp/send_to_account_repo_impl.dart';

class SendToAccountUseCase {
  final SendToAccountRepoImpl sendToAccountRepoImpl;
  SendToAccountUseCase({
    required this.sendToAccountRepoImpl,
  });
  Future<ApiResult<void>> send({
    required TransferReqBody transferReqBody,
  }) async {
    return await sendToAccountRepoImpl.send(
      transferReqBody: transferReqBody,
    );
  }
}
