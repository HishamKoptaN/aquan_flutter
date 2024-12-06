import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/api_error_model.dart';
import '../../data/model/withdraw_rates_res_model.dart';
import '../../data/model/withdraws_res_model.dart';
part 'withdraws_state.freezed.dart';

@freezed
class WithdrawsState with _$WithdrawsState {
  const factory WithdrawsState.initial() = _Initial;
  const factory WithdrawsState.loading() = _Loading;
  const factory WithdrawsState.success() = _Success;
  const factory WithdrawsState.withdrawsLoaded({
    required List<Withdraw>? withdraws,
  }) = _WithdrawsLoaded;
  const factory WithdrawsState.withdrawRatesLoaded({
    required WithdrawRatesResModel withdrawRatesResModel,
  }) = _WithdrawRatesLoaded;
  const factory WithdrawsState.amountSentSuccessfully() =
      AmountSentSuccessfully;
  const factory WithdrawsState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
