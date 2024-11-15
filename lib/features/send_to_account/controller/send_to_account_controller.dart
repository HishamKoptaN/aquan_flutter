import 'dart:async';
import 'dart:convert';
import 'package:aquan/core/Helpers/shared_pref_helper.dart';
import 'package:http/http.dart' as http;
import '../../../core/database/api/routes.dart';
import '../../Auth/sign_up/data/controller/sign_up_controller.dart';

class SendToAccountController {
  Future<Map<String, dynamic>> getUserByAccountNumber(
      String accountNumber) async {
    http.Response response = await http.get(
      Uri.parse(
        '${routes['transfer']}/$accountNumber',
      ),
      // headers: await SharedPrefHelper.getAuthHeaders(),
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
        Uri.parse('https://api.aquan.website/app/transfer/$accountNumber'));
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
