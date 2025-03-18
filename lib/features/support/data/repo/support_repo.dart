import 'package:aquan/core/networking/api_result.dart';

import '../../../../core/models/section_res_model.dart';

abstract class SupportRepo {
  Future<ApiResult<SectionResModel>?> get();
}
