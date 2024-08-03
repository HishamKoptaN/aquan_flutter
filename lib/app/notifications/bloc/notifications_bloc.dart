import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../controller/notifications_controller.dart';
import '../model/notification_model.dart';
import 'notifications_state.dart';

part 'notifications_event.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsController _notificationsController =
      NotificationsController();

  NotificationsBloc() : super(NotificationsInitial()) {
    on<GetNotifications>(
      (event, emit) async {
        emit(NotificationsLoading());
        try {
          Map<String, dynamic> data =
              await _notificationsController.getNotifications();
          GetNotificationsApiResModel notificationApiRes =
              GetNotificationsApiResModel.fromJson(data);
          if (data["status"]) {
            emit(NotificationsLoadedSuccess(
                notifications: notificationApiRes.notifications!));
          } else {
            emit(
              NotificationsError(
                message: "Error loading notifications",
              ),
            );
          }
        } catch (e) {
          emit(
            NotificationsError(
              message: e.toString(),
            ),
          );
        }
      },
    );
  }
}
