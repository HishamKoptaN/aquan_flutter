// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
part 'tasks_res_model.freezed.dart';
part 'tasks_res_model.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "amount") int? amount,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
