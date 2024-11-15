import 'dart:convert';
import '../../Auth/sign_up/data/controller/sign_up_controller.dart';
import 'package:aquan/core/database/api/routes.dart';
import 'package:http/http.dart' as http;

class WithdrawController {
  Future<Map<String, dynamic>> getWithdraws() async {
    http.Response response = await http.get(
      Uri.parse(routes['withdraw']!),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = await jsonDecode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> getWithdrawRates() async {
    http.Response response = await http.get(
      Uri.parse(routes['withdraw_rates']!),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = await jsonDecode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> withdrawMoney({
    required int method,
    required double amount,
    required String receivingAccountNumber,
  }) async {
    var headers = await SignUpController.getAuthHeaders();
    var request = http.Request(
        'POST', Uri.parse('https://api.aquan.website/app/withdraw'));
    request.body = json.encode(
      {
        "method": method,
        "amount": amount,
        "receiving_account_number": receivingAccountNumber
      },
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.toBytes();
    Map<String, dynamic> data = await jsonDecode(
      String.fromCharCodes(responseData),
    );
    return data;
  }
}
