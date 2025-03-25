import 'package:injectable/injectable.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repo/tasks_repo.dart';
import '../../data/model/task.dart';
@LazySingleton()
class GetTasksUseCase {
  final TasksRepo tasksRepo;
  GetTasksUseCase({
    required this.tasksRepo,
  });
  Future<ApiResult<List<Task>>> get() async {
    return await tasksRepo.get();
  }
}
