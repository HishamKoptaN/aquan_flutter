import 'dart:convert';
import 'dart:io';

import 'package:aquan/app/sign_up/controller/auth_controller.dart';
import 'package:aquan/Helpers/routes.dart';
import 'package:http/http.dart' as http;

class CurrencyController {
  Future<Map<String, dynamic>> getCurrencies() async {
    http.Response response = await http.get(
      Uri.parse(auth['currencies']!),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> transferMoney(
    int sWallet,
    int dWallet,
    double amount,
    String accountId,
    File file,
  ) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(auth['transfer']!),
    );

    request.headers.addAll(await AuthController.getAuthHeaders());
    request.fields.addAll({
      "source_wallet": sWallet.toString(),
      "destination_wallet": dWallet.toString(),
      "amount": amount.toString(),
      "address": accountId,
    });

    var pic = await http.MultipartFile.fromPath("file", file.path);
    request.files.add(pic);

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
}
