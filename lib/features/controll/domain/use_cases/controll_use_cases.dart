import 'package:injectable/injectable.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/model/section_model.dart';
import '../../data/repo/controll_repo.dart';

@LazySingleton()
class ControllUseCases {
  final ControllRepo controllRepo;
  ControllUseCases({
    required this.controllRepo,
  });
  Future<ApiResult<List<SectionModel>?>> get() async {
    return await controllRepo.get();
  }
}
