// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      notifiableId: json['notifiable_id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'message': instance.message,
      'notifiable_id': instance.notifiableId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
