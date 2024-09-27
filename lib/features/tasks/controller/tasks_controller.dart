import 'dart:convert';
import 'dart:io';
import 'package:aquan/features/Auth/sign_up/controller/sign_up_controller.dart';
import 'package:aquan/core/database/api/routes.dart';
import 'package:http/http.dart' as http;

class TasksController {
  Future<Map<String, dynamic>> getTasks() async {
    http.Response response = await http.get(
      Uri.parse(routes['tasks']!),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> getTaskDetails(int id) async {
    try {
      var headers = await SignUpController.getAuthHeaders();
      var response = await http.get(
        Uri.parse('https://aquan.aquan.website/api/tasks/$id'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception('Error fetching task details: $e');
    }
  }

  Future<Map<String, dynamic>> sendProof(int id, File file) async {
    var headers = await SignUpController.getAuthHeaders();
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://aquan.aquan.website/api/tasks/$id'));
    request.files.add(await http.MultipartFile.fromPath('image', file.path));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.toBytes();
    Map<String, dynamic> data = await jsonDecode(
      String.fromCharCodes(responseData),
    );
    return data;
  }
}
