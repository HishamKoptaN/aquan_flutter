// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPlanImpl _$$UserPlanImplFromJson(Map<String, dynamic> json) =>
    _$UserPlanImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      planId: (json['plan_id'] as num?)?.toInt(),
      upgradedAt: json['upgraded_at'] == null
          ? null
          : DateTime.parse(json['upgraded_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserPlanImplToJson(_$UserPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'plan_id': instance.planId,
      'upgraded_at': instance.upgradedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
