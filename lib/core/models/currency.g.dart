// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyImpl _$$CurrencyImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      status: json['status'] as bool?,
      nameCode: json['name_code'] as String?,
      comment: json['comment'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$CurrencyImplToJson(_$CurrencyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'name_code': instance.nameCode,
      'comment': instance.comment,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
