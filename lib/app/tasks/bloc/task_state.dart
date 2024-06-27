part of 'task_bloc.dart';

abstract class TaskState {}

final class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskError extends TaskState {
  final String message;

  TaskError({required this.message});
}

class TasksDone extends TaskState {
  final List<Task> tasks;

  TasksDone({required this.tasks});
}

class TaskDone extends TaskState {
  final Task task;
  bool completed = false;
  final String? error;
  final String? message;

  TaskDone({
    required this.task,
    required this.completed,
    this.error,
    this.message,
  });
}
