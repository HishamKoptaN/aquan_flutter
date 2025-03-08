import 'package:dio/dio.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/models/user.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/data_sources/profile_api.dart';
import '../../data/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileApi profileApi;
  ProfileRepoImpl(
    this.profileApi,
  );
  @override
  Future<ApiResult<UserModel>> editProfile({
    required FormData formData,
  }) async {
    try {
      final response = await profileApi.editProfile(
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
