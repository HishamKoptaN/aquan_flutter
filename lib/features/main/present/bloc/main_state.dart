import 'package:aquan/core/errors/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.initial() = _Initial;
  const factory MainState.loading() = _Loading;
  const factory MainState.success() = _Success;
  const factory MainState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
  const factory MainState.logedIn() = _LogedIn;
  const factory MainState.logedOut() = _LogedOut;
  const factory MainState.notVerify() = _NotVerify;
}
