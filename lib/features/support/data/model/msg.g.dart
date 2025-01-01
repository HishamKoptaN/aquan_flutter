// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MsgImpl _$$MsgImplFromJson(Map<String, dynamic> json) => _$MsgImpl(
      content: json['content'] as String?,
      senderId: (json['sender_id'] as num?)?.toInt(),
      isFile: json['is_file'] as bool?,
      sentAt: json['sent_at'] == null
          ? null
          : DateTime.parse(json['sent_at'] as String),
      readAt: _timestampToDateTime(json['read_at']),
    );

Map<String, dynamic> _$$MsgImplToJson(_$MsgImpl instance) => <String, dynamic>{
      'content': instance.content,
      'sender_id': instance.senderId,
      'is_file': instance.isFile,
      'sent_at': instance.sentAt?.toIso8601String(),
      'read_at': instance.readAt?.toIso8601String(),
    };
