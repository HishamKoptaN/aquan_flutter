import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../Helpers/routes.dart';
import '../../Auth/sign_up/controller/sign_up_controller.dart';

class VerifyEmailController {
  Future<Map<String, dynamic>> verifyEmail(String code) async {
    http.Response response = await http.post(
      Uri.parse(api["confirm-email"]!),
      headers: await SignUpController.getAuthHeaders(),
      body: jsonEncode({"code": code}),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }
    throw Exception(response.reasonPhrase);
  }
}
