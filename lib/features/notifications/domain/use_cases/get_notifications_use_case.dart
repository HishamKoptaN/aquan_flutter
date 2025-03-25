import 'package:aquan/core/networking/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../data/model/notifications_res_model.dart';
import '../../data/repo/notifications_repo.dart';

@LazySingleton()
class GetNotificationsUseCase {
  final NotificationsRepo notificationsRepo;
  GetNotificationsUseCase({
    required this.notificationsRepo,
  });
  Future<ApiResult<List<Notification>>> get() async {
    return await notificationsRepo.get();
  }
}
