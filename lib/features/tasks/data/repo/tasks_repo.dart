import 'package:aquan/features/tasks/data/model/task_details.dart';

import '../../../../core/networking/api_result.dart';
import '../model/task.dart';
import 'package:dio/dio.dart';

abstract class TasksRepo {
  Future<ApiResult<List<Task>>> get();
  Future<ApiResult<TaskDetails>> getTaskDetails({
    required int taskId,
  });

  Future<ApiResult<Task>> proofTask({
    required FormData formData,
  });
}
