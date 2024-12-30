import '../../../../../core/networking/api_result.dart';
import '../model/username_by_account_res_model.dart';
import '../model/transfer_req_body.dart';

abstract class SendToAccountRepo {
  Future<ApiResult<UsernameByAccountResModel>> get({
    required String accountNumber,
  });
  Future<ApiResult<void>> send({
    required TransferReqBody transferReqBody,
  });
}
