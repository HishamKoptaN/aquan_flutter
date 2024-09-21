import 'dart:convert';

GetTasksApiResModel getTasksApiResModelFromJson(String str) =>
    GetTasksApiResModel.fromJson(json.decode(str));

String getTasksApiResModelToJson(GetTasksApiResModel data) =>
    json.encode(data.toJson());

class GetTasksApiResModel {
  bool status;
  List<Task> tasks;

  GetTasksApiResModel({
    required this.status,
    required this.tasks,
  });

  factory GetTasksApiResModel.fromJson(Map<String, dynamic> json) =>
      GetTasksApiResModel(
        status: json["status"],
        tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
      };
}

class Task {
  int id;
  String status;
  String name;
  String description;
  int amount;
  String link;
  String image;
  String createdAt;
  String updatedAt;

  Task({
    required this.id,
    required this.status,
    required this.name,
    required this.description,
    required this.amount,
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
        amount: json["amount"],
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
        "amount": amount,
        "link": link,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
