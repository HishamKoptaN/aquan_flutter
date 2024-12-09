import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
part 'accounts_state.freezed.dart';

@freezed
class AccountsState with _$AccountsState {
  const factory AccountsState.initial() = _Initial;
  const factory AccountsState.loaded() = _AccountsLoaded;
  const factory AccountsState.loading() = _Loading;
  const factory AccountsState.success() = _Success;
  const factory AccountsState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
