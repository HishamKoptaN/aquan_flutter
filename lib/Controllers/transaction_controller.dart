import 'dart:convert';

import 'package:aquan/Controllers/auth_controller.dart';
import 'package:aquan/Helpers/routes.dart';
import 'package:http/http.dart' as http;

class TransactionController {
  Future<Map<String, dynamic>> getTransactions() async {
    http.Response response = await http.get(
      Uri.parse(auth['transactions']!),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }
}
