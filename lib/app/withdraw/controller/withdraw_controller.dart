import 'dart:convert';

import 'package:aquan/app/sign_up/controller/auth_controller.dart';
import 'package:aquan/Helpers/routes.dart';
import 'package:http/http.dart' as http;

class WithdrawController {
  Future<Map<String, dynamic>> getWithdraws() async {
    http.Response response = await http.get(
      Uri.parse(api['withdraws']!),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> getCurrencies() async {
    http.Response response = await http.get(
      Uri.parse(api['currencies']!),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> withdrawMoney(
    double amount,
    String information,
    String wallet,
  ) async {
    http.Response response = await http.post(
      Uri.parse(api['withdraw']!),
      headers: await AuthController.getAuthHeaders(),
      body: jsonEncode(
        {
          "amount": amount.toString(),
          "wallet_info": information,
          "destination_wallet": wallet.toString(),
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
