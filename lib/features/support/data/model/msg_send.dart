import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'msg_send.freezed.dart';
part 'msg_send.g.dart';

MsgSend msgSendFromJson(String str) => MsgSend.fromJson(json.decode(str));
String msgSendToJson(MsgSend data) => json.encode(data.toJson());

@freezed
class MsgSend with _$MsgSend {
  const factory MsgSend({
    @JsonKey(name: "content") String? content,
    @JsonKey(name: "sender_id") int? senderId,
    @JsonKey(name: "is_file") bool? isFile,
    @JsonKey(name: "sent_at") DateTime? sentAt,
    @JsonKey(name: "read_at") DateTime? readAt, // هنا نتركه null عند الإرسال
  }) = _MsgSend;

  factory MsgSend.fromJson(Map<String, dynamic> json) =>
      _$MsgSendFromJson(json);
}
