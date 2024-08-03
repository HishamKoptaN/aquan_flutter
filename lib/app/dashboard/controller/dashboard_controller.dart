import "dart:convert";

import "package:aquan/Helpers/routes.dart";
import "package:http/http.dart" as http;

import "../../sign_up/controller/auth_controller.dart";

class DashboardController {
  Future<Map<String, dynamic>> getDashboard() async {
    http.Response response = await http.get(
      Uri.parse(api['dashboard']!),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> services() async {
    http.Response response = await http.post(
      Uri.parse(api['settings']!),
      body: {
        'setting_name': 'services',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  // Future<Map<String, dynamic>> planPaymentMethods() async {
  //   http.Response response = await http.post(
  //     Uri.parse(auth['settings']!),
  //     body: {
  //       'setting_name': 'payment_methods',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = jsonDecode(response.body);

  //     return data;
  //   }

  //   throw Exception(response.reasonPhrase);
  // }
}
