// To parse this JSON data, do
//
//     final auth = authFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
import 'user.dart';
part 'auth.freezed.dart';
part 'auth.g.dart';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));
String authToJson(Auth data) => json.encode(data.toJson());

@freezed
class Auth with _$Auth {
  const factory Auth({
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "user") User? user,
  }) = _Auth;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
