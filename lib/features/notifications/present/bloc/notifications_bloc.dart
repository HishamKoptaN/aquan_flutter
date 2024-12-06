import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/get_notifications_use_case.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  GetNotificationsUseCase getNotificationsUseCase;
  NotificationsBloc({
    required this.getNotificationsUseCase,
  }) : super(
          const NotificationsState.loading(),
        ) {
    on<NotificationsEvent>(
      (event, emit) async {
        await event.when(
          getNotifications: () async {
            emit(
              const NotificationsState.loading(),
            );
            final result = await getNotificationsUseCase.get();
            await result.when(
              success: (notifications) async {
                emit(
                  NotificationsState.loaded(
                    notifications: notifications!,
                  ),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  NotificationsState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
