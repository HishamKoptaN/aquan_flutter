// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msg_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MsgSendImpl _$$MsgSendImplFromJson(Map<String, dynamic> json) =>
    _$MsgSendImpl(
      content: json['content'] as String?,
      senderId: (json['sender_id'] as num?)?.toInt(),
      isFile: json['is_file'] as bool?,
      sentAt: json['sent_at'] == null
          ? null
          : DateTime.parse(json['sent_at'] as String),
      readAt: json['read_at'] == null
          ? null
          : DateTime.parse(json['read_at'] as String),
    );

Map<String, dynamic> _$$MsgSendImplToJson(_$MsgSendImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'sender_id': instance.senderId,
      'is_file': instance.isFile,
      'sent_at': instance.sentAt?.toIso8601String(),
      'read_at': instance.readAt?.toIso8601String(),
    };
