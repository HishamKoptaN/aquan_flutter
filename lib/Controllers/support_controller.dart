import 'dart:convert';
import 'dart:io';

import 'package:aquan/Controllers/auth_controller.dart';
import 'package:aquan/Helpers/routes.dart';
import 'package:http/http.dart' as http;

class SupportController {
  Future<Map<String, dynamic>> getQuestions() async {
    http.Response response = await http.post(
      Uri.parse(auth['settings']!),
      headers: await AuthController.getAuthHeaders(),
      body: jsonEncode(
        {
          "setting_name": "questions",
        },
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> getChatMessages() async {
    http.Response response = await http.get(
      Uri.parse(auth['support']!),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> sendMessage(dynamic message) async {
    if (message is File) {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse(auth['support']!),
      );

      request.headers.addAll(await AuthController.getAuthHeaders());

      var pic = await http.MultipartFile.fromPath("message", message.path);
      request.files.add(pic);
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        Map<String, dynamic> data = jsonDecode(
          String.fromCharCodes(responseData),
        );

        return data;
      }

      throw Exception(response.reasonPhrase);
    }

    if (message is String) {
      http.Response response = await http.post(
        Uri.parse(auth['support']!),
        headers: await AuthController.getAuthHeaders(),
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
}
