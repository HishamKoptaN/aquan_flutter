import 'package:aquan/features/tasks/data/model/task_details.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/model/task.dart';
import '../../data/repo/tasks_repo.dart';

@LazySingleton()
class TaskUseCases {
  final TasksRepo tasksRepo;
  TaskUseCases({
    required this.tasksRepo,
  });
  Future<ApiResult<Task>> proofTask({
    required FormData formData,
  }) async {
    return await tasksRepo.proofTask(
      formData: formData,
    );
  }

  Future<ApiResult<List<Task>>> get() async {
    return await tasksRepo.get();
  }

  Future<ApiResult<TaskDetails>> getTaskDetails({
    required int taskId,
  }) async {
    return await tasksRepo.getTaskDetails(
      taskId: taskId,
    );
  }
}
