import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/msg_send.dart';
part 'support_event.freezed.dart';

@freezed
class SupportEvent with _$SupportEvent {
   const factory SupportEvent.get() = _Get;
  const factory SupportEvent.getMsgs() = _GetMsgs;
  const factory SupportEvent.sendMsg({
    required MsgSend msgSend,
  }) = _SendMsg;
}
