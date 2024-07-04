import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class SendToAccountController {
  TextEditingController accountNumbertextEditingController =
      TextEditingController();

  String amount = "";
  bool loading = false;

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
      print('Camera permission denied');
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
}
