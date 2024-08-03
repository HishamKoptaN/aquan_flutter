// To parse this JSON data, do
//
//     final checkApiRes = checkApiResFromJson(jsonString);

import 'dart:convert';

import '../../Auth/model/user.dart';
import '../../profile/model/profile_model.dart';

CheckApiRes checkApiResFromJson(String str) =>
    CheckApiRes.fromJson(json.decode(str));

String checkApiResToJson(CheckApiRes data) => json.encode(data.toJson());

class CheckApiRes {
  bool status;
  User user;

  CheckApiRes({
    required this.status,
    required this.user,
  });

  factory CheckApiRes.fromJson(Map<String, dynamic> json) => CheckApiRes(
        status: json["status"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user.toJson(),
      };
}
