import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/singletons/task_details_singleton.dart';
import '../../../../core/singletons/tasks_singleton.dart';
import '../../domain/use_cases/get_task_details_use_case.dart';
import '../../domain/use_cases/get_tasks_use_case.dart';
import '../../domain/use_cases/proof_task_use_case.dart';
import 'tasks_event.dart';
import 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final GetTasksUseCase getTasksUseCase;
  final GetTaskDetailsUseCase getTaskDetailsUseCase;
  final ProofTaskUseCase proofTaskUseCase;
  TasksBloc({
    required this.getTasksUseCase,
    required this.getTaskDetailsUseCase,
    required this.proofTaskUseCase,
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
            final result = await getTasksUseCase.get();
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
            final result = await proofTaskUseCase.proofTask(
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
