// To parse this JSON data, do
//
//     final taskDetails = taskDetailsFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
import 'task.dart';
part 'task_details.freezed.dart';
part 'task_details.g.dart';

TaskDetails taskDetailsFromJson(String str) =>
    TaskDetails.fromJson(json.decode(str));

String taskDetailsToJson(TaskDetails data) => json.encode(data.toJson());

@freezed
class TaskDetails with _$TaskDetails {
  const factory TaskDetails({
    @JsonKey(name: "task") Task? task,
    @JsonKey(name: "completed") bool? completed,
  }) = _TaskDetails;

  factory TaskDetails.fromJson(Map<String, dynamic> json) =>
      _$TaskDetailsFromJson(json);
}
