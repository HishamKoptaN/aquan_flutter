import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/notifications_controller.dart';
import '../model/notification_model.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsController _notificationsController =
      NotificationsController();
  final NotificationsController notificationsController;
  NotificationsBloc({required this.notificationsController})
      : super(const NotificationsState.loading()) {
    on<NotificationsEvent>(
      (event, emit) async {
        event.when(
          getNotifications: () async {
            try {
              Map<String, dynamic> data =
                  await _notificationsController.getNotifications();
              GetNotificationsApiResModel notificationApiRes =
                  GetNotificationsApiResModel.fromJson(data);
              if (data["status"]) {
                emit(
                  NotificationsState.loaded(
                    notifications: notificationApiRes.notifications,
                  ),
                );
              } else {
                emit(
                  const NotificationsState.error(
                    error: "Error loading notifications",
                  ),
                );
              }
            } catch (e) {
              emit(
                NotificationsState.error(
                  error: e.toString(),
                ),
              );
            }
          },
        );
      },
    );
  }
}
