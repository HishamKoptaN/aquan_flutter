import 'package:aquan/features/tasks/data/model/task_details.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/repo/tasks_repo.dart';
@LazySingleton()
class GetTaskDetailsUseCase {
  final TasksRepo tasksRepo;
  GetTaskDetailsUseCase({
    required this.tasksRepo,
  });
  Future<ApiResult<TaskDetails>> getTaskDetails({
    required int taskId,
  }) async {
    return await tasksRepo.getTaskDetails(
      taskId: taskId,
    );
  }
}
