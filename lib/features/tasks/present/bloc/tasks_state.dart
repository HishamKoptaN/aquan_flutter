import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
part 'tasks_state.freezed.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState.initial() = _Initial;
  const factory TasksState.loaded() = _Loaded;
  const factory TasksState.taskDetailsloaded() = _TaskDetailsloaded;
  const factory TasksState.loading() = _Loading;
  const factory TasksState.success() = _Success;
  const factory TasksState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
