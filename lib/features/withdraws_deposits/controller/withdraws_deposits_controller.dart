import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../core/database/api/routes.dart';

class WithdrawsDepositsController {
  Future<Map<String, dynamic>>? data;

  Future<Map<String, dynamic>> getWithdrawsDeposits() async {
    return data!;
  }
}
