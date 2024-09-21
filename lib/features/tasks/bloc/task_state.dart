part of 'task_bloc.dart';

abstract class TaskState {}

final class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskError extends TaskState {
  final String message;

  TaskError({required this.message});
}

class TasksLoadedSuccessfully extends TaskState {
  GetTasksApiResModel getTasksApiResModel;

  TasksLoadedSuccessfully({required this.getTasksApiResModel});
}

class TasksLoadedFailure extends TaskState {}

class TaskDetailsLoadedSuccessfully extends TaskState {
  GetTaskDetailsApiResModel getTaskDetailsApiResModel;

  TaskDetailsLoadedSuccessfully({
    required this.getTaskDetailsApiResModel,
  });
}

class ApproveSendSuccessfully extends TaskState {}

class SendApproveFailure extends TaskState {}

// class TaskDone extends TaskState {
//   final Task task;
//   bool completed = false;
//   final String? error;
//   final String? message;

//   TaskDone({
//     required this.task,
//     required this.completed,
//     this.error,
//     this.message,
//   });
// }
