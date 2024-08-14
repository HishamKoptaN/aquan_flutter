import 'dart:convert';
import 'package:aquan/app/sign_up/controller/auth_controller.dart';
import 'package:aquan/Helpers/routes.dart';
import 'package:http/http.dart' as http;

class NotificationsController {
  Future<Map<String, dynamic>> getNotifications() async {
    http.Response response = await http.get(
      Uri.parse(api['notifications']!),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }
    throw Exception(response.reasonPhrase);
  }
}