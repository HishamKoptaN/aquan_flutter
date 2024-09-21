import "dart:convert";

import "package:aquan/Helpers/routes.dart";
import "package:http/http.dart" as http;

import "../../Auth/sign_up/controller/sign_up_controller.dart";
import "../data/models/accounts_model.dart";

class AccountsController {
  Future<Map<String, dynamic>> getAccounts() async {
    http.Response response = await http.get(
      Uri.parse(api['accounts']!),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = await jsonDecode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> updateAccounts({
    required GetUserAccounts getUserAccounts,
  }) async {
    final accountsInfo =
        getUserAccounts.accounts.map((account) => account.toJson()).toList();
    http.Response response = await http.patch(
      Uri.parse(api['accounts']!),
      body: jsonEncode(
        {
          'accounts': accountsInfo,
        },
      ),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }
}
