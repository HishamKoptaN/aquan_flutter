import 'package:injectable/injectable.dart';

import '../../../../core/models/section_res_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/repo/support_repo.dart';

@LazySingleton()
class SupportUseCases {
  final SupportRepo supportRepo;
  SupportUseCases({
    required this.supportRepo,
  });
  Future<ApiResult<SectionResModel>?> get() async {
    return await supportRepo.get();
  }
}
