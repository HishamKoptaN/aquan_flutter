import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/msg_send.dart';
part 'support_event.freezed.dart';

@freezed
class SupportEvent with _$SupportEvent {
  const factory SupportEvent.getMsgs({
    required int chatId,
  }) = _GetMsgs;
  const factory SupportEvent.sendMsg({
    required int chatId,
    required MsgSend msgSend,
  }) = _SendMsg;
}
