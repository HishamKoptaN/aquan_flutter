import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
part 'tasks_event.freezed.dart';

@freezed
class TasksEvent with _$TasksEvent {
  const factory TasksEvent.get() = _Get;
  const factory TasksEvent.getTaskDetails({
    required int taskId,
  }) = _GetTaskDetails;
  const factory TasksEvent.proofTask({
    required FormData formData,
  }) = _ProofTask;
}
