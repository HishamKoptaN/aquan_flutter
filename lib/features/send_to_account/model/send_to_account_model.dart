import 'dart:convert';

GetUserByAccountApiResModel getUserByAccountApiResModelFromJson(String str) =>
    GetUserByAccountApiResModel.fromJson(json.decode(str));
String getUserByAccountApiResModelToJson(GetUserByAccountApiResModel data) =>
    json.encode(data.toJson());

class GetUserByAccountApiResModel {
  bool? status;
  String? name;

  GetUserByAccountApiResModel({
    this.status,
    this.name,
  });

  factory GetUserByAccountApiResModel.fromJson(Map<String, dynamic> json) =>
      GetUserByAccountApiResModel(
        status: json["status"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "name": name,
      };
}
