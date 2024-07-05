import "dart:convert";
import "dart:io";
import "package:aquan/app/sign_up/controller/auth_controller.dart";
import "package:aquan/Helpers/routes.dart";
import "package:aquan/app/Plans/model/plan.dart";
import "package:aquan/app/Auth/model/user.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class PlanController {
  bool isChecked = false;

  Future<Map<String, dynamic>> getPlans() async {
    http.Response response = await http.get(
      Uri.parse(auth['plans']!),
      headers: await AuthController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List plans = data['plans'];

      data['plans'] = plans
          .map(
            (plan) => Plan.fromJson(plan),
          )
          .toList();
      data['user'] = User.fromJson(data['user']);

      return data;
    }
    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> payPlan(int id, File file) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("${auth['plans']!}/${id.toString()}/proof"),
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
      Uri.parse("${auth['get_user_plan']!}/${id.toString()}"),
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

  Future<Map<String, String>> getUserPLanDetails() async {
    var headersList = <String, String>{};
    var url = Uri.parse('https://dash.aquan.website/api/user/plan/1');
    var req = http.Request('GET', url);
    req.headers.addAll(headersList);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      var data = jsonDecode(resBody);

      String startDate = data['data']['start_date'];
      String endDate = data['data']['end_date'];

      return {
        'startDate': startDate,
        'endDate': endDate,
      };
    } else {
      print(res.reasonPhrase);
      return {};
    }
  }
}
