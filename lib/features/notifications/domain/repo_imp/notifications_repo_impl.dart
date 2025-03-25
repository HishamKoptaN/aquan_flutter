import 'package:injectable/injectable.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/datasources/notifications_api.dart';
import '../../data/model/notifications_res_model.dart';
import '../../data/repo/notifications_repo.dart';
@Injectable(
  as: NotificationsRepo,
)
class NotificationsRepoImpl implements NotificationsRepo {
  final NotificationsApi notificationsApi;
  NotificationsRepoImpl(
    this.notificationsApi,
  );

  @override
  Future<ApiResult<List<Notification>>> get() async {
    try {
      final response = await notificationsApi.get();
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
}
