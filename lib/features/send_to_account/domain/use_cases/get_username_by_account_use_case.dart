import 'package:aquan/core/networking/api_result.dart';
import '../../data/model/username_by_account_res_model.dart';
import '../repo_imp/send_to_account_repo_impl.dart';

class GetNameOfUserByAccountUseCase {
  final SendToAccountRepoImpl sendToAccountRepoImpl;
  GetNameOfUserByAccountUseCase({
    required this.sendToAccountRepoImpl,
  });
  Future<ApiResult<UsernameByAccountResModel>> get({
    required String accountNumber,
  }) async {
    return await sendToAccountRepoImpl.get(
      accountNumber: accountNumber,
    );
  }
}
