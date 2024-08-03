import 'dart:convert';
import 'package:aquan/app/sign_up/controller/auth_controller.dart';
import 'package:aquan/Helpers/routes.dart';
import 'package:http/http.dart' as http;

class ProfileController {
  Future<Map<String, dynamic>> getProfileUser() async {
    http.Response response = await http.get(
      Uri.parse(api['user']!),
      headers: await AuthController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }
    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> updateProfileUser(
    String name,
    String address,
    String phone,
  ) async {
    http.Response response = await http.post(
      Uri.parse(api['profile_update']!),
      headers: await AuthController.getAuthHeaders(),
      body: jsonEncode(
        {
          'name': name,
          'address': address,
          'phone': phone,
        },
      ),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }

    throw Exception(response.reasonPhrase);
  }
}
