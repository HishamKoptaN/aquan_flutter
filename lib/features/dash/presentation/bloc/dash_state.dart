import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/errors/api_error_model.dart';
part 'dash_state.freezed.dart';

@freezed
class DashState<T> with _$DashState<T> {
  const factory DashState.initial() = _Initial;
  const factory DashState.loading() = _Loading;
  const factory DashState.success() = _Success;
  const factory DashState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
