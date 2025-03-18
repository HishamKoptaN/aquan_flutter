// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SectionResModelImpl _$$SectionResModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SectionResModelImpl(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as bool?,
      message: json['message'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$SectionResModelImplToJson(
        _$SectionResModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'message': instance.message,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
