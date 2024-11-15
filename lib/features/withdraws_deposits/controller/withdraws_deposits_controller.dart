import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../core/database/api/routes.dart';
import '../../Auth/sign_up/data/controller/sign_up_controller.dart';

class WithdrawsDepositsController {
  Future<Map<String, dynamic>> getWithdrawsDeposits() async {
    http.Response response = await http.get(
      Uri.parse(routes['withdraws_deposits']!),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }
}
