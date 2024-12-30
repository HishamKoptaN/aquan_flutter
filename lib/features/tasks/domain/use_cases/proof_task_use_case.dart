import 'package:dio/dio.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/model/task.dart';
import '../../data/repo/tasks_repo.dart';

class ProofTaskUseCase {
  final TasksRepo tasksRepo;
  ProofTaskUseCase({
    required this.tasksRepo,
  });
  Future<ApiResult<Task>> proofTask({
    required FormData formData,
  }) async {
    return await tasksRepo.proofTask(
      formData: formData,
    );
  }
}
