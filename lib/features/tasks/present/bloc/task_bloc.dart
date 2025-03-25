import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/singletons/task_details_singleton.dart';
import '../../../../core/singletons/tasks_singleton.dart';
import '../../domain/use_cases/get_task_details_use_case.dart';
import 'tasks_event.dart';
import 'tasks_state.dart';

@LazySingleton()
class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TaskUseCases getTaskDetailsUseCase;
  TasksBloc({
    required this.getTaskDetailsUseCase,
  }) : super(
          const TasksState.initial(),
        ) {
    on<TasksEvent>(
      (event, emit) async {
        await event.when(
          get: () async {
            emit(
              const TasksState.loading(),
            );
            final result = await getTaskDetailsUseCase.get();
            await result.when(
              success: (response) async {
                TasksSingleton.instance.tasks = response;
                emit(
                  const TasksState.loaded(),
                );
              },
              failure: (apiErrorModel) async {
                emit(
                  TasksState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          getTaskDetails: (taskId) async {
            emit(
              const TasksState.loading(),
            );
            final result = await getTaskDetailsUseCase.getTaskDetails(
              taskId: taskId,
            );
            await result.when(
              success: (
                response,
              ) async {
                TaskDetailsSingleton.instance.taskDetails = response;
                emit(
                  const TasksState.taskDetailsloaded(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  TasksState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
              },
            );
          },
          proofTask: (formData) async {
            emit(
              const TasksState.loading(),
            );
            final result = await getTaskDetailsUseCase.proofTask(
              formData: formData,
            );
            await result.when(
              success: (
                taskDetails,
              ) async {
                emit(
                  const TasksState.success(),
                );
              },
              failure: (
                apiErrorModel,
              ) async {
                emit(
                  TasksState.failure(
                    apiErrorModel: apiErrorModel,
                  ),
                );
                emit(
                  const TasksState.taskDetailsloaded(),
                );
              },
            );
          },
        );
      },
    );
  }
}
