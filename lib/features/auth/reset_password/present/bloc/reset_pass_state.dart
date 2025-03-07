import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/errors/api_error_model.dart';
part 'reset_pass_state.freezed.dart';

@freezed
class ResetPassState<T> with _$ResetPassState<T> {
  const factory ResetPassState.initial() = _Initial;
  const factory ResetPassState.loading() = _Loading;
  const factory ResetPassState.success() = _Success;
  const factory ResetPassState.codeSent() = _CodeSent;
  const factory ResetPassState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
