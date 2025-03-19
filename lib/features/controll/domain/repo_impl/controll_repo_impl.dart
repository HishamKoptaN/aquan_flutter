import 'package:injectable/injectable.dart';

import '../../../../core/errors/api_error_handler.dart';
import '../../../../core/models/section_res_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/data_sources/controll_api.dart';
import '../../data/model/section_model.dart';
import '../../data/repo/controll_repo.dart';

@Injectable(
  as: ControllRepo,
)
class ControllRepoImpl implements ControllRepo {
  final ControllApi supportApi;
  ControllRepoImpl(
    this.supportApi,
  );
  @override
  Future<ApiResult<List<SectionModel>?>> get() async {
    try {
      final response = await supportApi.get();
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
