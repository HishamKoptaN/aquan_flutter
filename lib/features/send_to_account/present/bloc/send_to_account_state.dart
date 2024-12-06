import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../data/model/username_by_account_res_model.dart';
part 'send_to_account_state.freezed.dart';

@freezed
class SendToAccountState with _$SendToAccountState {
  const factory SendToAccountState.loading() = Loading;
  const factory SendToAccountState.initial() = Initial;
  const factory SendToAccountState.amountSentSuccessfully() =
      AmountSentSuccessfully;
  const factory SendToAccountState.userNameLoaded({
    required UsernameByAccountResModel usernameByAccountResModel,
  }) = UserNameLoaded;
  const factory SendToAccountState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
