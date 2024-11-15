import 'dart:convert';
import 'package:aquan/core/database/api/routes.dart';
import 'package:http/http.dart' as http;
import '../../sign_up/data/controller/sign_up_controller.dart';
import '../data/models/login_request_body.dart';

class LoginController {
  Future<Map<String, dynamic>> login(
      {required LoginRequestBody loginRequestBody}) async {
    http.Response response = await http.post(
      Uri.parse(routes['login']!),
      body: loginRequestBody,
    );
    Map<String, dynamic> data = jsonDecode(
      response.body,
    );
    return data;
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

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
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

  Future<Map<String, dynamic>> verifyEmail(String code) async {
    http.Response response = await http.post(
      Uri.parse(routes["confirm-email"]!),
      headers: await SignUpController.getAuthHeaders(),
      body: jsonEncode({"code": code}),
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
