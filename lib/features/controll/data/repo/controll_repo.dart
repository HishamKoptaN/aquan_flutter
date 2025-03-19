import 'package:aquan/core/networking/api_result.dart';
import '../../../../core/models/section_res_model.dart';
import '../model/section_model.dart';

abstract class ControllRepo {
  Future<ApiResult<List<SectionModel>?>> get();
}
