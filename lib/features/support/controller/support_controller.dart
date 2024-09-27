import 'dart:convert';
import 'dart:io';
import 'package:aquan/features/Auth/sign_up/controller/sign_up_controller.dart';
import 'package:aquan/core/database/api/routes.dart';
import 'package:http/http.dart' as http;

class SupportController {
  Future<Map<String, dynamic>> getQuestions() async {
    http.Response response = await http.post(
      Uri.parse(routes['settings']!),
      headers: await SignUpController.getAuthHeaders(),
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
    var headers = await SignUpController.getAuthHeaders();
    var request = http.Request(
      'GET',
      Uri.parse(
        'https://aquan.aquan.website/api/support',
      ),
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.toBytes();
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(
        String.fromCharCodes(responseData),
      );
      return data;
    } else {
      throw Exception(
          'Failed to send file: ${String.fromCharCodes(responseData)}');
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
