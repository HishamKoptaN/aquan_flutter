import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/withdraw_request_body_model.dart';
part 'withdraws_event.freezed.dart';

@freezed
abstract class WithdrawsEvent with _$WithdrawsEvent {
  const factory WithdrawsEvent.getWithdraws() = _GetWithdraws;
  const factory WithdrawsEvent.getWithdrawRates() = _GetWithdrawRates;
  const factory WithdrawsEvent.addWithdraw({
    required WithdrawRequestBody withdrawRequestBody,
  }) = _AddWithdraw;
}
