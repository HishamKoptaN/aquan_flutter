import '../../../../../core/networking/api_result.dart';
import '../model/trans_model.dart';

abstract class TransRepo {
  Future<ApiResult<List<Trans>>> get();
}
