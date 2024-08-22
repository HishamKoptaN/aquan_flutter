part of 'task_bloc.dart';

abstract class TaskEvent {}

class GetTasks extends TaskEvent {}

class GetTaskDetails extends TaskEvent {
  final int id;

  GetTaskDetails({required this.id});
}
//class GetTaskDetails extends TaskEvent {
//   final int id;

//   GetTaskDetails({required this.id});
// }

class SendProof extends TaskEvent {
  final File image;
  final Task task;

  SendProof(this.task, {required this.image});
}
