import 'package:freezed_annotation/freezed_annotation.dart';
import '../model/notification_model.dart';
part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.loading() = _loading;
  const factory NotificationsState.loaded(
      {required List<Notification> notifications}) = _loaded;
  const factory NotificationsState.error({required String error}) = _error;
}
