import "dart:convert";
import "package:aquan/core/database/api/routes.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";
import "../../Auth/sign_up/data/controller/sign_up_controller.dart";
import "../data/model/dash_res_model.dart";

class DashboardController {
  Future<DashResModel> getDashboard() async {
    http.Response response = await http.get(
      Uri.parse(routes['dashboard']!),
      headers: await SignUpController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      return DashResModel.fromJson(
        jsonDecode(
          response.body,
        ),
      );
    }

    throw Exception(response.reasonPhrase);
  }
  // Future<Map<String, dynamic>> getDashboard() async {
  //   http.Response response = await http.get(
  //     Uri.parse(routes['dashboard']!),
  //     headers: await SignUpController.getAuthHeaders(),
  //   );
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = jsonDecode(response.body);
  //     return data;
  //   }
  //   throw Exception(response.reasonPhrase);
  // }

  Future<Map<String, dynamic>> services() async {
    http.Response response = await http.post(
      Uri.parse(routes['settings']!),
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

  Future<Map<String, dynamic>> loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userJson = prefs.getString('user');
    try {
      final Map<String, dynamic> userData =
          json.decode(userJson!) as Map<String, dynamic>;
      return userData;
    } catch (error) {
      return {"error": error};
    }
  }
}
