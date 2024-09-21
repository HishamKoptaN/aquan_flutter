import 'dart:convert';
import 'dart:io';
import 'package:aquan/features/Auth/sign_up/controller/sign_up_controller.dart';
import 'package:aquan/Helpers/routes.dart';
import 'package:http/http.dart' as http;

class BuySellController {
  Future<Map<String, dynamic>> getCurrencies() async {
    const String apiUrl = 'https://aquan.aquan.website/api/buy-sell';
    http.Response response = await http.get(
      Uri.parse(apiUrl),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = json.decode(response.body);
    return data;
  }

  double calculateAmount({
    required double rate,
    required String currencyCode,
    required double amount,
  }) {
    double resultAmount = 0;
    if (currencyCode == 'SDG') {
      resultAmount = amount / rate;
    }
    if (currencyCode == 'USDT') {
      resultAmount = amount * rate;
    }
    if (currencyCode == 'USD') {
      resultAmount = amount * rate;
    }
    return resultAmount;
  }

  Future<Map<String, dynamic>> getReceivedAccountNumber(
      {required int id}) async {
    var request = http.Request(
      'GET',
      Uri.parse('https://aquan.aquan.website/api/buy-sell/$id'),
    );
    http.StreamedResponse streamedResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamedResponse);
    return await jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> transferMoney({
    required int senderCurrencyId,
    required int receiverCurrencyId,
    required String amount,
    required double netAmount,
    required double rate,
    required String receiverAccount,
    required int employeeId,
    required File? file,
  }) async {
    var headers = await SignUpController.getAuthHeaders();
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://aquan.aquan.website/api/buy-sell'));
    request.fields.addAll(
      {
        'sender_currency_id': senderCurrencyId.toString(),
        'receiver_currency_id': receiverCurrencyId.toString(),
        'amount': amount,
        'net_amount': netAmount.toString(),
        'rate': rate.toString(),
        'receiver_account': receiverAccount,
        'employee_id': employeeId.toString(),
      },
    );
    request.files.add(await http.MultipartFile.fromPath('image', file!.path));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.toBytes();
    Map<String, dynamic> data = await jsonDecode(
      String.fromCharCodes(responseData),
    );
    return data;
  }

  Future<Map<String, dynamic>> getEmolyeeId() async {
    var request = http.Request(
      "GET",
      Uri.parse(api['get_employee_id']!),
    );
    request.headers.addAll(await SignUpController.getAuthHeaders());
    var response = await request.send();
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> data = await json.decode(responseBody);
      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> getUserByAccount(String accountId) async {
    http.Response response = await http.get(
      Uri.parse(api['account']! + accountId),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = await jsonDecode(response.body);
    return data;
  }
}
