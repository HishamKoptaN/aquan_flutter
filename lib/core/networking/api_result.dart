import 'package:freezed_annotation/freezed_annotation.dart';
import '../errors/api_error_model.dart';
part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({
    required T? data,
  }) = Success<T>;
  const factory ApiResult.failure({
    required ApiErrorModel apiErrorModel,
  }) = Failure<T>;
}
