import 'dart:convert';
import 'package:aquan/core/database/api/routes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../profile/model/profile_model.dart';

class SignUpController {
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
      Uri.parse(routes['register']!),
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
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> completeSignUp(
    String password,
    String passwordConfirmation,
    String? code,
  ) async {
    http.Response response = await http.post(
      Uri.parse(routes['auth-google-complete']!),
      body: jsonEncode(
        {
          'password': password.toString(),
          "password_confirmation": passwordConfirmation.toString(),
          "code": code.toString(),
        },
      ),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> isLogedIn(String? token) async {
    http.Response response = await http
        .post(
          Uri.parse(routes['check']!),
          headers: await SignUpController.getAuthHeaders(),
        )
        .timeout(
          const Duration(seconds: 10),
        );

    Map<String, dynamic> data = await jsonDecode(response.body);
    return data;
  }

  static Future<Map<String, String>> getAuthHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${prefs.getString('auth_token')}',
      // 'Locale': Storage.getString('language') ?? 'ar'
    };
  }

  Future<Map<String, dynamic>> resetPassword(String email) async {
    http.Response response = await http.post(
      Uri.parse(routes["password"]["reset"]!),
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
      Uri.parse(routes['user']!),
      headers: await SignUpController.getAuthHeaders(),
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
      Uri.parse(routes["send-code-to-email"]!),
      headers: await SignUpController.getAuthHeaders(),
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
      Uri.parse(routes["auth-google"]!),
      headers: await SignUpController.getAuthHeaders(),
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
