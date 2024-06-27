import 'dart:io';

import 'package:aquan/app/tasks/controller/tasks_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TasksController _controller = TasksController();

  TaskBloc() : super(TaskInitial()) {
    on<GetTasks>(
      (event, emit) async {
        emit(TaskLoading());

        List<Task> tasks = await _controller.getTasks();

        try {
          emit(TasksDone(tasks: tasks));
        } catch (e) {
          emit(TaskError(message: e.toString()));
        }
      },
    );

    on<GetTaskDetails>(
      (event, emit) async {
        emit(TaskLoading());

        Map<String, dynamic> data = await _controller.getTaskDetails(event.id);

        try {
          emit(TaskDone(task: data['task'], completed: data['completed']));
        } catch (e) {
          emit(TaskError(message: e.toString()));
        }
      },
    );

    on<SendProof>(
      (event, emit) async {
        emit(TaskLoading());

        Map<String, dynamic> data = await _controller.sendProof(
          event.task.id,
          event.image,
        );

        if (data['status']) {
          emit(TaskDone(
            task: event.task,
            completed: true,
            message: data['message'],
          ));
        } else {
          emit(TaskDone(
            task: event.task,
            completed: false,
            error: data['error'],
          ));
        }
      },
    );
  }
}
