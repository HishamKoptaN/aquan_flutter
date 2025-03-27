import 'package:aquan/features/plans/data/model/plan_rate.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/datasources/send_to_account_api.dart';
import '../../data/model/username_by_account_res_model.dart';
import '../../data/model/transfer_req_body.dart';
import '../../data/repo/send_to_account_repo.dart';

@Injectable(
  as: SendToAccountRepo,
)
class SendToAccountRepoImpl implements SendToAccountRepo {
  final SendToAccountApi sendToAccountApi;
  SendToAccountRepoImpl({
    required this.sendToAccountApi,
  });

  @override
  Future<ApiResult<UsernameByAccountResModel?>> get({
    required String? accountNumber,
  }) async {
    try {
      final response = await sendToAccountApi.get(
        accountNumber: accountNumber ?? '',
      );
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<PlanRate?>> send({
    required TransferReqBody? transferReqBody,
  }) async {
    try {
      await sendToAccountApi.send(
        transferReqBody: transferReqBody,
      );
      return const ApiResult.success(
        data: null,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }
}
