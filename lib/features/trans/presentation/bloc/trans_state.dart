import 'package:aquan/core/errors/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'trans_state.freezed.dart';

@freezed
class TransState with _$TransState {
  const factory TransState.initial() = _Initial;
  const factory TransState.loading() = _Loading;
  const factory TransState.dataLoaded() = _DataLoaded;
  const factory TransState.success() = _Success;
  const factory TransState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
