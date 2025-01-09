import 'package:aquan/all_imports.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/errors/api_error_model.dart';
part 'buy_sell_state.freezed.dart';

@freezed
class BuySellState with _$BuySellState {
  const factory BuySellState.initial() = _Initial;
  const factory BuySellState.loading() = _Loading;
  const factory BuySellState.buySellRatesLoaded({
    required BuySellResModel buySellResModel,
  }) = _BuySellRatesLLoaded;
  const factory BuySellState.rceivedAccountNumberLoaded({
    required Account account,
  }) = _RceivedAccountNumberLoaded;
  const factory BuySellState.success() = _Success;
  const factory BuySellState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}
