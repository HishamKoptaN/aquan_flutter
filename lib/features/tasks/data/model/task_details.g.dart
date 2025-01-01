// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskDetailsImpl _$$TaskDetailsImplFromJson(Map<String, dynamic> json) =>
    _$TaskDetailsImpl(
      task: json['task'] == null
          ? null
          : Task.fromJson(json['task'] as Map<String, dynamic>),
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$$TaskDetailsImplToJson(_$TaskDetailsImpl instance) =>
    <String, dynamic>{
      'task': instance.task,
      'completed': instance.completed,
    };
