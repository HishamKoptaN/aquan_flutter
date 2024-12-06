import '../../../../core/networking/api_result.dart';
import '../model/notifications_res_model.dart';

abstract class NotificationsRepo {
  Future<ApiResult<List<Notification>>> get();
}
