import "dart:convert";

import "package:aquan/Controllers/auth_controller.dart";
import "package:aquan/Helpers/routes.dart";
import "package:http/http.dart" as http;

class WalletController {
  Future<Map<String, dynamic>> getWallets() async {
    http.Response response = await http.get(
      Uri.parse(auth['wallets']!),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }
}
