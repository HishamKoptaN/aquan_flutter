import 'dart:convert';
import 'dart:io';
import '../../Auth/sign_up/data/controller/sign_up_controller.dart';
import 'package:aquan/core/database/api/routes.dart';
import 'package:http/http.dart' as http;

import '../model/support_model.dart';

class SupportController {
  Future<List<Message>> fetchData() async {
    final response = await http.get(
      Uri.parse(
        'https://api.aquan.website/app/support',
      ),
      headers: await SignUpController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      GetSupportApiResModel getSupportApiResModel =
          GetSupportApiResModel.fromJson(data);
      return getSupportApiResModel.messages ?? [];
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> sendMessage(dynamic message) async {
    if (message is File) {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse(routes['support']!),
      );
      request.headers.addAll(await SignUpController.getAuthHeaders());
      var pic = await http.MultipartFile.fromPath("message", message.path);
      request.files.add(pic);
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        Map<String, dynamic> data = await jsonDecode(
          String.fromCharCodes(responseData),
        );
        return data;
      }
      throw Exception(response.reasonPhrase);
    }
    if (message is String) {
      http.Response response = await http.post(
        Uri.parse(routes['support']!),
        headers: await SignUpController.getAuthHeaders(),
        body: jsonEncode(
          {
            "message": message,
          },
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      }
      throw Exception(response.reasonPhrase);
    }
    throw Exception("Error try again later");
  }

  Future<Map<String, dynamic>> sendFile(dynamic message) async {
    if (message is File) {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse(routes['support']!),
      );
      request.headers.addAll(await SignUpController.getAuthHeaders());
      var pic = await http.MultipartFile.fromPath("message", message.path);
      request.files.add(pic);
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        Map<String, dynamic> data = await jsonDecode(
          String.fromCharCodes(responseData),
        );
        return data;
      }
      throw Exception(response.reasonPhrase);
    }

    throw Exception("Error try again later");
  }
}
