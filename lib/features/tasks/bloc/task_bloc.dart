import 'dart:io';
import 'package:aquan/features/tasks/controller/tasks_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/get_tasks_model.dart';
import '../model/task_details_model.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TasksController _controller = TasksController();

  TaskBloc() : super(TaskInitial()) {
    on<GetTasks>(
      (event, emit) async {
        emit(TaskLoading());
        Map<String, dynamic> data = await _controller.getTasks();
        GetTasksApiResModel getTasksApiResModel =
            GetTasksApiResModel.fromJson(data);
        try {
          emit(
            TasksLoadedSuccessfully(
              getTasksApiResModel: getTasksApiResModel,
            ),
          );
        } catch (e) {
          emit(
            TaskError(
              message: e.toString(),
            ),
          );
        }
      },
    );

    on<GetTaskDetails>(
      (event, emit) async {
        emit(TaskLoading());
        try {
          Map<String, dynamic> data =
              await _controller.getTaskDetails(event.id);
          GetTaskDetailsApiResModel getTaskDetailsApiResModel =
              GetTaskDetailsApiResModel.fromJson(data);
          emit(
            TaskDetailsLoadedSuccessfully(
              getTaskDetailsApiResModel: getTaskDetailsApiResModel,
            ),
          );
        } catch (e) {
          emit(
            TaskError(
              message: e.toString(),
            ),
          );
        }
      },
    );

    on<SendProof>(
      (event, emit) async {
        emit(TaskLoading());
        Map<String, dynamic> data = await _controller.sendProof(
          event.taskId,
          event.image,
        );

        if (data['status']) {
          emit(
            ApproveSendSuccessfully(),
          );
        } else if (!data['status']) {
          emit(
            SendApproveFailure(),
          );
        }
      },
    );
  }
}
