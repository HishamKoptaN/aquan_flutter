import 'package:aquan/core/networking/api_result.dart';
import '../../data/model/notifications_res_model.dart';
import '../repo_imp/notifications_repo_impl.dart';

class GetNotificationsUseCase {
  final NotificationsRepoImpl notificationsRepoImp;
  GetNotificationsUseCase({
    required this.notificationsRepoImp,
  });
  Future<ApiResult<List<Notification>>> get() async {
    return await notificationsRepoImp.get();
  }
}
