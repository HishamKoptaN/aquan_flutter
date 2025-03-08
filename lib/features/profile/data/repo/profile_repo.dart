import 'package:dio/dio.dart';

import '../../../../core/models/user.dart';
import '../../../../core/networking/api_result.dart';

abstract class ProfileRepo {
  Future<ApiResult<UserModel>> editProfile({
    required FormData formData,
  });
}
