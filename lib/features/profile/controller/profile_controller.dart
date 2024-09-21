import 'dart:convert';
import 'dart:io';
import 'package:aquan/features/Auth/sign_up/controller/sign_up_controller.dart';
import 'package:aquan/Helpers/routes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController {
  Future<Map<String, dynamic>> loadUserProfileLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userJson = prefs.getString('user');
    if (userJson != null) {
      try {
        final Map<String, dynamic> userData =
            json.decode(userJson) as Map<String, dynamic>;
        return userData;
      } catch (e) {
        return {};
      }
    } else {
      return {};
    }
  }

  Future<Map<String, dynamic>> getProfileUser() async {
    http.Response response = await http.get(
      Uri.parse(api['user']!),
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> updateProfilePicture({
    required File file,
  }) async {
    var headers = await SignUpController.getAuthHeaders();
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(api['profile']!),
    );
    request.headers.addAll(headers);
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        file.path,
      ),
    );
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.toBytes();
    Map<String, dynamic> data = await jsonDecode(
      String.fromCharCodes(responseData),
    );
    return data;
  }

  Future<Map<String, dynamic>> updateProfileUser(
    String name,
    String address,
    String phone,
  ) async {
    http.Response response = await http.patch(
      Uri.parse(api['profile']!),
      headers: await SignUpController.getAuthHeaders(),
      body: jsonEncode(
        {
          'name': name,
          'address': address,
          'phone': phone,
        },
      ),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
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
      headers: await SignUpController.getAuthHeaders(),
    );
    Map<String, dynamic> data = jsonDecode(response.body);

    return data;
  }
}