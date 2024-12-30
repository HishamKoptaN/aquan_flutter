import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_constants.dart';
import '../model/task.dart';
import '../model/task_details.dart';
part 'tasks_api.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class TasksApi {
  factory TasksApi(
    Dio dio, {
    String baseUrl,
  }) = _TasksApi;
  //! Get
  @GET(
    ApiConstants.tasks,
  )
  Future<List<Task>> get();
  //! getTaskDetails
  @GET(
    '${ApiConstants.tasks}/{taskId}',
  )
  Future<TaskDetails> getTaskDetails({
    @Path('taskId') required int taskId,
  });
  //! proof Task
  @POST(
    ApiConstants.tasks,
  )
  Future<Task> proofTask({
    @Body() required FormData formData,
  });
}
