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
  final int taskId;
  final File image;
  SendProof({
    required this.taskId,
    required this.image,
  });
}
