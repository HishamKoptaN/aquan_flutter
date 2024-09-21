import 'dart:convert';

GetReferalsApiResModel getReferalsApiResModelFromJson(String str) =>
    GetReferalsApiResModel.fromJson(json.decode(str));

String getReferalsApiResModelToJson(GetReferalsApiResModel data) =>
    json.encode(data.toJson());

class GetReferalsApiResModel {
  bool status;
  List<User> users;
  dynamic user;

  GetReferalsApiResModel({
    required this.status,
    required this.users,
    required this.user,
  });

  factory GetReferalsApiResModel.fromJson(Map<String, dynamic> json) =>
      GetReferalsApiResModel(
        status: json["status"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "user": user,
      };
}

class User {
  String name;
  String email;

  User({
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}
