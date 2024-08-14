import 'dart:convert';
import 'package:aquan/app/sign_up/controller/auth_controller.dart';
import 'package:aquan/Helpers/routes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController {
  Future<Map<String, dynamic>> loadUserProfileLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userJson = prefs.getString('user');
    if (userJson != null) {
      try {
        final Map<String, dynamic> userData =
            json.decode(userJson) as Map<String, dynamic>;
        return userData;
      } catch (e) {
        return {};
      }
    } else {
      return {};
    }
  }

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
