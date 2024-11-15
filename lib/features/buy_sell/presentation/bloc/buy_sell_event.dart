import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'buy_sell_event.freezed.dart';

@freezed
class BuySellEvent with _$BuySellEvent {
  const factory BuySellEvent.getBuySelRates() = _GetBuySelRates;
  const factory BuySellEvent.getReceivedAccountNumber({
    required int? id,
  }) = _GetReceivedAccountNumber;
  const factory BuySellEvent.transferMoney({
    required FormData formData,
  }) = _TransferMoney;
}
