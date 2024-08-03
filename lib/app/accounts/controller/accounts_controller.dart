import "dart:convert";

import "package:aquan/app/sign_up/controller/auth_controller.dart";
import "package:aquan/Helpers/routes.dart";
import "package:http/http.dart" as http;
import "../model/accounts_model.dart";

class AccountsController {
  Future<Map<String, dynamic>> getAccounts() async {
    http.Response response = await http.get(
      Uri.parse(api['user_accounts']!),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> updateAccounts(
      List<AccountInfo> accountInfo) async {
    print(accountInfo);
    http.Response response = await http.post(
      Uri.parse(api['update_accounts_user']!),
      body: jsonEncode({'accountInfo': accountInfo}),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }

    throw Exception(response.reasonPhrase);
  }
}
