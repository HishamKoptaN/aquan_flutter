// To parse this JSON data, do
//
//     final getNotificationsApiResModel = getNotificationsApiResModelFromJson(jsonString);

import 'dart:convert';

GetNotificationsApiResModel getNotificationsApiResModelFromJson(String str) =>
    GetNotificationsApiResModel.fromJson(json.decode(str));

String getNotificationsApiResModelToJson(GetNotificationsApiResModel data) =>
    json.encode(data.toJson());

class GetNotificationsApiResModel {
  bool status;
  List<Notification> notifications;

  GetNotificationsApiResModel({
    required this.status,
    required this.notifications,
  });

  factory GetNotificationsApiResModel.fromJson(Map<String, dynamic> json) =>
      GetNotificationsApiResModel(
        status: json["status"],
        notifications: List<Notification>.from(
            json["notifications"].map((x) => Notification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "notifications":
            List<dynamic>.from(notifications.map((x) => x.toJson())),
      };
}

class Notification {
  int id;
  String type;
  String message;
  String notifiableId;
  String createdAt;
  String updatedAt;

  Notification({
    required this.id,
    required this.type,
    required this.message,
    required this.notifiableId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        type: json["type"],
        message: json["message"],
        notifiableId: json["notifiable_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "message": message,
        "notifiable_id": notifiableId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
