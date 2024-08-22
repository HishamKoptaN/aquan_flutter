// To parse this JSON data, do
//
//     final getTasksApiResModel = getTasksApiResModelFromJson(jsonString);

import 'dart:convert';

GetTasksApiResModel getTasksApiResModelFromJson(String str) =>
    GetTasksApiResModel.fromJson(json.decode(str));

String getTasksApiResModelToJson(GetTasksApiResModel data) =>
    json.encode(data.toJson());

class GetTasksApiResModel {
  bool? status;
  List<Task>? tasks;

  GetTasksApiResModel({
    this.status,
    this.tasks,
  });

  factory GetTasksApiResModel.fromJson(Map<String, dynamic> json) =>
      GetTasksApiResModel(
        status: json["status"],
        tasks: json["tasks"] == null
            ? []
            : List<Task>.from(json["tasks"]!.map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "tasks": tasks == null
            ? []
            : List<dynamic>.from(tasks!.map((x) => x.toJson())),
      };
}

GetTaskDetailsApiResModel getTaskDetailsApiResModelFromJson(String str) =>
    GetTaskDetailsApiResModel.fromJson(json.decode(str));

String getTaskDetailsApiResModelToJson(GetTaskDetailsApiResModel data) =>
    json.encode(
      data.toJson(),
    );

class GetTaskDetailsApiResModel {
  bool? status;
  Task? task;
  bool? completed;

  GetTaskDetailsApiResModel({
    this.status,
    this.task,
    this.completed,
  });

  factory GetTaskDetailsApiResModel.fromJson(Map<String, dynamic> json) =>
      GetTaskDetailsApiResModel(
        status: json["status"],
        task: json["task"] == null ? null : Task.fromJson(json["task"]),
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "task": task?.toJson(),
        "completed": completed,
      };
}

class Task {
  int? id;
  String? status;
  String? name;
  String? description;
  int? amount;
  String? link;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? amountFormated;
  String? imageUrl;

  Task({
    this.id,
    this.status,
    this.name,
    this.description,
    this.amount,
    this.link,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.amountFormated,
    this.imageUrl,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        status: json["status"],
        name: json["name"],
        description: json["description"],
        amount: json["amount"],
        link: json["link"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        amountFormated: json["amount_formated"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "name": name,
        "description": description,
        "amount": amount,
        "link": link,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "amount_formated": amountFormated,
        "image_url": imageUrl,
      };
}
