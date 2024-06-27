import 'dart:convert';
import 'dart:io';

import 'package:aquan/app/sign_up/auth_controller.dart';
import 'package:aquan/Helpers/routes.dart';
import 'package:http/http.dart' as http;

import '../model/task.dart';

class TasksController {
  Future<List<Task>> getTasks() async {
    http.Response response = await http.get(
      Uri.parse(auth['tasks']!),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      List tasks = data['tasks'];

      return tasks.map((task) => Task.fromJson(task)).toList();
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> getTaskDetails(int id) async {
    http.Response response = await http.get(
      Uri.parse(auth['task']! + id.toString()),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      Task task = Task.fromJson(data['task']);

      return {
        'status': data['status'],
        'task': task,
        'completed': data['completed'],
      };
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> sendProof(int id, File file) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("${auth['task']!}${id.toString()}/proof"),
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
