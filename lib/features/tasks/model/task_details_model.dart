import 'dart:convert';

GetTaskDetailsApiResModel getTaskDetailsApiResModelFromJson(String str) =>
    GetTaskDetailsApiResModel.fromJson(json.decode(str));
String getTaskDetailsApiResModelToJson(GetTaskDetailsApiResModel data) =>
    json.encode(data.toJson());

class GetTaskDetailsApiResModel {
  bool status;
  Task task;
  bool completed;

  GetTaskDetailsApiResModel({
    required this.status,
    required this.task,
    required this.completed,
  });

  factory GetTaskDetailsApiResModel.fromJson(Map<String, dynamic> json) =>
      GetTaskDetailsApiResModel(
        status: json["status"],
        task: Task.fromJson(json["task"]),
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "task": task.toJson(),
        "completed": completed,
      };
}

class Task {
  int id;
  String status;
  String name;
  String description;
  String link;
  String image;
  String createdAt;
  String updatedAt;

  Task({
    required this.id,
    required this.status,
    required this.name,
    required this.description,
    required this.link,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        status: json["status"],
        name: json["name"],
        description: json["description"],
        link: json["link"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "name": name,
        "description": description,
        "link": link,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
