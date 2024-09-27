import "dart:convert";
import "dart:io";
import "package:aquan/features/Auth/sign_up/controller/sign_up_controller.dart";
import "package:aquan/core/database/api/routes.dart";
import "package:http/http.dart" as http;

class PlanController {
  bool isChecked = false;
  Future<Map<String, dynamic>> getPlans() async {
    http.Response response = await http.get(
      Uri.parse(routes['plans']!),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> payPlan({
    required int id,
    required File file,
    required int method,
  }) async {
    var headers = await SignUpController.getAuthHeaders();
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://aquan.aquan.website/api/plans/$id'));
    request.fields.addAll(
      {
        'method': method.toString(),
      },
    );
    request.files.add(await http.MultipartFile.fromPath('image', file.path));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.toBytes();
    Map<String, dynamic> data = await jsonDecode(
      String.fromCharCodes(responseData),
    );
    return data;
  }

  Future<Map<String, dynamic>> getUserPlan(int id, File file) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("${routes['get_user_plan']!}/${id.toString()}"),
    );
    request.headers.addAll(await SignUpController.getAuthHeaders());
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    Map<String, dynamic> data = await jsonDecode(
      String.fromCharCodes(responseData),
    );
    return data;
  }

  Future<Map<String, dynamic>> getPaymentMethods() async {
    http.Response response = await http.get(
      Uri.parse(routes['plan_rates']!),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = await jsonDecode(response.body);
    return data;
  }
}
