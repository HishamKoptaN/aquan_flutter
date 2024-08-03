// To parse this JSON data, do
//
//     final getNotificationsApiResModel = getNotificationsApiResModelFromJson(jsonString);

import 'dart:convert';

GetNotificationsApiResModel getNotificationsApiResModelFromJson(String str) =>
    GetNotificationsApiResModel.fromJson(json.decode(str));

String getNotificationsApiResModelToJson(GetNotificationsApiResModel data) =>
    json.encode(data.toJson());

class GetNotificationsApiResModel {
  bool? status;
  List<Notification>? notifications;

  GetNotificationsApiResModel({
    this.status,
    this.notifications,
  });

  factory GetNotificationsApiResModel.fromJson(Map<String, dynamic> json) =>
      GetNotificationsApiResModel(
        status: json["status"],
        notifications: json["notifications"] == null
            ? []
            : List<Notification>.from(
                json["notifications"]!.map((x) => Notification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "notifications": notifications == null
            ? []
            : List<dynamic>.from(notifications!.map((x) => x.toJson())),
      };
}

class Notification {
  int? id;
  String? type;
  String? data;
  String? notifiableId;
  String? createdAt;
  String? updatedAt;

  Notification({
    this.id,
    this.type,
    this.data,
    this.notifiableId,
    this.createdAt,
    this.updatedAt,
  });
  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"] is int
            ? json["id"]
            : int.tryParse(json["id"].toString() ?? "0"),
        type: json["type"]?.toString() ?? "",
        data: json["data"]?.toString() ?? "",
        notifiableId: json["notifiable_id"]?.toString() ?? "",
        createdAt: json["created_at"]?.toString() ?? "",
        updatedAt: json["updated_at"]?.toString() ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "data": data,
        "notifiable_id": notifiableId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
