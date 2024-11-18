import 'dart:convert';
import 'dart:io';

import '../../Auth/sign_up/data/controller/sign_up_controller.dart';
import 'package:aquan/core/database/api/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DepositController {
  Future<Map<String, dynamic>> getDeposits() async {
    http.Response response = await http.get(
      Uri.parse(routes['deposit']!),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> depositMoney({
    required File file,
    required TextEditingController amount,
    required int method,
    required int employeeId,
  }) async {
    var headers = await SignUpController.getAuthHeaders();
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
        'https://api.aquan.website/app/deposit',
      ),
    );
    request.fields.addAll(
      {
        'amount': amount.text,
        'method': method.toString(),
        'employee_id': employeeId.toString()
      },
    );
    request.files.add(await http.MultipartFile.fromPath('image', file.path));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.toBytes();
    Map<String, dynamic> data = await jsonDecode(
      String.fromCharCodes(responseData),
    );
    return data;
  }

  Future<Map<String, dynamic>> getPaymentMethods() async {
    http.Response response = await http.get(
      Uri.parse(routes['deposit_rates']!),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = jsonDecode(response.body);

    return data;
  }
}
