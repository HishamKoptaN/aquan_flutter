import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../data/model/notifications_res_model.dart';
part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.loading() = _loading;
  const factory NotificationsState.loaded({
    required List<Notification> notifications,
  }) = _loaded;
  const factory NotificationsState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
