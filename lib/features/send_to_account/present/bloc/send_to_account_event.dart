import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/transfer_request_body_model.dart';
part 'send_to_account_event.freezed.dart';

@freezed
abstract class SendToAccountEvent with _$SendToAccountEvent {
  const factory SendToAccountEvent.getNameOfUserByAccount({
    required String accountNumber,
  }) = _GetNameOfUserByAccountEvent;
  const factory SendToAccountEvent.sendPaymentToOtherAccount({
    required TransferRequestBody transferRequestBody,
  }) = _SendPaymentToOtherAccount;
}
