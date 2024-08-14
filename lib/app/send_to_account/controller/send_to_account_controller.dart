import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../Helpers/routes.dart';
import '../../sign_up/controller/auth_controller.dart';

class SendToAccountController {
  TextEditingController accountNumbertextEditingController =
      TextEditingController();

  String amount = "";
  bool loading = false;
  Future<Map<String, dynamic>> getUserByAccount(String accountId) async {
    http.Response response = await http.get(
      Uri.parse(api['transfer']! + accountId),
      headers: await AuthController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<String> scan() async {
    PermissionStatus permission = await Permission.camera.request();
    if (permission.isGranted) {
      try {
        String? barcode = await scanner.scan();
        if (barcode != null) {
          accountNumbertextEditingController.text = barcode;
          return barcode;
        } else {
          return '';
        }
      } catch (e) {
        return 'Error during barcode scanning: $e';
      }
    } else if (permission.isDenied) {
      return 'Camera permission denied';
    } else if (permission.isPermanentlyDenied) {
      openAppSettings();
      return 'Camera permission permanently denied. Please enable it from settings.';
    }
    return "";
  }

  String getBarcodeValue() {
    return accountNumbertextEditingController.text;
  }

  Future<Map<String, dynamic>> sendMoneyToAccount(
    String accountId,
    String amount,
  ) async {
    http.Response response = await http.post(
      Uri.parse(api['transfer ']! + accountId),
      headers: await AuthController.getAuthHeaders(),
      body: jsonEncode(
        {
          'amount': amount,
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
