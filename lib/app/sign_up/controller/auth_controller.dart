import 'dart:convert';

import 'package:aquan/Helpers/routes.dart';
import 'package:aquan/Helpers/storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth/model/user.dart';
import '../../profile/model/profile_model.dart';

class AuthController {
  Future<Map<String, dynamic>> login(String? email, String? password) async {
    http.Response response = await http.post(
      Uri.parse(api['login']!),
      body: {
        'email': email.toString(),
        'password': password.toString(),
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> signUp(
    String name,
    String address,
    String phone,
    String email,
    String password,
    String passwordConfirmation,
    String? code,
  ) async {
    http.Response response = await http.post(
      Uri.parse(api['register']!),
      body: {
        'email': email.toString(),
        'password': password.toString(),
        "name": name.toString(),
        "address": address.toString(),
        "phone": phone.toString(),
        "password_confirmation": passwordConfirmation.toString(),
        "code": code.toString(),
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> completeSignUp(
    String password,
    String passwordConfirmation,
    String? code,
  ) async {
    http.Response response = await http.post(
      Uri.parse(api['auth-google-complete']!),
      body: jsonEncode({
        'password': password.toString(),
        "password_confirmation": passwordConfirmation.toString(),
        "code": code.toString(),
      }),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }
    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> isLogedIn(String? token) async {
    http.Response response = await http.post(
      Uri.parse(api['check']!),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  static Future<Map<String, String>> getAuthHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${prefs.getString('auth_token')}',
      'Locale': Storage.getString('language') ?? 'ar'
    };
  }

  Future<Map<String, dynamic>> resetPassword(String email) async {
    http.Response response = await http.post(
      Uri.parse(api["password"]["reset"]!),
      body: {"email": email},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> getProfileUser() async {
    http.Response response = await http.get(
      Uri.parse(api['user']!),
      headers: await AuthController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      data['user'] = User.fromJson(data['user']);
      return data;
    }
    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> sendCodeToEmail(String email) async {
    http.Response response = await http.post(
      Uri.parse(api["send-code-to-email"]!),
      headers: await AuthController.getAuthHeaders(),
      body: jsonEncode({"email": email}),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }
    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> signInWithGoogle(
      String email, String name) async {
    http.Response response = await http.post(
      Uri.parse(api["auth-google"]!),
      headers: await AuthController.getAuthHeaders(),
      body: jsonEncode(
        {
          "email": email,
          "name": name,
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
