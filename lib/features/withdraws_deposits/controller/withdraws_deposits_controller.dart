import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../Helpers/routes.dart';
import '../../Auth/sign_up/controller/sign_up_controller.dart';

class WithdrawsDepositsController {
  Future<Map<String, dynamic>> getWithdrawsDeposits() async {
    http.Response response = await http.get(
      Uri.parse(api['withdraws_deposits']!),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }
}
