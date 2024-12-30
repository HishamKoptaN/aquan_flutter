import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loaded() = _Loaded;
  const factory ProfileState.taskDetailsloaded() = _TaskDetailsloaded;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.success() = _Success;
  const factory ProfileState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
