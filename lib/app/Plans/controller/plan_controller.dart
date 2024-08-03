import "dart:convert";
import "dart:io";
import "package:aquan/app/sign_up/controller/auth_controller.dart";
import "package:aquan/Helpers/routes.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";

class PlanController {
  bool isChecked = false;

  Future<Map<String, dynamic>> getPlans() async {
    http.Response response = await http.get(
      Uri.parse(api['plans']!),
      headers: await AuthController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }
    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> payPlan(int id, File file) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("${api['plans']!}/proof/${id.toString()}"),
    );

    request.headers.addAll(await AuthController.getAuthHeaders());

    var pic = await http.MultipartFile.fromPath("image", file.path);
    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      Map<String, dynamic> data = jsonDecode(
        String.fromCharCodes(responseData),
      );

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> getUserPlan(int id, File file) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("${api['get_user_plan']!}/${id.toString()}"),
    );
    request.headers.addAll(await AuthController.getAuthHeaders());
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      Map<String, dynamic> data = jsonDecode(
        String.fromCharCodes(responseData),
      );

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> getPaymentMethods() async {
    http.Response response = await http.get(
      Uri.parse(api['settings']!),
      headers: await AuthController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }
    throw Exception(response.reasonPhrase);
  }
}
