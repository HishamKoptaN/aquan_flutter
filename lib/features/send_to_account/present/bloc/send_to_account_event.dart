import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/transfer_req_body.dart';
part 'send_to_account_event.freezed.dart';

@freezed
abstract class SendToAccountEvent with _$SendToAccountEvent {
  const factory SendToAccountEvent.getNameOfUserByAccount({
    required String accountNumber,
  }) = _GetNameOfUserByAccountEvent;
  const factory SendToAccountEvent.sendPaymentToOtherAccount({
    required TransferReqBody transferReqBody,
  }) = _SendPaymentToOtherAccount;
}
