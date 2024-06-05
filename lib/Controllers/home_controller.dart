import "dart:convert";

import "package:aquan/Helpers/routes.dart";
import "package:http/http.dart" as http;

class HomeController {
  Future<Map<String, dynamic>> services() async {
    http.Response response = await http.post(
      Uri.parse(auth['settings']!),
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

  Future<Map<String, dynamic>> planPaymentMethods() async {
    http.Response response = await http.post(
      Uri.parse(auth['settings']!),
      body: {
        'setting_name': 'payment_methods',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }
}
