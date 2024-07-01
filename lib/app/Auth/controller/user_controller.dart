import 'dart:convert';
import 'dart:io';
import 'package:aquan/app/sign_up/auth_controller.dart';
import 'package:aquan/Helpers/routes.dart';
import 'package:http/http.dart' as http;
import '../model/user.dart';

class UserController {
  Future<Map<String, dynamic>> getReferals() async {
    http.Response response = await http.get(
      Uri.parse(auth['referals']!),
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

  Future<Map<String, dynamic>> getProfileUser() async {
    http.Response response = await http.get(
      Uri.parse(auth['user']!),
      headers: await AuthController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      data['user'] = User.fromJson(data['user']);
      return data;
    }
    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> getDashboard() async {
    http.Response response = await http.get(
      Uri.parse(auth['dashboard']!),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> changeProfileUser(
    String name,
    String address,
    String phone,
  ) async {
    http.Response response = await http.post(
      Uri.parse(auth['user']!),
      body: jsonEncode({
        'name': name,
        'address': address,
        'phone': phone,
      }),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      data['user'] = User.fromJson(data['user']);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> changeAccountInfo(
      List<AccountInfo> accountInfo) async {
    http.Response response = await http.post(
      Uri.parse(auth['user']!),
      body: jsonEncode({'accountInfo': accountInfo}),
      headers: await AuthController.getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      data['user'] = User.fromJson(data['user']);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> changeProfilePicture(File file) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(auth['user']!),
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

      data['user'] = User.fromJson(data['user']);

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
      Uri.parse(auth['change-password']!),
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
      Uri.parse(auth['account']! + accountId),
      headers: await AuthController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> sendMoneyToAccount(
    String accountId,
    String amount,
  ) async {
    http.Response response = await http.post(
      Uri.parse(auth['account']! + accountId),
      headers: await AuthController.getAuthHeaders(),
      body: jsonEncode(
        {
          'amount': amount,
        },
      ),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }

  Future<Map<String, dynamic>> getNotifications() async {
    http.Response response = await http.get(
      Uri.parse(auth['notifications']!),
      headers: await AuthController.getAuthHeaders(),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    }

    throw Exception(response.reasonPhrase);
  }
}
