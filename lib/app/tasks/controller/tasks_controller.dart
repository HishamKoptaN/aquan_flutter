import 'dart:convert';
import 'dart:io';
import 'package:aquan/app/sign_up/controller/auth_controller.dart';
import 'package:aquan/Helpers/routes.dart';
import 'package:http/http.dart' as http;

class TasksController {
  Future<Map<String, dynamic>> getTasks() async {
    http.Response response = await http.get(
      Uri.parse(api['tasks']!),
      headers: await AuthController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> getTaskDetails(int id) async {
    try {
      var headers = await AuthController.getAuthHeaders();
      var response = await http.get(
        Uri.parse('https://api.aquan.website/api/task/details/$id'),
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

  // Future<Map<String, dynamic>> getTaskDetails(int id) async {
  //   http.Response response = await http.get(
  //     Uri.parse(api['/task/details/']! + id.toString()),
  //     headers: await AuthController.getAuthHeaders(),
  //   );

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = jsonDecode(response.body);
  //     return data;
  //   }
  //   throw Exception(response.reasonPhrase);
  // }

  Future<Map<String, dynamic>> sendProof(int id, File file) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(
        "${api['tasks']!}${id.toString()}",
      ),
    );

    request.headers.addAll(
      await AuthController.getAuthHeaders(),
    );

    var pic = await http.MultipartFile.fromPath("image", file.path);
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
}
