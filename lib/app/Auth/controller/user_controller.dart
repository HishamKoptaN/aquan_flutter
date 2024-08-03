import 'dart:convert';
import 'dart:io';
import 'package:aquan/app/sign_up/controller/auth_controller.dart';
import 'package:aquan/Helpers/routes.dart';
import 'package:http/http.dart' as http;
import '../../profile/model/profile_model.dart';
import '../model/user.dart';

class UserController {
  Future<Map<String, dynamic>> getReferals() async {
    http.Response response = await http.get(
      Uri.parse(api['referals']!),
      headers: await AuthController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List users = data['users'];
      data['users'] = users.map((user) => User.fromJson(user)).toList();
      data['user'] = User.fromJson(data['user']);
      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> updateProfilePicture(File file) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(api['user_update_image']!),
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

      data['user'] = User.fromJson(
        data['user'],
      );

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> changePasswordUser(
    String currentPassword,
    String newPassword,
    String newPasswordConfirmation,
  ) async {
    http.Response response = await http.post(
      Uri.parse(api['change-password']!),
      body: jsonEncode(
        {
          'currentPassword': currentPassword,
          'newPassword': newPassword,
          'newPassword_confirmation': newPasswordConfirmation,
        },
      ),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      if (data['status']) {
        data['user'] = User.fromJson(data['user']);
      }

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> getUserByAccount(String accountId) async {
    http.Response response = await http.get(
      Uri.parse(api['account']! + accountId),
      headers: await AuthController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }
}
