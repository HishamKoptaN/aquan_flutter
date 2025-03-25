import 'package:injectable/injectable.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/data_sources/tasks_api.dart';
import '../../data/model/task_details.dart';
import '../../data/model/task.dart';
import '../../data/repo/tasks_repo.dart';
import 'package:dio/dio.dart';
@Injectable(
  as: TasksRepo,
)
class TasksRepoImpl implements TasksRepo {
  final TasksApi tasksApi;
  TasksRepoImpl(
    this.tasksApi,
  );
  @override
  Future<ApiResult<List<Task>>> get() async {
    try {
      final response = await tasksApi.get();
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<TaskDetails>> getTaskDetails({
    required int taskId,
  }) async {
    try {
      final response = await tasksApi.getTaskDetails(
        taskId: taskId,
      );
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<Task>> proofTask({
    required FormData formData,
  }) async {
    try {
      final response = await tasksApi.proofTask(
        formData: formData,
      );
      return ApiResult.success(
        data: response,
      );
    } catch (error) {
      return ApiResult.failure(
        apiErrorModel: ApiErrorHandler.handle(
          error: error,
        ),
      );
    }
  }
}
