import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/errors/api_error_model.dart';
import '../../data/model/buy_sell_res_model.dart';
import '../../data/model/received_account_number_res_model.dart';
part 'buy_sell_state.freezed.dart';

@freezed
class BuySellState with _$BuySellState {
  const factory BuySellState.initial() = _Initial;
  const factory BuySellState.loading() = _Loading;
  const factory BuySellState.buySellRatesLoaded({
    required BuySellResModel buySellResModel,
  }) = _BuySellRatesLLoaded;
  const factory BuySellState.rceivedAccountNumberLoaded({
    required ReceivedAccountNumberResModel receivedAccountNumberResModel,
  }) = _RceivedAccountNumberLoaded;
  const factory BuySellState.success() = _Success;
  const factory BuySellState.failure({
    required ApiErrorModel apiErrorModel,
  }) = _Failure;
}

// abstract class BuySellState {}

// final class CurrencyInitial extends BuySellState {}

// final class CurrencyLoading extends BuySellState {}

// class CurrenciesLoadedSuccessfully extends BuySellState {
//   GetBuySellApiRes getBuySellApiRes;
//   CurrenciesLoadedSuccessfully({
//     required this.getBuySellApiRes,
//   });
// }

// final class CurrencyError extends BuySellState {
//   final String error;

//   CurrencyError({required this.error});
// }

// class RateCalculated extends BuySellState {}

// class TransferDone extends BuySellState {}

// class UserAccountLoaded extends BuySellState {
//   final String name;

//   UserAccountLoaded({required this.name});
// }

// class ReceivedAccountNumberLoaded extends BuySellState {
//   ReceivedAccountNumberApiRes receivedAccountNumberApiRes;
//   ReceivedAccountNumberLoaded({
//     required this.receivedAccountNumberApiRes,
//   });
// }
