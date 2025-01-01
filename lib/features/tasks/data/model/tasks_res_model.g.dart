// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as bool?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      link: json['link'] as String?,
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'name': instance.name,
      'description': instance.description,
      'amount': instance.amount,
      'link': instance.link,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
