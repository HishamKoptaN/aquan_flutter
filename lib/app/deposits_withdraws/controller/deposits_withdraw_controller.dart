import 'dart:convert';
import 'package:aquan/app/sign_up/controller/auth_controller.dart';
import 'package:http/http.dart' as http;

import '../../../Helpers/routes.dart';

class DepositWithdrawController {
  Future<Map<String, dynamic>> getDepositsWithdraws() async {
    http.Response response = await http.get(
      Uri.parse(api['deposits_withdraws']!),
      headers: await AuthController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }
    return {'status': false, 'error': 'Failed to fetch data'};
  }
}
