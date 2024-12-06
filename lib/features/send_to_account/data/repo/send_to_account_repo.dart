import '../../../../../core/networking/api_result.dart';
import '../model/username_by_account_res_model.dart';
import '../model/transfer_request_body_model.dart';

abstract class SendToAccountRepo {
  Future<ApiResult<UsernameByAccountResModel>> get({
    required String accountNumber,
  });
  Future<ApiResult<void>> send({
    required TransferRequestBody transferRequestBody,
  });
}
