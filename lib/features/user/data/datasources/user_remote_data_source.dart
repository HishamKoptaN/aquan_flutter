import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/params/accounts_params.dart';
import '../models/user_model.dart';

class UserRemoteDataSource {
  final ApiConsumer api;

  UserRemoteDataSource({required this.api});
  Future<UserModel> getUser(UserParams params) async {
    final response = await api.get("${"EndPoints.user"}/${params.id}");
    return UserModel.fromJson(response);
  }
}
