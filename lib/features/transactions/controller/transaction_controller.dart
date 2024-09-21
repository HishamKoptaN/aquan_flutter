import 'dart:convert';

import 'package:aquan/features/Auth/sign_up/controller/sign_up_controller.dart';
import 'package:aquan/Helpers/routes.dart';
import 'package:http/http.dart' as http;

class TransactionController {
  Future<Map<String, dynamic>> getTransactions() async {
    http.Response response = await http.get(
      Uri.parse(api['transactions']!),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }
}
