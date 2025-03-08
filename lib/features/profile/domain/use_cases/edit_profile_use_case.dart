import 'package:dio/dio.dart';

import '../../../../core/models/user.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/repo/profile_repo.dart';

class EditProfileUseCase {
  final ProfileRepo profileRepo;
  EditProfileUseCase({
    required this.profileRepo,
  });
  Future<ApiResult<UserModel>> editProfile({
    required FormData formData,
  }) async {
    return await profileRepo.editProfile(
      formData: formData,
    );
  }
}
