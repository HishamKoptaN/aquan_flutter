import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'msg.freezed.dart';
part 'msg.g.dart';

// لتحويل JSON إلى نموذج Msg
Msg msgFromJson(String str) => Msg.fromJson(json.decode(str));
// لتحويل نموذج Msg إلى JSON
String msgToJson(Msg data) => json.encode(data.toJson());

@freezed
class Msg with _$Msg {
  // النموذج المسؤول عن استقبال البيانات
  const factory Msg({
    @JsonKey(name: "content") String? content,
    @JsonKey(name: "sender_id") int? senderId,
    @JsonKey(name: "is_file") bool? isFile,
    @JsonKey(name: "sent_at") DateTime? sentAt,
    @JsonKey(name: "read_at", fromJson: _timestampToDateTime)
    DateTime? readAt, // معالجة Timestamp
  }) = _Msg;

  factory Msg.fromJson(Map<String, dynamic> json) => _$MsgFromJson(json);
}

// تحويل Timestamp إلى DateTime
DateTime? _timestampToDateTime(dynamic value) {
  if (value is Timestamp) {
    return value.toDate(); // تحويل من Timestamp إلى DateTime
  }
  return null;
}
