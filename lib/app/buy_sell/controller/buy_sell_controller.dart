import 'dart:convert';
import 'package:aquan/app/sign_up/controller/auth_controller.dart';
import 'package:aquan/Helpers/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/buy_sell_model.dart';

class BuySellController {
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController fromAmountController = TextEditingController();
  final TextEditingController toAmountController = TextEditingController();
  Currency? fromWallet;
  Currency? toWallet;
  double? rate;
  Future<Map<String, dynamic>> getCurrencies() async {
    const String apiUrl = 'https://api.aquan.website/api/buy-sell';
    http.Response response = await http.get(
      Uri.parse(apiUrl),
      headers: await AuthController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> transferMoney(
    int sourceWalletId,
    int destinationWalletId,
    int amount,
    double rate,
    String accountId,
    String receiverAccount,
  ) async {
    Map<String, dynamic> employeeData = await getEmolyeeId();
    int employeeId = employeeData["employee_id"];
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(api['buy_sell']!),
    );
    request.headers.addAll(await AuthController.getAuthHeaders());
    request.fields.addAll(
      {
        "amount": amount.toString(),
        "net_amount": amount.toString(),
        "rate": rate.toString(),
        "employee_id": employeeId.toString(),
        "source_wallet_id": sourceWalletId.toString(),
        "destination_wallet_id": destinationWalletId.toString(),
        "receiver_account": receiverAccount.toString(),
      },
    );

    // var pic = await http.MultipartFile.fromPath("file", file.path);
    // request.files.add(pic);
    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      Map<String, dynamic> data = jsonDecode(
        String.fromCharCodes(responseData),
      );
      return data;
    }
    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> getEmolyeeId() async {
    var request = http.Request(
      "GET",
      Uri.parse(api['get_employee_id']!),
    );
    request.headers.addAll(await AuthController.getAuthHeaders());
    var response = await request.send();
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> data = json.decode(responseBody);
      return data;
    }

    throw Exception(response.reasonPhrase);
  }
}
