import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../Helpers/routes.dart';
import '../../Auth/sign_up/controller/sign_up_controller.dart';

class SendToAccountController {
  Future<Map<String, dynamic>> getUserByAccountNumber(
      String accountNumber) async {
    http.Response response = await http.get(
      Uri.parse(
        '${api['transfer']}/$accountNumber',
      ),
      headers: await SignUpController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }
  }

  Future<Map<String, dynamic>> sendMoneyToAccount(
    String accountNumber,
    String amount,
  ) async {
    var headers = await SignUpController.getAuthHeaders();
    var request = http.Request('POST',
        Uri.parse('https://aquan.aquan.website/api/transfer/$accountNumber'));
    request.body = json.encode(
      {"amount": amount},
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
